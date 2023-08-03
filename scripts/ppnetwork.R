

library(visNetwork)
library(htmlwidgets)
library(dplyr)
library(GithubMetrics)
library(glue)
library(yaml)
library(purrr)
library(tidyr)
library(readr)


# Retrieve and mutate people info ----------------------------------------------

# Retrieve people from S3
people <- read_csv("https://openpharma.s3.us-east-2.amazonaws.com/people.csv",na = " ",
                   show_col_types = FALSE) %>% 
  filter(pretty_name != "NA (NA)") %>% 
  mutate(group = 1,
         shape = "image") %>% 
  rename(id = author,
         label = pretty_name,
         image = avatar) %>% 
  select(id,label,group,shape,image,repo_list) 


# Retrieve and mutate package info ---------------------------------------------

# Fetch files
yaml_files <- list.files(path = "data/packages",
                         full.names = TRUE)

# Process yaml info
packages <- map(yaml_files, \(x){
  
  this_info <- yaml::read_yaml(x)
  
  # Check for fields with missing info
  check_this_info <- sapply(this_info,is.null)
  
  # If missing then provide "TBD" - probably needs to be handled per use case in html
  this_info[check_this_info] <- "TBD"
  
  out_info <- this_info %>% 
    as_tibble() %>% 
    select(name,docs,hex,task,hexwall)
  
}) %>% rlist::list.stack(.) %>% 
  # filter(hexwall == TRUE) %>% 
  mutate(group = 2,
         shape = "image",
         label = name) %>% 
  rename(id = name,
         image = hex) %>% 
  select(id,label,group,shape,image)


# Collect nodes and adges ----------------------------------------------------------

nodes <- rbind(people %>% 
                 filter(grepl(paste0(packages$id, collapse = "|"), repo_list)) %>% 
                 select(-repo_list),
               packages)

# Define the edges (connections between contributors and packages)
pharmaverse <- list.files("./data/packages") %>% 
  gsub(".yaml","",.)

edges <- people %>% 
  select(id,repo_list) %>% 
  separate_rows(repo_list, sep = " | ") %>%
  filter(repo_list %in% pharmaverse) %>% 
  rename(from = repo_list,
         to = id)

# Define drop-down selection
dd_list <- packages$id


# Create the network visualization ---------------------------------------------
my_net <- visNetwork(nodes, edges, height = "700px", width = "100%") %>%
    visNodes(
      shapeProperties = list(borderWidth = 3, shadow = TRUE),
      font = list(face = "Segoe UI", color = "#333", align = "center"),
      borderWidth = 0,  # new parameter to remove border
      borderWidthSelected = 0,  # set to 0 to remove all borders when node is selected
      shadow = TRUE,
      imagePadding = 10,
      size = 50  
    ) %>%
    visEdges(arrows = "from") %>%
    visOptions(highlightNearest = list(enabled = T, hover = T),
               nodesIdSelection = list(enabled = TRUE,
                                       values = dd_list),
               autoResize = TRUE) %>%
    visLayout(randomSeed = 1234) %>%
    visInteraction(hover = TRUE) 

visSave(my_net, file = file.path("layouts/partials/con.html"),
        selfcontained = FALSE)


# Now make it work in HUGO ----------------------------------------------------------
# Need to strip visNet HTML file to just body
vn_in <- readLines(con = "layouts/partials/con.html")
vn_in_body_range <- which(grepl("<body>|</body>",vn_in)) %>% 
  {seq.int(.[1] + 1, .[2] - 1, by = 1)}

vn_body <- vn_in[vn_in_body_range]

# Return just the body
cat(vn_body, file = "layouts/partials/con.html")




