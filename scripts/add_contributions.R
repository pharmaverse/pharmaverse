library(dplyr)
library(GithubMetrics)
library(glue)
library(yaml)
library(purrr)
library(tidyr)
library(readr)

## Data ------------------
  people_yamls <- list.files("data/people")
  
  extract_person <- function(file){
    
    person_list <- read_yaml(glue("data/people/{file}"))
    
    tibble(
      name = person_list$name,
      pharmaverse_roles = person_list$pharmaverse_roles,
      company = person_list$company,
      logo = person_list$company_logo,
      gh_handle = gsub(".yaml","",file)
    )
  }
  
  people <- people_yamls %>%
    map_df(extract_person)
# s3
  people_s3 <- read_csv(
    "https://openpharma.s3.us-east-2.amazonaws.com/people.csv",
    na = " "
  )
  
  people <- people %>%
    left_join(
      people_s3 %>% select(gh_handle = author,commits,repo_list),
      by = "gh_handle"
    )
  
  

## WGs ------------------  
  people_long <- people %>%
    select(name,pharmaverse_roles) %>%
    separate_rows(
      pharmaverse_roles
    )
  
# Generate HTML
  
  create_wg <- function(data = people, filter, label){
    html <- data %>%
      filter(grepl(filter,pharmaverse_roles)) %>%
        mutate(
          # contribution = if_else(
          #   is.na(commits) | is.na(repo_list),"",
          #   as.character(glue("(contributed {commits} commits to {repo_list})"))
          #   ),
          label =
            glue(
              '<img src="images/logos/{logo}" alt="" width = "30" height="30">  {name} ')
        ) %>%
        select(tail(names(.), 1)) %>%
        knitr::kable("html", escape = FALSE)
    # remove header
    gsub(" <thead>.*</thead>","",html)
  }
  
  html_wg <- glue(
    "
    <h4>Council</h4>
    {create_wg(people,'council')}
    </br>
    ")

  


## Website --------------
# get commits
  repo_all_commits <- gh_commits_get(
    c("pharmaverse/pharmaverse","openpharma/openpharma.github.io"),
    days_back = 365*10
  )

# Define contributions
  contributors <- repo_all_commits %>%
    group_by(author) %>%
    summarise(
      commits = n(),
      last_commit = max(datetime),
      first_commit = min(datetime)
    ) %>%
    mutate(
      last_commit = as.Date(last_commit),
      first_commit = as.Date(first_commit)
    ) %>%
    filter(!author %in% c(".gitconfig missing email","actions-user") & !is.na(author))

  contributors <- contributors %>%
    left_join(
      gh_user_get(contributors$author),
      by = c("author"="username")
    )

# Generate html for website
  html_website <- contributors %>%
    filter(!is.na(name)) %>%
    mutate(
      title =
        glue(
          '<img src="{avatar}" alt="" width = "30" height="30"> {name} ({author}): {commits} commits between {first_commit} and {last_commit}')
    ) %>%
    select(tail(names(.), 1)) %>%
    knitr::kable("html", escape = FALSE)
  
  html_website <- gsub(" <thead>.*</thead>","",html_website)

# Make all contributors
  pharmaverse <- gsub(".yaml","",list.files("data/packages"))
  
  html_all <- people_s3 %>%
    filter(pretty_name != "NA (NA)") %>%
    select(pretty_contributor,commits,repo_list) %>%
    separate_rows(repo_list, sep = " | ") %>%
    filter(repo_list %in% pharmaverse)  %>%
    group_by(pretty_contributor) %>%
    summarise(
      repo_list = paste(repo_list, collapse = ", "),
      repos = n()
      ) %>%
    na.omit %>%
    mutate(
      label = glue("{pretty_contributor} has contributed to {repo_list}")
    ) %>%
    arrange(-repos) %>%
    select(
      label
    ) 
  
  n_people <- nrow(html_all)
  
  html_all <- html_all %>%
    knitr::kable("html", escape = FALSE)
  
    html_all <- gsub(" <thead>.*</thead>","",html_all)
  
# render --------  
cat(
  glue(
    "
    {html_wg}
    
    "
  )
  ,
  file = "layouts/partials/contributors.html")
