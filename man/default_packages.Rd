% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reinstall_packages.r
\docType{data}
\name{default_packages}
\alias{default_packages}
\title{Default set of packages to install if not already.}
\format{An object of class \code{list} of length 23.}
\usage{
default_packages
}
\description{
To see a tidy list of them, refer to Examples:
}
\section{Implementation Enhancements}{


  Creating a package object has the disadvantage that updating the defaults
  necessiates a package release cycle.  A more flexible method would be to
  add an option to \code{.Options} or creating an environment to store the
  list.  In the mean time, writing a brief R script is a sufficient solution.
}

\examples{
dgutils::fl(default_packages)

}
\keyword{datasets}
