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
        "dgabbe/dgutil",
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

#    installed <- "Installed: "
    print("Installed:")

    # Install first so install_github() is available.  Don't attach devtools!
    tryCatch(
      {
        p = "devtools"
        find.package(p, quiet = TRUE)
      },
      error = function(e) install.packages(p, quiet = quiet, verbose = quiet),
      finally = print(cat("\n  ", p))
    )

    lapply(
      pkgs,
      function (p) {
        if (length(p) == 1) {
          if (grepl("/", p)) {
            try(
              {
                devtools::install_github(p, quiet = TRUE)
                cat("\n  ", p)
              }
            )
          } else
            tryCatch(
              { find.package(p) },
              error = function(e) {
                install.packages(p)
              },
              finally = paste("\n  ", p)
            )
        } else {
          paste("\n   Wrong arguments: ", p)
        }
      }
    )
#  print(installed)
}
