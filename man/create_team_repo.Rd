% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/repo.R
\name{create_team_repo}
\alias{create_team_repo}
\title{Create team repositories}
\usage{
create_team_repo(org, team, prefix = "", suffix = "", private = TRUE,
  verbose = TRUE, auto_init = FALSE, gitignore_template = "R")
}
\arguments{
\item{org}{character, name of the GitHub organization.}

\item{team}{character or data frame, vector of team names}

\item{prefix}{character, resulting repo name will start with this character string}

\item{suffix}{character, resulting repo name will end with this character string}

\item{private}{logical, create private repos}

\item{verbose}{logical, display verbose output}

\item{auto_init}{logical, initialize the repository with a README.md}

\item{gitignore_template}{character, .gitignore template language}
}
\description{
\code{create_team_repo} creates repos for team(s)
}
\examples{
\dontrun{
create_team_repo("ghclass",c("team01","team02"), prefix="hw01-")
}

}
\seealso{
Other github organization related functions: \code{\link{create_individual_repo}},
  \code{\link{create_team}}, \code{\link{get_members}},
  \code{\link{get_pending_members}},
  \code{\link{get_pending_team_members}},
  \code{\link{get_repos}}, \code{\link{get_team_members}},
  \code{\link{get_team_repos}}, \code{\link{get_teams}},
  \code{\link{invite_user}}
}
\concept{github organization related functions}
