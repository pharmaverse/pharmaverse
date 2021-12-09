library(dplyr)
library(readr)

badges <- read_csv(
  "https://openpharma.s3.us-east-2.amazonaws.com/badges.csv",
  na = " "
  ) %>%
  mutate(
    name = basename(full_name)
  )

# helper
  write_badge <- function(
    badge, file, text
  ){
    if (!rlang::is_empty(badge)) {
    if (!is.na(badge) & badge != "") {
      cat(
        paste0("\n",text,badge),
        file = file, append = TRUE)   
    }}
  }

## What files do we have?

  files <- c(
    paste0("data/packages/",list.files("data/packages")),
    paste0("data/nonpharma/",list.files("data/nonpharma"))
  )
  
  # write new line
  for (i in files){
    i_package <- gsub(pattern = ".yaml",replacement = "",basename(i))
    
    i_badge_cran <- badges %>% filter(name == i_package) %>% pull(badge_cran)
    i_badge_health <- badges %>% filter(name == i_package) %>% pull(badge_health)
    i_badge_contributors <- badges %>% filter(name == i_package) %>% pull(badge_contributors)
    
  
    
    write_badge(i_badge_cran, i, "badge_cran: ")
    write_badge(i_badge_health, i, "badge_health: ")
    write_badge(i_badge_contributors, i, "badge_contributors: ")
  }


  