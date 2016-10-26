# tryCatch(
#   {
#     find.package(p, quiet = TRUE)
#   },
#   error = function(e) install.packages(p, quiet = TRUE),
#   finally = print(cat("\n  ", p))
# )
#

installed_pkgs <- c() # List of packages already installed
error_pkgs <- c() # List of packages that were not installed for some reason
new_pkgs <- c() # List of packages this function installed

#' Title
#'
#' @param pkgs
#'
#' @return
#' @export
#'
#' @examples
reinstall_packages <- function (pkgs = NA) {
  if (is.na(pkgs))
    pkgs <- list(
      "crayon",
      c("github", "dgabbe/dgutil"),
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


#' Title
#'
#' @param p
#'
#' @return
#' @export
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

