library(dplyr)
library(arrow)
library(base64enc)
library(glue)

## Get packages ---------

files_pharmaverse <- paste0("data/packages/",list.files("data/packages"))

## Get badges ---------

badges <- arrow::read_parquet(
  "https://openpharma.github.io/generate_badges/output/data.parquet"
  )

## Get ---------

# helper
  write_badge <- function(
    badge, file, text
  ){
    badge <- badge[1] #edge case issue - not a good hack
    if(is.na(badge)) return()
    if (!rlang::is_empty(badge)) {
    if (!is.na(badge) & badge != "" & badge != "NA") {
      cat(
        paste0(text,badge,"\n"),
        file = file, append = TRUE)   
    }}
  }

  
  # write new line
  for (i in files_pharmaverse){
    message(paste("i:",i))
    
    i_package <- gsub(pattern = ".yaml",replacement = "",basename(i))
    
    i_badge_cran <- badges %>% filter(name == i_package) %>% pull(badge_cran)
    i_badge_stars <- badges %>% filter(name == i_package) %>% pull(badge_stars)
    i_badge_contributors <- badges %>% filter(name == i_package) %>% pull(badge_contributors)
    
    message(paste("i_badge_cran:",i_badge_cran))
    
    write_badge(i_badge_cran, i, "badge_cran: ")
    write_badge(i_badge_stars, i, "badge_stars: ")
    write_badge(i_badge_contributors, i, "badge_contributors: ")
  }


  