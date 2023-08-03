
# TODO: Curate yaml doc and hex links (riskmetric missing png - links to github.io pages)

library(yaml)
library(dplyr)
library(purrr)
library(rlist)


# Hexwall body ----

# Fetch files
yaml_files <- list.files(path = "data/packages",
                         full.names = TRUE)

# Process yaml info
ymlinfo <- map(yaml_files, \(x){
  
  this_info <- yaml::read_yaml(x)
  
  # Check for fields with missing info
  check_this_info <- sapply(this_info,is.null)
  
  # If missing then provide "TBD" - probably needs to be handled per use case in html
  this_info[check_this_info] <- "TBD"
  
  out_info <- this_info %>% 
    as_tibble() %>% 
    select(name,docs,hex,task,hexwall)
  
}) %>% rlist::list.stack(.)


# Function to generate hex grid from yaml info
hexgrid <- function(pkginfo) {

  hex_start <- '<ul id="hexGrid">'
  hex_end <- '</ul>'
  
  no_pkg <- nrow(pkginfo)
  
  hex_divs <- map(1:no_pkg, \(x){
    
    hexes <- c('<li class="hex">\n',
                 '  <div class="hexIn">\n',
                 glue::glue('    <a class="hexLink" href="{pkginfo[x,"docs"]}" target="_blank">\n'),
                 glue::glue('      <img src="{pkginfo[x,"hex"]}">\n'),
                 glue::glue('      <h5>{pkginfo[x,"name"]}</h5>\n'),
                 glue::glue('      <p>{pkginfo[x,"task"]}</p>\n'),
                 '    </a>\n',
                 '  </div>\n',
                 '</li>\n')
  }) %>% unlist()
  
  hex_out <- c(hex_start,hex_divs,hex_end)
  
  return(hex_out)
  
}

hex_body <- ymlinfo %>% 
  filter(hexwall == TRUE) %>% 
  hexgrid()

# Add styling
hex_style <- c("<style>",
               readLines("layouts/partials/hexwall.css"),
               "</style>")


vis_header <- c('<center><h2>',
                'pharmaverse is made up of 2 things',
                '</h2></center><br>')

hex_out <- c('<div class="row" style="width: 80%; margin-bottom: 150px">',
             # vis_header,
             '<div class="column" style="width: 45%;">',
             '<center><h3>Packages</h3></center><br>',
             hex_style,
             hex_body,
             '</div>',
             '<div class="column border-left" style="width: 45%;">',
             '<center><h3>People</h3></center>',
             '<iframe src="con.html"></iframe>',
             '</div>',
             '</div><br>')


# Store as html ----
cat(hex_out, file = "layouts/partials/hexwall.html")








