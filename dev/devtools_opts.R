#' devtools_opts finds all the devtools options.
#'
#' Missing function for devtools. Helps debug whether all the `devtools` are set correctly.
#'
#' @return List of all the options.
#' @export
devtools_opts <- function (opts = "devtools.*") {
  all_options <- grep(opts, names(options()), value = TRUE)
  lapply(
    all_options,
    function (o) {
      if (is.list(o)) {
        lapply(
          names(getOption(o)),
          function(oo) {
            message("    Option ", o, ".", oo, ":  ", getOption(o)[[oo]])
          }
        )
      } else {
        message("    Option ", o, ":  ", getOption(o))
      }
    }
  )
  return(TRUE)
}