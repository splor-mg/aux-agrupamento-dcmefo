
test_that("no_match_aux_agrupamento", {
  
  aux_agrupamento <- unique(aux_agrupamento[,.(uo_cod, elemento_item_cod, agrupamento_dcmefo)]) 
  
  exec_siafi_merged <- merge(exec_siafi, aux_agrupamento, by = c("uo_cod", "elemento_item_cod")
                             , all.x = TRUE)
  
  exec_siafi_unique <- unique(exec_siafi_merged[ ,.(uo_cod, elemento_item_cod), by = agrupamento_dcmefo])
  
  no_match_aux_agrupamento <- exec_siafi_unique[is.na(agrupamento_dcmefo), ]
  
  nrow_no_match <- nrow(no_match_aux_agrupamento)
  
  expect_equal(nrow_no_match, 0)
  
  if (nrow_no_match > 0){
    no_match_aux_agrupamento <- no_match_aux_agrupamento[, .(elemento_item_cod = paste(elemento_item_cod, collapse = ",")) , by = uo_cod]
    msg <- glue::glue_data(no_match_aux_agrupamento, "Na UO {uo_cod}, o elemento item {elemento_item_cod} não possui agrupamento")
    purrr::walk(msg, logger::log_warn)
  }
  
})



