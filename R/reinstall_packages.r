#' Default set of packages.
#'
#' To see a tidy list of them, refer to Examples:
#'
#' @section Implementation Enhancements:
#'
#' Creating a package object has the disadvantage that updating the defaults necessiates
#' a package release cycle.  A more flexible method would be to add an option to
#' \code{.Options}.  In the mean time, writing a brief R script is an alternative
#' solution.
#'
#'
#' @examples
#' dgutils::fl(default_packages)
#'
#' @export
default_packages <- list(
  "crayon",
  c("github", "dgabbe/dgutils"),
  "directlabels",
  "knitr",
  c("github", "hadley/pkgdown"),
  "plotrix",
  "RColorBrewer",
  "reshape2",
  "rmarkdown",
  "roxygen2",
  "rsconnect",
  "rversions",
  "scales",
  "shiny",
  "tidyverse" # covers all the Hadley packages
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
#' is not specified, the set is defaulted to \code{dgutils::default_packages}.
#'
#' @return TRUE
#'
#' @section Future Development:
#' It's possible that \code{default_packages} will become an option.
#' @export
#'
reinstall_packages <- function (pkgs = default_packages) {

  installed_pkgs <- c() # List of packages already installed.
  error_pkgs <- c() # List of packages that were not installed for some reason.
  new_pkgs <- c() # List of packages this function installed.


  #
  # Install first so install_*()'s are available.  Don't attach devtools!
  #
  installer("devtools")

  lapply(pkgs, function(...){
    pkg <- installer(...)
    new_pkgs <<- c(new_pkgs, pkg$new)
    installed_pkgs <<- c(installed_pkgs, pkg$installed)
    error_pkgs <<- c(error_pkgs, pkg$error)
  })

  lapply(
    c(flp(new_pkgs, label = "Packages installed:  "),
      flp(error_pkgs, label = "Packages NOT installed:  "),
      flp(installed_pkgs, label = "Existing Packages:  ")
      ),
    message
    )
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
      return(list("installed" = p))
    } else {
      if (is.null(utils::install.packages(p, quiet = TRUE))) {
        return(list("error" = p))
      }
      else {
        return(list("new" = p))
      }
    }
  }

  if (length(p) == 2) {
    cmd <- paste("devtools::install_", p[[1]], sep = "")
    repo <- p[[2]]
    p_name <- strsplit(repo, "/")[[1]][2]
    if (length(find.package(p_name, quiet = TRUE)) != 0) {
      return(list("installed" = p))
    } else {
      try(
        {
          eval(
            parse(text = paste(cmd, "(\"", toString(repo), "\", quiet = TRUE)", sep = ""))
            )
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

