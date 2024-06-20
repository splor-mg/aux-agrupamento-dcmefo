library(Microsoft365R)
library(frictionless)
library(cyphr)

k_env <- Sys.getenv("MS365_KEY")
key <- cyphr::key_sodium(sodium::hex2bin(k_env))
token = cyphr::decrypt(readRDS("ms365r.rds"), key)

extract <- function() {
  package <- read_package("datapackage.yaml")
  source <- package$sources[[1]]
  site <- get_sharepoint_site(site_url = source[["path"]], token = token)
  docs <- site$get_drive(source[["drive"]])
  folder <- docs$get_item(source[["item"]])
  folder$download(source[["dest"]], overwrite = TRUE)
}

extract()