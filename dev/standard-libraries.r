reinstall_packages <- function (pkgs = NA) {
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
        find.package(p)
      },
      error = function(e) install.packages(p),
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
