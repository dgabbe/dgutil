#' An indented, wrapped list styled after a definition.
#'
#' @inheritParams fl
#'
#' @return a formatted string
#'
#' @describeIn fl formatted string variant
#' @examples
#' s <- flp(search(), label = "search():  ")
#'
#' @export
flp <- function(x, label = "", indent_string = NA) {
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
  return(
    strwrap(
      toString(x),
      width = 80,
      initial = initial_string,
      prefix = "",
      indent = 0,
      exdent = nchar(initial_string),
      simplify = TRUE
    )
  )
}
