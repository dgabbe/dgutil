#' dgutil: A package of functions used across projects.
#'
#' The dgutil package provides three categories of R objects: aliases,
#' functions, and graphical themes.
#'
#' These functions are used across projects and benefit from online documentation.
#' They will improve efficiency and R workflow.
#'
#' In particular, my experience is that package management works better if the
#' required packages are specified in each .R file, similar to python's import
#' statement.
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
#' @name dgutil
NULL


