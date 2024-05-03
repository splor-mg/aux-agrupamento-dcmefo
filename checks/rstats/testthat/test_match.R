#'Title
#'
#'Description
check_agrupamento_exists <- function (aux_agrupamento,  exec_siafi, stop_on_failure = FALSE){
  aux_agrupamento <- distinct(aux_agrupamento, uo_cod, elemento_item_cod, agrupamento_dcmefo) 
  exec_siafi_unique <-left_join(exec_siafi, aux_agrupamento, by = c("uo_cod", "elemento_item_cod")) |> distinct(uo_cod, elemento_item_cod, agrupamento_dcmefo)
  no_match_aux_agrupamento <- exec_siafi_unique[is.na(agrupamento_dcmefo), ]
  is_valid <- nrow(no_match_aux_agrupamento) == 0
  
  if (!is_valid) {
    no_match_aux_agrupamento <- no_match_aux_agrupamento[, .(elemento_item_cod = paste(elemento_item_cod, collapse = ",")) , by = uo_cod]
    msg <- glue::glue_data(no_match_aux_agrupamento, "Na UO {uo_cod}, o elemento item {elemento_item_cod} não possui agrupamento")
    purrr::walk(msg, logger::log_warn)
    if (stop_on_failure) {
      stop()
    }
  } 
  is_valid
}

test_that("check_agrupamento_exists", {
  expect_no_error(check_agrupamento_exists(aux_agrupamento, exec_siafi, TRUE))                     
})

