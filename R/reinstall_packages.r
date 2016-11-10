#' List of packages already installed.
#' @keywords internal
installed_pkgs <- c()

#' List of packages that were not installed for some reason.
#' @keywords internal
error_pkgs <- c()

#' List of packages this function installed.
#' @keywords internal
new_pkgs <- c()

#' Default set of packages.
#'
#' To see a tidy list of them, refer to Examples:
#' @examples
#' dgutils::fl(my_packages)
#'
#' @export
my_packages <- list(
  "crayon",
  c("github", "dgabbe/dgutils"),
  "directlabels",
  "dplyr",
  "ggplot2",
  "knitr",
  "lubridate",
  c("github", "hadley/pkgdown"),
  "plotrix",
  "RColorBrewer",
  "readr",
  "readxl",
  "reshape2",
  "rmarkdown",
  "roxygen2",
  "rsconnect",
  "rversions",
  "scales",
  "shiny",
  "stringr",
  "tidyr"
)

#' Installs your standard set of packages.
#'
#' This function is part programming exercise and part solution to R upgrades.
#' Only \code{\link{install.packages}() pkgs} param is supported.  For \code{devtools::install_*}
#' functions, only the first parameter, usually repo, is supported.  If you need
#' something more advanced, there are plenty of similar functions already written.
#'
#' Each R release has its own library, \code{/Library/Frameworks/R.framework/Versions/x.x/Resources/library}.
#' To avoid redoing the package installs into the new R library, I added this entry to \code{.Renviron}:
#' \preformatted{
#' R_LIBS_USER=~/Library/R/3.x/library/
#' }
#' and this function to make managing multiple computers eaiser.
#'
#'
#' @param pkgs a list of packages to install. Packages installed
#' with \code{devtools::install_*} functions are specified as a character
#' vector of 2 strings.  The first string is the suffix to complete the install
#' funciton name.  The second string is the path to the package.  If this param
#' is not specified, the set is defaulted to \code{dgutils::my_packages}.
#'
#' @return TRUE
#'
#' @section Future Development:
#' It's possible that \code{my_packages} will become an option.
#' @export
#'
reinstall_packages <- function (pkgs = my_packages) {

  #
  # Install first so install_*()'s are available.  Don't attach devtools!
  #
  installer("devtools")

  lapply(pkgs, installer)

  message("Packages installed:  ", toString(new_pkgs))
  message("Packages NOT installed:  ", toString(error_pkgs))
  message("Existing Packages:  ", strwrap(toString(installed_pkgs)))
  return(TRUE)
}


#' Helper function that invokes the proper install function
#'
#' @param p character vector representing package name passed to \code{\link{install.packages}}.
#' If a list, the first element is the suffix to append to \code{devtools::install_}.
#' The second element is the path to the path package. Refer to \code{\link[devtools]{install}} for more info.
#'
#' @section Limitations:
#' There are many params to the install functions that are not supported at this time.
#'
#' @return returns a named list if successful.  Otherwise FALSE.
#' @keywords internal
#'
installer <- function(p) {
  if (is.null(p)) {
    warning("No package to install.")
    return(FALSE)
  }

  if (!is.character(p)) {
    warning("Skipping package name that is not a string")
    return(FALSE)
  }

  if (length(p) == 1) {
    if (length(find.package(p, quiet = TRUE)) != 0) {
      assign("installed_pkgs", append(installed_pkgs, p), inherits = TRUE)
      return(list("installed" = p))
    } else {
      if (is.null(utils::install.packages(p, quiet = TRUE))) {
        assign("error_pkgs", append(error_pkgs, p), inherits = TRUE)
        return(list("error" = p))
      }
      else {
        assign("new_pkgs", append(new_pkgs, p), inherits = TRUE)
        return(list("new" = p))
      }
    }
  }

  if (length(p) == 2) {
    cmd <- paste("devtools::install_", p[[1]], sep = "")
    repo <- p[[2]]
    p_name <- strsplit(repo, "/")[[1]][2]
    if (length(find.package(p_name, quiet = TRUE)) != 0) {
      assign("installed_pkgs", append(installed_pkgs, repo), inherits = TRUE)
      return(list("installed" = p))
    } else {
      try(
        {
          eval(parse(text = paste(cmd, "(\"", toString(repo), "\", quiet = TRUE)", sep = "")))
          message(repo, " installed with ", cmd)
        },
        silent = TRUE
      )
    }
  }

  if (length(p) > 2) {
    warning("Too many arguments:  ", toString(p))
    return(FALSE)
  }
}

