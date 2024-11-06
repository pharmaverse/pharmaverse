library(dplyr)
library(glue)
library(yaml)
library(purrr)
library(tidyr)

#---- fetch people data ----
people_yamls <- list.files("data/people")
extract_person <- function(file) {
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
  
#---- generate HTML ----
create_wg <- function(data = people, filter, label) {
  html <- data %>%
    filter(grepl(filter,pharmaverse_roles)) %>%
      mutate(
        label = glue(
          '<img src="images/logos/{logo}" alt="" width = "30" height="30">  {name} '
        )
      ) %>%
      select(tail(names(.), 1)) %>%
      knitr::kable("html", escape = FALSE)
  # remove header
  gsub(" <thead>.*</thead>","",html)
}
  
html_wg <- glue("<h4>Council</h4>{create_wg(people,'council')}</br>")
  
# render --------  
cat(glue("{html_wg}"), file = "layouts/partials/contributors.html")
