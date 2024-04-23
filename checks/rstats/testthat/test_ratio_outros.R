test_that("ratio_outros"){
  expect_less_than(ratio_outros, 0.20)
  
  if (ratio_outros >= 0){
     msg <- "agrupamento Outros acima de 20% na base execução"
     logger::log_warn(msg)
  }
}
