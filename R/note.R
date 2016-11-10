#' Add a comment in the history file.
#'
#' Sometimes interactive exploration of running different statements is a
#' great way to understand what is happening with your code or data.
#' \code{note} is a quick way to annote your results in the history file so you
#' can record what worked or did not work or a question that needs further
#' research.
#'
#' \code{note("Plot labels have wrong color - try explicit aes() for geom_dl")}
#' would create a history file entry similar to:
#' \preformatted{
#' <<<<< Notes to myself >>>>>
#' 12-May-2016 (Thu) 08:07 @ /Users/examples
#' Plot labels have wrong color - try explicit aes() for geom_dl
#' <<<<< Notes to myself >>>>>
#' }
#'
#' @param txt default is \code{"Previous command worked"}.
#'
#' @return The character string returned by \code{\link[utils]{timestamp}}.
#'
#' @examples
#' note()
#' note("Calculation matched reference data!")
#'
#' @export
#'
note <- function(txt = "Previous command worked") {
  utils::timestamp(
    prefix = "<<<<< Notes to myself >>>>>\n",
    stamp=paste(format(Sys.time(), "%d-%b-%Y (%a) %R @"), getwd(), "\n", txt, sep=" "),
    suffix = "\n<<<<< Notes to myself >>>>>\n",
    quiet = TRUE
  )
}

