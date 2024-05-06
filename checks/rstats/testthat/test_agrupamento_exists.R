#'Title
#'
#'Description
check_agrupamento_exists <- function (aux_agrupamento,  exec_siafi, stop_on_failure = FALSE){
  agrupamento <- distinct(aux_agrupamento, uo_cod, elemento_item_cod, agrupamento_dcmefo) 
  exec_agrupamento_unique <-left_join(exec_siafi, agrupamento, by = c("uo_cod", "elemento_item_cod")) |> distinct(uo_cod, elemento_item_cod, agrupamento_dcmefo)
  agrupamento_not_exists <- exec_agrupamento_unique[is.na(agrupamento_dcmefo), ]
  is_valid <- nrow(agrupamento_not_exists) == 0
  
  if (!is_valid) {
    agrupamento_not_exists_pivoted <- agrupamento_not_exists[, .(elemento_item_cod = paste(elemento_item_cod, collapse = ",")) , by = uo_cod]
    msg <- glue::glue_data(agrupamento_not_exists_pivoted , "Não há agrupamento para a UO {uo_cod}, elemento(s) item(ns) {elemento_item_cod} ")
    purrr::walk(msg, logger::log_warn)
    if (stop_on_failure) {
      stop()
    }
  } 
  is_valid
}

test_that("check_agrupamento_exists", {
  expect_no_error(check_agrupamento_exists(aux_agrupamento, exec_siafi, FALSE))                     
})
