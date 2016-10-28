#' Note a comment in the history file for future reference.
#'
#' Sometimes interactive exploration of running different R statements is a
#' great way to understand what is happening with your code or data.
#' \code{note} is a quick way to annote your results in the history file so you
#' can record what worked or did not work or a question that needs further
#' research.
#'
#' @param text The default is \code{"Previous command worked"}.
#'
#' @return The character string returned by \code{\link[utils]{timestamp}}.
#'
#' @examples
#' note()
#' note("Calculation matched reference data!")
#'
#' @export
note <- function (text = "Previous command worked"){
  timestamp(prefix = "<<<<< Notes to myself >>>>>\n",
            stamp=paste(format(Sys.time(), "%d-%b-%Y (%a) %R @"), getwd(), "\n", text, sep=" "),
            suffix = "\n<<<<< Notes to myself >>>>>\n",
            quiet = TRUE)
}

