#' An indented, wrapped list styled after a definition.
#'
#' There are many formatting or pretty printing functions available,
#' some of them quite elaborate.  Mine uses only functions in \code{base}.
#' It seems that many programmers don't realize the power of \code{strwrap}
#' and the \code{sep} parameter for \code{\link{cat}}.
#'
#' @param x the R object to display. \code{\link{toString}} must be able to evaluate it.
#'
#' @param label a string to describe the list.  The remaining lines are
#' indented by the number of characters from catcatenating \code{indent_string} and
#' `label`.
#'
#' @param indent_string the string to prefix the first line.  Defaults to
#' \code{tab.width} option number of spaces.  If you wanted your
#' list indented 4 spaces, pass a string of 4 spaces to this parameter.
#'
#' @section R Trivia:
#' Turns out the \code{tab.width} option is not set by default in base R as
#' I discovered when I tried to build the package.  Now explicitly test to see if the
#' option is set.
#'
#' @examples
#' fl(search(), label = "search():  ")
#'
#' @export
fl <- function(x, label = "", indent_string = NA) {
  if (is.na(indent_string)) {
    if (is.null(getOption("tab.width"))) {
      indent_string <- "  "
    } else {
      indent_string <- paste(
        sub(", ", " ", toString(character(getOption("tab.width")))),
        " ",
        sep = ""
      )
    }
  }
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
