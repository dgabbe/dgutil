#' Complete package setup after RStudio creates a new project
#'
#' @import usethis
#' @export
tailor_package <- function()
{
  use_package_doc()
  use_pkgdown()
  use_readme_rmd()
  use_build_ignore(".nojekyll")
  # use_roxygen_md() # handled by usethis.description option
  use_tidy_description() # Standardize the order & format of fields
  # desc::desc_normalize() # Standardize the order & format of fields
}
