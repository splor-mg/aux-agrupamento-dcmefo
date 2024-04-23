test_that("no_match_aux_agrupamento"){
  expect_equal(nrow_no_match, 0)
  
  if (nrow_no_match > 0){
    glue::glue("{nrow(no_match_aux_agrupamento)} linhas sem agrupamento na base execução") 
    write.xlsx(no_match_aux_agrupamento, file = 'no_match_aux_agrupamento.xlsx')
  }
}
