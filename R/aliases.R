# My fingers are used to typing bash commands so create some equivalents

#' bash alias for \code{\link[base]{setwd}}
#'
#' @inheritParams base::setwd
#'
#' @export
cd <- base::setwd

#' bash alias for \code{\link[base]{getwd}}
#'
#' @inheritParams base::getwd
#'
#' @export
pwd <- base::getwd

#' bash alias for \code{\link[utils]{sessionInfo}}
#'
#' @inheritParams utils::sessionInfo
#' @export
env <- utils::sessionInfo
