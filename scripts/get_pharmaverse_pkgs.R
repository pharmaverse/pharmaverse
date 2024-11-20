get_pharmaverse_pkgs <- function(yaml_path = file.path("data","packages/")) {
  
  read_yaml_to_tibble <- function(file) {
    yaml_data <- read_yaml(file)
    as_tibble(yaml_data)
  }
  
  yaml_files <- paste0(yaml_path, list.files(yaml_path))
  safe_read_yaml_to_tibble <- safely(read_yaml_to_tibble)
  map(yaml_files, safe_read_yaml_to_tibble) |>
    map("result") |>
    compact() |>
    bind_rows()
}
