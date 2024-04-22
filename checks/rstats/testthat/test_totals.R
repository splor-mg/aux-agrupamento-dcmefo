test_that("check_vlr_empenhado", {  
  
  result <- check_vlr_empenhado(
    package$execucao, 
    totais$totais_execucao_siafi[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'check_vlr_empenhado' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})

test_that("check_vlr_liquidado", {  
  
  result <- check_vlr_liquidado(
    package$execucao, 
    totais$totais_execucao_siafi[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_liquidado' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})


test_that("vlr_pago_financeiro", {  
  
  result <- check_vlr_pago_financeiro(
    package$execucao, 
    totais$totais_execucao_siafi[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_pago_financeiro' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})

test_that("vlr_pago_orcamentario", {  
  
  result <- check_vlr_pago_orcamentario(
    package$execucao, 
    totais$totais_execucao_siafi[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_pago_orcamentario' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})

test_that("vlr_despesa_liquidada_rpnp", {  
  
  result <- check_vlr_despesa_liquidada_rpnp(
    package$restos_pagar, 
    totais$totais_siafi_restos_pagar[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_despesa_liquidada_rpnp' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})

test_that("vlr_despesa_liquidada_rpnp", {  
  
  result <- check_vlr_despesa_liquidada_rpnp(
    package$restos_pagar, 
    totais$totais_siafi_restos_pagar[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_despesa_liquidada_rpnp' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})

test_that("vlr_pago_rpnp", {  
  
  result <- check_vlr_pago_rpnp(
    package$restos_pagar, 
    totais$totais_siafi_restos_pagar[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_pago_rpnp' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})

test_that("vlr_pago_rpp", {  
  
  result <- check_vlr_pago_rpp(
    package$restos_pagar, 
    totais$totais_siafi_restos_pagar[ano %in% ANO_EXERCICIO],
    output = TRUE
  )
  
  if (result$valid == FALSE) {
    msg <- glue::glue_data(
      result$fail,
      "Divergência no 'vlr_pago_rpp' de {vlr_totais - vlr_detalhe} no mês {mes_cod}/{ano} entre total (R$ {vlr_totais}) e detalhe (R$ {vlr_detalhe})"
    )
    logger::log_warn(logger::skip_formatter(msg))
  }
  
  expect_true(result$valid)
})
