<<<<<<< HEAD
<<<<<<< .merge_file_TG5eS2
#' Reinstall my standard collection of packages to first library listed in \code{.libPaths}.
#'
#' Each (minor) version of R uses a unique library path, \code{/Library/Frameworks/R.framework/Versions/3.x/Resources/library} to install packages.  To save disk space, keep all major versions of R packages in one directory.  Also handy when setting a new user environment.
#'
#' As a programming exercise, created a function to install my common packages using try/catch and apply.
#'
#' @section EXPERIMENTAL
#'
#' This code does work, but it is not professional quality.  Use at your own discretion.  A local git repo is not handled.
#'
#' @param pkgs The list of packages to install.  If there is no param, a default set will be installed.  A Github package is denoted by \code{username/project-name}.
#'
#' @param quiet Logical passed to \code{install.package} parameters \code{quiet} and \code{verbose} to minimize the amount of output
#'
#' @export
reinstall_packages <- function (pkgs = NA, quiet = TRUE) {
    if (is.na(pkgs))
      pkgs <- c(
        "crayon",
        "dgabbe/dgutils",
        "directlabels",
        "dplyr",
        "ggplot2",
        "knitr",
        "lubridate",
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
        "shinythemes",
        "stringr",
        "tidyr"
      )
=======
# tryCatch(
#   {
#     find.package(p, quiet = TRUE)
#   },
#   error = function(e) install.packages(p, quiet = TRUE),
#   finally = print(cat("\n  ", p))
# )
#
>>>>>>> .merge_file_vhtDYj

||||||| merged common ancestors
# tryCatch(
#   {
#     find.package(p, quiet = TRUE)
#   },
#   error = function(e) install.packages(p, quiet = TRUE),
#   finally = print(cat("\n  ", p))
# )
#

=======
>>>>>>> dev
installed_pkgs <- c() # List of packages already installed
error_pkgs <- c() # List of packages that were not installed for some reason
new_pkgs <- c() # List of packages this function installed

<<<<<<< HEAD
<<<<<<< .merge_file_TG5eS2
    # Install first so install_github() is available.  Don't attach devtools!
    tryCatch(
      {
        p = "devtools"
        find.package(p, quiet = TRUE)
      },
      error = function(e) install.packages(p, quiet = quiet, verbose = quiet),
      finally = print(cat("\n  ", p))
=======
#' Title
||||||| merged common ancestors
#' Title
=======
#' reinstall_packages installs your standard set of packages
>>>>>>> dev
#'
#' @param pkgs
#'
#' @return
#' @export
#'
reinstall_packages <- function (pkgs = NA) {
  if (is.na(pkgs))
    pkgs <- list(
      "crayon",
      c("github", "dgabbe/dgutils"),
      "directlabels",
      "dplyr",
      "ggplot2",
      "knitr",
      "lubridate",
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
>>>>>>> .merge_file_vhtDYj
    )

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


#' installer helper function that does the install
#'
#' @param p
#'
#' @return
#'
#' @examples
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
      if (is.null(install.packages(p, quiet = TRUE))) {
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

