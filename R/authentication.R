#' Get github token
#'
#' \code{get_github_token} obtains the user's github authentication token.
#'
#' This function looks for the token in the following places (in order):
#' \enumerate{
#'   \item Value of \code{GITHUB_PAT} environmental variable.
#'
#'   \item Value of \code{GITHUB_TOKEN} environmental variable.
#'
#'   \item Contents of \code{~/.github/token} file.
#' }
#'
#' @examples
#' \dontrun{
#' get_github_token()
#' }
#'
#' @family authentication functions
#'
#' @export
#'
get_github_token = function() {
  token = usethis::github_token()
  if (token != "")
    return(token)

  if (file.exists("~/.github/token")) {
    set_github_token("~/.github/token")
    return(get_github_token())
  }

  stop("Unable to locate github token, please use set_github_token",
       " or define the GITHUB_TOKEN environmental variable.")
}


#' Set github token
#'
#' \code{set_github_token} defines the user's github authentication token,
#' this value is then accessed using \code{get_github_token}
#'
#' @param token character, either the path of a file contained the token or the actual token.
#'
#' @examples
#' \dontrun{
#' set_github_token("~/.github/token")
#' set_github_token("0123456789ABCDEF0123456789ABCDEF01234567")
#' }
#'
#' @family authentication functions
#'
#' @export
#'
set_github_token = function(token) {
   token = as.character(token)

  if (file.exists(token))
    token = readLines(token, warn=FALSE)

  Sys.setenv(GITHUB_PAT = token)
}

#' Test github token
#'
#' \code{test_github_token} checks if a token is valid by attempting to authenticate with the GitHub api.
#'
#' @param token github api personal access token
#'
#' @examples
#' \dontrun{
#' test_github_token()
#' test_github_token("bad_token")
#' }
#'
#' @family authentication functions
#'
#' @export
#'
test_github_token = function(token = get_github_token()) {

  res = safe_gh("/user", .token=token)

  status_msg(
    res,
    "Your github token is functioning correctly.",
    "Your github token failed to authenticate.",
  )
}
