# Retrieve and mutate package info ---------------------------------------------

# Fetch files
yaml_files <- list.files(path = "data/packages", full.names = TRUE)

# Process yaml info
packages <- map(yaml_files, \(x){
  
  this_info <- yaml::read_yaml(x)
  
  # Check for fields with missing info
  check_this_info <- sapply(this_info,is.null)
  
  # If missing then provide "TBD" - probably needs to be handled per use case in html
  this_info[check_this_info] <- "TBD"
  
  out_info <- this_info %>% 
    as_tibble() %>% 
    select(name,repo,docs,hex,task,hexwall)
  
}) %>% rlist::list.stack(.) %>% 
  filter(repo != "TBD") %>% 
  mutate(group = 2,
         shape = "image",
         label = name) %>% 
  rename(id = name,
         image = hex) %>% 
  select(id,repo,label,group,shape,image)


# get git commits from all repos
repo_all_commits <- gh_commits_get(
  packages$repo,
  days_back = 365*10
)

new_people <- repo_all_commits %>% 
  filter(!is.na(author)) %>% 
  select(full_name,author) %>% 
  distinct()

people_info <- new_people %>%
  left_join(
    gh_user_get(unique(new_people$author)),
    by = c("author" = "username")
  )

# Create dataset with people info that can be feed to visNetwork
people <- people_info %>% 
  mutate(id = author,
         label = case_when(
           is.na(name) ~ author,
           TRUE ~ paste(name,"(",author,")")),
         group = 1,
         shape = "image",
         image = avatar,
         repo_list = stringr::word(full_name, 2, sep = "/")) %>% 
  select(id,label,group,shape,image,repo_list) 

# Count the number of unique contributors
np <- length(unique(people$id))

# Collect nodes and adges ----------------------------------------------------------

nodes <- rbind(people %>% 
                 select(-repo_list) %>% 
                 distinct(),
               packages %>% 
                 select(-repo))

# Define the edges (connections between contributors and packages)
edges <- people %>% 
  select(id,repo_list) %>% 
  rename(from = repo_list,
         to = id)

# Define drop-down selection
dd_list <- packages$id

# Create the network visualization ---------------------------------------------
my_net <- visNetwork(nodes, edges, height = "700px", width = "100%") %>%
  visIgraphLayout() %>% 
    visNodes(
      shapeProperties = list(borderWidth = 3, shadow = TRUE),
      font = list(face = "Segoe UI", color = "#333", align = "center"),
      borderWidth = 0,  # new parameter to remove border
      borderWidthSelected = 0,  # set to 0 to remove all borders when node is selected
      shadow = TRUE,
      imagePadding = 10,
      size = 50  
    ) %>%
    visEdges(arrows = "from",
             smooth = FALSE) %>%
    visOptions(highlightNearest = list(enabled = T, hover = T),
               nodesIdSelection = list(enabled = TRUE,
                                       values = dd_list),
               autoResize = TRUE) %>%
    visLayout(randomSeed = 1234) %>%
    visInteraction(hover = TRUE)

visSave(my_net, file = file.path("layouts/partials/con.html"),
        selfcontained = FALSE)

