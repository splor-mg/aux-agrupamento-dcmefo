library(Microsoft365R); library(frictionless)

extract <- function() {
  package <- read_package("datapackage.yaml")
  source <- package$sources[[1]]
  site <- get_sharepoint_site(site_url = source[["path"]])
  docs <- site$get_drive(source[["drive"]])
  folder <- docs$get_item(source[["item"]])
  folder$download(source[["dest"]], overwrite = TRUE)
}

extract()