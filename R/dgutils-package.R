#' dgutils-package: A package of functions used across projects.
#'
#' The dgutils package provides three categories of R objects: aliases,
#' functions, and graphical themes.
#'
#' These functions are used across projects and benefit from online documentation.
#' They will improve your efficiency and R workflow.
#'
#' After a year of using different mechanisms to establish a default set of packges
#' when you start R, my conclusion is \code{option()} in \code{Rprofile.site} should
#' not be used.  A base R environment consists of 7 packages in addition to
#' \code{base}. The common idiom
#' \code{option(defaultPackage = c(getOptions("defaultPackages"), "my-package",
#' "your-package")} assumes that your R environment is only initialized once.
#' That's what I thought until I started using the \code{devtools} package and
#' discovered that your R session can be initialized by others.  Each initialization
#' adds your packages to the R environment stack.
#'
#' Here are some better solutions:
#' \enumerate{
#'   \item At the top of each file, use \code{library()} to load and attach each package
#'   the file needs.  This is similar to python's import statement.
#'   \item After a package is installed, you can reference any function directly
#'   with the \code{::} notation.
#'   \item And if you are using lots of functions from a package, it might be
#'   easier to attach the entire package.  In that case, make your code a package
#'   and use the \code{@import} and \code{@export} directives to do this automatically
#'   for you.
#' }
#'
#' @section Aliases:
#' Create some bash equivalents in aliases.R
#'
#' @section Functions:
#' Utility/convenience functions are defined in functions.R
#'
#' @section Graphical Themes:
#' This section is where your common idioms for programming graphics belong.
#' Since R has a number of different packages, there's a separate file for each
#' one.  Only ggplot is populated.
#'
#' @section \emph{graphics-ggplot.R}:
#' The ggplot2 package is somewhat unique from other packages with heavy use of
#' the "+" continuation operator and the huge number of objects and functions
#' needed to generate a graph. Using the \code{Imports} directive and \code{::}
#' notation made \code{theme_dg} nearly inscrutable. Just take a look at the
#' gglot2 Namespace file,
#' \url{https://github.com/hadley/ggplot2/blob/master/NAMESPACE}. So yes, that is
#' why this package depends on ggplot2.
#'
#' @docType package
#' @name dgutils
NULL


