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


#' fl an indented, wrapped, neatly printed list styled after a definition
#'
#' There are many formatting or pretty printing functions available,
#' some of them quite elaborate.  Mine uses only functions in `base`.  It seems that many
#' programmers don't realize the power of `strwrap` and the `sep` parameter for `cat`.
#'
#' @param x the R object to display. `toString` must be able to evaluate it.
#'
#' @param label  a string to describe the list.  The remaining lines are
#' indented by the number of characters from catcatenating `indent_string` and
#' `label`.
#'
#' @param indent_string the string to prefix the first line.  Defaults to
#' `tab.width` option number of spaces.  If you wanted your
#' list indented 4 spaces, you pass a string of 4 spaces to this parameter.
#'
#' @examples
#' \dontrun{
#' fl(search(), label = "search():  ")
#' }
#'
#' @export
#'
fl <- function(x,
               label = "",
               indent_string =
                 sub(", ", " ", toString(character(getOption("tab.width"))))
               ) {
  initial_string <- paste(indent_string, label, sep = "")
  cat(
    strwrap(
      toString(x),
      width = 80,
      initial = initial_string,
      prefix = "",
      indent = 0,
      exdent = nchar(initial_string)
    ),
    sep = "\n"
  )
}
