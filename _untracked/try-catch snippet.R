tryCatch(
  {
    find.package(p, quiet = TRUE)
  },
  error = function(e) install.packages(p, quiet = TRUE),
  finally = print(cat("\n  ", p))
)
