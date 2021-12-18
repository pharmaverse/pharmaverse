library(dplyr)
library(readr)
library(base64enc)
library(glue)

## What files do we have?

  files <- c(
    paste0("data/packages/",list.files("data/packages")),
    paste0("data/nonpharma/",list.files("data/nonpharma"))
  )
  
## External badges
  #logo <- base64encode("static/images/logo-14-14.png")
  logo <- "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"
  
  for (i in files) {
    i_pkg <- gsub(pattern = ".yaml",replacement = "",basename(i))
    
    png_url <- glue(
      "https://raster.shields.io/badge/pharmaverse-{i_pkg}-blue.svg?logo=data:image/png;base64,{logo}"
    )
    
    download.file(
      url = png_url,
      destfile = glue("static/shields/{i_pkg}.png")
    )
  }
  




## Internal badges

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
    if (!is.na(badge) & badge != "" & badge != "NA") {
      cat(
        paste0("\n",text,badge),
        file = file, append = TRUE)   
    }}
  }


  
  # write new line
  for (i in files){
    i_package <- gsub(pattern = ".yaml",replacement = "",basename(i))
    
    i_badge_cran <- badges %>% filter(name == i_package) %>% pull(badge_cran)
    i_badge_health <- badges %>% filter(name == i_package) %>% pull(badge_health)
    i_badge_contributors <- badges %>% filter(name == i_package) %>% pull(badge_contributors)
    i_badge_riskmetric <- badges %>% filter(name == i_package) %>% pull(badge_riskmetric)
    
  
    
    write_badge(i_badge_cran, i, "badge_cran: ")
    write_badge(i_badge_health, i, "badge_health: ")
    write_badge(i_badge_contributors, i, "badge_contributors: ")
    write_badge(i_badge_riskmetric, i, "badge_riskmetric: ")
  }


  