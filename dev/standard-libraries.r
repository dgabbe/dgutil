reinstall_packages <- function (pkgs = NA) {
    if (is.na(pkgs))
      pkgs <- c(
        "crayon",
        c("dgutil", "github", "dgabbe/dgutil"),
        "directlabels",
        "dplyr",
        "ggplot2",
        "knitr",
        "lubridate",
        "plotrix,"
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

    # Install first so install_github is available.  Don't attach devtools!
    tryCatch(
      {
        p = "devtools"
        find.package(p)
      },
      error = function(e) install.packages(p),
      finally = cat("  ", p, " package installed\n")
    )

    lapply(pkgs, p_install(p))
}

p_install <- function (p) {
  switch(length(p),
         0 = cat("\n    Null string found, skipping"),
         1 = install.packages(p),
         2 = cat("\n   found 2 arguments, expected 1 or 3"),
         3 = switch(p[2],
                    "github" = devtools::install_github(p[3])
                    )
  )
}

