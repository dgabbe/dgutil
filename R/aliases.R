# My fingers are used to typing bash commands so create some equivalents

#' cd bash alias for \code{\link[base]{setwd}}
#'
#' @export
cd <- setwd

#' pwd bash alias for \code{\link[base]{getwd}}
#'
#' @export
pwd <- getwd

#' env bash alias for \code{\link[utils]{sessionInfo}}
#'
#' @export
env <- utils::sessionInfo # I always forget sessionInfo
