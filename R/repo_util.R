github_repo_pattern ="^([A-Za-z0-9]+[A-Za-z0-9-]*[A-Za-z0-9]+)/([A-Za-z0-9_.-]+)$"
github_username_pattern = "^[A-Za-z\\d](?:[A-Za-z\\d]|-(?=[A-Za-z\\d])){0,38}$"


clean_usernames = function(usernames)
{
  s = stringr::str_trim(usernames)
  s[s != ""]
}

require_valid_repo = function(repo)
{
  valid = valid_repo(repo)
  if (!all(valid))
    stop("Invalid repo names: \n\t", paste(repo[!valid], collapse="\n\t"), call. = FALSE)
}

#' @export
valid_repo = function(repo)
{
  stringr::str_detect(repo, github_repo_pattern)
}

#' @export
get_repo_name = function(repo)
{
  stringr::str_match(repo, github_repo_pattern)[,3]
}

#' @export
get_repo_owner = function(repo)
{
  stringr::str_match(repo, github_repo_pattern)[,2]
}

#' @export
get_repo_url = function(repo, type = c("https","ssh"), use_token = TRUE)
{
  require_valid_repo(repo)
  type = match.arg(type)

  if (type == "https") {
    if (use_token)
      paste0("https://", get_github_token(), "@github.com/",repo,".git")
    else
      paste0("https://github.com/",repo,".git")
  } else {
    paste0("git@github.com:",repo,".git")
  }
}



format_repo = function(repo, branch = "master", file = NULL) {
  repo = if (branch == "master") {
    repo
  } else{
    paste(repo, branch, sep="@")
  }

  if (!is.null(file))
    repo = file.path(repo, file)

  repo
}

