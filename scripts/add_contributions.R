library(dplyr)
library(GithubMetrics)
library(glue)

repo_all_commits <- gh_commits_get(
  c("pharmaverse/pharmaverse","openpharma/openpharma.github.io"),
  days_back = 365*10
)

contributors <- repo_all_commits %>%
  group_by(author) %>%
  summarise(
    commits = n(),
    last_commit = max(datetime),
    first_commit = min(datetime)
  ) %>%
  mutate(
    last_commit = as.Date(last_commit),
    first_commit = as.Date(first_commit)
  ) %>%
  filter(!author %in% c(".gitconfig missing email","actions-user"))

contributors <- contributors %>%
  left_join(
    gh_user_get(contributors$author),
    by = c("author"="username")
  )

table <- contributors %>%
  filter(!is.na(name)) %>%
  mutate(
    `Activity on the website and metadata <a href="https://github.com/orgs/pharmaverse/projects/3">(to contribute click here)</a>` =
      glue(
        '<img src="{avatar}" alt="" width = "30" height="30"> {name} ({author}): {commits} commits between {first_commit} and {last_commit}')
  ) %>%
  select(tail(names(.), 1)) %>%
  knitr::kable("html", escape = FALSE)

cat(
  paste0("\n",table," </ul>"),
  file = "layouts/partials/contributors.html", append = TRUE)
