#' devtools_opts finds all the devtools and usethis options.
#'
#' Missing function for devtools. Helps debug whether all the `devtools` options
#' are set correctly. Added `usethis` as it seems usethis is superceding
#' devtools for some work.
#'
#' @return List of all the options.
#' @export
devtools_opts <- function (opts = "devtools.*|usethis.*") {
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