library(data.table)
library(openxlsx)
library(validate)
library(dplyr)
library(testthat)

exec_siafi <- fread(here::here('datapackages/siafi_2024/data/execucao.csv.gz'))
aux_agrupamento <- fread(here::here('data/aux-agrupamento-dcmefo.csv'))
