get_badges_data <- function(repos, packages) {

  data_dim <- length(packages)
  all_cran_data <- data.frame(
    Package = character(data_dim),
    Version = character(data_dim)
  )
  for (i in seq_len(length(packages))) {
    tryCatch({
      cran_data <- cran_package(packages[i])
      all_cran_data$Package[i] <- cran_data$Package
      all_cran_data$Version[i] <- cran_data$Version
    }, error = function(e) {
      all_cran_data$Package[i] <- packages[i]
      all_cran_data$Version[i] <- NA
    })
  }

  repo_meta <- create_gitstats() |>
    set_github_host(repos = repos, token = Sys.getenv("GITHUB_PAT")) |>
    get_repos(progress = TRUE)

  repo_meta |>
    left_join(all_cran_data, by = c("repo_name" = "Package")) |>
    select(
      name = repo_name,
      repo = fullname,
      badge_cran = Version,
      badge_stars = stars,
      badge_contributors = contributors_n
    )
}
