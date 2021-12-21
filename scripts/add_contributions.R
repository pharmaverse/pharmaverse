library(dplyr)
library(GithubMetrics)
library(glue)
library(yaml)
library(purrr)
library(tidyr)

## WGs ------------------
  people_yamls <- list.files("data/people")
  
  extract_person <- function(file){
    
    person_list <- read_yaml(glue("data/people/{file}"))
    
    tibble(
      name = person_list$name,
      pharmaverse_roles = person_list$pharmaverse_roles,
      company = person_list$company,
      logo = person_list$company_logo
    )
  }
  
  extract_person("epijim.yaml")
  
  people <- people_yamls %>%
    map_df(extract_person)
  
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
          label =
            glue(
              '<img src="images/logos/{logo}" alt="" width = "30" height="30">  {name}')
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
    <h4>Data Engineering WG</h4>
    {create_wg(people,'data')}
    <h4>TLG and interactive tools WG</h4>
    {create_wg(people,'tlg')}
    <h4>Technology and templates WG</h4>
    {create_wg(people,'tech')}
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
    filter(!author %in% c(".gitconfig missing email","actions-user"))

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

cat(
  glue(
    "
    <! –– This file is written by scripts/add_contributors.R ––>
    {html_wg}
    
    </br>
    <h4>Website</h4>
    <p>Activity on the website and metadata is scraped automatically based on 
    contributions to the codebase <a href='https://github.com/orgs/pharmaverse/projects/3'>(to contribute click here)</a>
    {html_website}
    "
  )
  ,
  file = "layouts/partials/contributors.html")
