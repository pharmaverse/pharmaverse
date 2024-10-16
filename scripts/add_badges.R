library(dplyr)
library(arrow)
library(base64enc)
library(glue)
library(gt)

## Get packages ---------

files_pharmaverse <- paste0("data/packages/",list.files("data/packages"))

## Get badges ---------

badges <- arrow::read_parquet(
  "https://openpharma.github.io/generate_badges/output/data.parquet"
  )

## Misc ---------

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


# Create data for badges  
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

# Make physical badges ----

# Uses epijim's shieldR
library(shieldR)

dir_shields <- "static/shields"
  
# check if a pkg has been removed!
removed <- unique(c(
  setdiff(
    gsub(".png","",list.files(dir_shields, pattern = "*.png")),
    gsub(pattern = ".yaml",replacement = "",basename(files_pharmaverse))
  ),
  setdiff(
    gsub(".svg","",list.files(dir_shields, pattern = "*.svg")),
    gsub(pattern = ".yaml",replacement = "",basename(files_pharmaverse))
  )
))

if(length(removed) > 0) {
  message("The following packages are no longer pharmaverse: ",
        paste(removed, collapse = ", "))
  
  file.remove(
    glue("{dir_shields}/{removed}.png")
  )
  file.remove(
    glue("{dir_shields}/{removed}.svg")
  )
}

# check if a pkg already exists
missing <- unique(c(
  setdiff(
    gsub(pattern = ".yaml",replacement = "",basename(files_pharmaverse)),
    gsub(".png","",list.files(dir_shields, pattern = "*.png"))
  ),
  setdiff(
    gsub(pattern = ".yaml",replacement = "",basename(files_pharmaverse)),
    gsub(".svg","",list.files(dir_shields, pattern = "*.svg"))
  )
))

if(length(missing) > 0) {
  message("The following packages are new to the pharmaverse: ",
          paste(missing, collapse = ", "))

  
  # render new badges
  for (i in missing) {

    shield_build(
      stub = "pharmaverse",
      label = i,
      logo = "static/images/logo-14-14.png",
      color = "blue",
      filename = glue("{dir_shields}/{i}")
    )
  }
}

  # Summarise badges
  all_badges <- gsub(".svg","",list.files(dir_shields, pattern = "*.svg"))
  
  tibble(
    Package = all_badges,
    Shield = glue('<img src="http://pharmaverse.org/shields/{all_badges}.svg">'),
    Markdown = glue('[<img src="http://pharmaverse.org/shields/{all_badges}.svg">](https://pharmaverse.org)')
    ) %>%
    gt() %>%
    fmt_markdown(columns = Shield) %>%
    # write so shortcode picks up (called 'shields')
    gtsave(filename = "layouts/shortcodes/shields.html")
