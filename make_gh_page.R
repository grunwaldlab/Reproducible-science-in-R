if (!require("git2r")){
  install.packages("git2r", repos = "https://cran.rstudio.org")
  library("git2r")
}
library('rmarkdown')
repo <- git2r::repository()
current_branch <- git2r::head(repo)@name
git2r::checkout(repo, "gh-pages")
rmarkdown::render_site()
git2r::add(repo, "*")
git2r::commit(repo, "update website", session = TRUE)
git2r::checkout(repo, current_branch)