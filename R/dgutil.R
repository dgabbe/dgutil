#
# rconfig.r is the file that does the bulk of the work for customizating your R
# session.  The reason for a more complex setup is to:
#   a) Allow for the global environment to be cleared, but still retain the
#      customizations.  I prefer this over hidden environments.
#   b) R session initialization happens during other commands such as
#      devtools::document(). Multiple executions of Rprofile.site should result
#      in a session that is identical as the first instatiation.
# This is similar to the issues around the bash rc files.
#

session_init_counter <- 0

#   defaultPackages = c(
#     getOption("defaultPackages"),
#     "ggplot2",
#     "RColorBrewer",
#     "reshape2",
#     "scales"
#   )

# My fingers are used to typing bash commands so create some equivalents
cd <- setwd
pwd <- getwd
env <- utils::sessionInfo # I always forget sessionInfo

#' Title
#'
#' @param text
#'
#' @return The character string returned by timestamp().
#'
#' @examples
#' note()
#' note("Previous command worked")
#'
#' @export
note <- function (text = "Previous command worked"){
  timestamp(prefix = "<<<<< Notes to myself >>>>>\n",
            stamp=paste(format(Sys.time(), "%d-%b-%Y (%a) %R @"), getwd(), "\n", text, sep=" "),
            suffix = "\n<<<<< Notes to myself >>>>>\n",
            quiet = TRUE)
}


