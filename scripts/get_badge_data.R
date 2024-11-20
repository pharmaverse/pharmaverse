get_badges_data <- function(repos, packages) {
  
  cran_data <- cran_packages(packages)

  repo_meta <- create_gitstats() |>
    set_github_host(repos = repos, token = Sys.getenv("GITHUB_PAT")) |>
    get_repos(progress = TRUE)
  
  repo_meta |>
    left_join(cran_data, by = c("repo_name" = "Package")) |>
    select(
      name = repo_name, 
      repo = fullname,
      badge_cran = Version, 
      badge_stars = stars, 
      badge_contributors = contributors_n
    )
}
