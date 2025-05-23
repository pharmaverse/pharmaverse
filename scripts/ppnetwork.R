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
  select(id, repo, label, group, shape, image)

# get git commits from all repos
git_stats <- create_gitstats() |>
    set_github_host(repos = packages$repo, token = Sys.getenv("GITHUB_PAT"))

repo_all_commits <- git_stats |>
  get_commits(
    since = Sys.Date() - 365 * 10
  )

new_people <- repo_all_commits %>% 
  filter(!is.na(author_login)) %>% 
  select(repository, author_login) %>% 
  distinct()

people_info <- new_people %>%
  left_join(
    get_users(git_stats, unique(new_people$author_login)),
    by = c("author_login" = "login")
  )

# Create dataset with people info that can be fed to visNetwork
people <- people_info %>% 
  mutate(id = author_login,
         label = case_when(
           is.na(name) ~ author_login,
           TRUE ~ paste(name,"(",author_login,")")
         ),
         group = 1,
         shape = "image",
         image = avatar_url,
         repo_list = repository) %>% 
  select(id, label, group, shape, image, repo_list) 

# Count the number of unique contributors
np <- length(unique(people$id))

# Collect nodes and adges ----------------------------------------------------------
# Define the nodes (contributors and packages)
nodes <- rbind(
  distinct(select(people, -repo_list)), 
  select(packages, -repo)
) |>
  mutate(image = ifelse(is.na(image), glue::glue("https://github.com/identicons/{id}.png"), image))

# Define the edges (connections between contributors and packages)
edges <-  select(people, id, repo_list) |>
  rename(from = repo_list, to = id)

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

