if (nrow(no_match_aux_agrupamento) > 0){
  glue::glue("{nrow(no_match_aux_agrupamento)} linhas sem agrupamento na base execução") 
  write.xlsx(no_match_aux_agrupamento, file = 'no_match_aux_agrupamento.xlsx')
}
  
if(ratio_outros >= 0.20){
  msg <- "agrupamento Outros acima de 20% na base execução"
  logger::log_warn(msg)
  } 




