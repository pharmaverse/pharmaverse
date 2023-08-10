
library(yaml)
library(dplyr)
library(purrr)
library(rlist)
library(visNetwork)
library(htmlwidgets)
library(GithubMetrics)
library(glue)
library(tidyr)
library(readr)
library(htmltools)


# Hexwall ----------------------------------------------------------
# Fetch info and functions for hexwall
source("scripts/hexwall.R")

# Generate hex body
hex_body <- ymlinfo %>% 
  filter(hexwall == TRUE) %>% 
  hexgrid()


# Network ----------------------------------------------------------
# Generate HTML, CSS and JS for network
source("scripts/ppnetwork.R") # This source also generates the np (Number of people)

# Need to strip visNet HTML file to just body
vn_in <- readLines("layouts/partials/con.html")
vn_in_body_range <- which(grepl("<body>|</body>",vn_in)) %>% 
  {seq.int(.[1] + 1, .[2] - 1, by = 1)}

vn_body <- vn_in[vn_in_body_range] %>% 
  paste0(.,"\n")

# Return just the body
cat(vn_body, file = "layouts/partials/con.html")



# Add hex styling styling
hex_style <- c("<style>",
               readLines("layouts/partials/hexwall.css"),
               "</style>")


hex_out <- c('<div class="row" style="width: 80%; margin-bottom: 150px;">\n',
             '<div class="column" style="width: 45%;">\n',
             '<center><h3>Packages</h3></center><br>\n',
             hex_style,
             hex_body,
             '</div>\n',
             '<div class="column border-left" style="width: 45%; margin-bottom: 350px;">\n',
             glue('<center><h3>People ({np})</h3></center>\n'),
             "<script>\n",
             includeHTML("layouts/partials/con_files/htmlwidgets-1.6.2/htmlwidgets.js"), # js to make the network interactive
             includeHTML("layouts/partials/con_files/vis-9.1.0/vis-network.min.js"), # js to make the network interactive
             includeHTML("layouts/partials/con_files/visNetwork-binding-2.1.2/visNetwork.js"), # js to make the network interactive
             "</script>\n",
             "<style>\n",
             includeHTML("layouts/partials/con_files/vis-9.1.0/vis-network.min.css"),"\n", # This is the CSS file for the network
             "</style>\n",
             includeHTML("layouts/partials/con.html"),"\n", # This is the HTML body of the network
             '</div>\n',
             '</div>\n',
             "\n",
             "\n")


# Store as html ----
cat(hex_out, file = "layouts/partials/hexwall.html")
