# My fingers are used to typing bash commands so create some equivalents

#' cd bash alias for \code{\link[base]{setwd}}
#' @inheritParams base::setwd
#'
#' @export
cd <- base::setwd

#' pwd bash alias for \code{\link[base]{getwd}}
#' @inheritParams base::getwd
#'
#' @export
pwd <- base::getwd

#' env bash alias for \code{\link[utils]{sessionInfo}}
#' @inheritParams utils::sessionInfo
#'
#' @export
env <- utils::sessionInfo # I always forget sessionInfo
