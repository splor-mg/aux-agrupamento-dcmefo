library(Microsoft365R)
library(frictionless)
library(cyphr)

get_token <- function() {
  
  token_list = AzureAuth::list_azure_tokens()
  
  if (length(token_list) != 0) {
    logger::log_info("A token was found in {AzureAuth::AzureR_dir()}. Using {names(token_list)[1]} for authentication.")
    token = token_list[[1]]
  }
  
  else {
    logger::log_info("A token was not found in {AzureAuth::AzureR_dir()}. Decrypting 'ms365.rds' for authentication.")
    k_env <- Sys.getenv("MS365_KEY") # Chave privada obtido via secret vindo do Gitgub Actions
    key <- cyphr::key_sodium(sodium::hex2bin(k_env)) # decriptar token
    token <- cyphr::decrypt(readRDS("ms365r.rds"), key)
  }
  
  token
  
}

extract <- function() {
  package <- read_package("datapackage.yaml")
  source <- package$sources[[1]]
  site <- get_sharepoint_site(site_url = source[["path"]], token = get_token())
  docs <- site$get_drive(source[["drive"]])
  folder <- docs$get_item(source[["item"]])
  folder$download(source[["dest"]], overwrite = TRUE)
}

extract()
