library(data.table)
library(openxlsx)

#inserir dpm install no makefile

exec_siafi <- fread('datapackages/siafi_2024/data/execucao.csv.gz')
aux_agrupamento <- fread('data/aux-agrupamento-dcmefo.csv')

setnames(aux_agrupamento, "elem_item_cod", "elemento_item_cod")

exec_siafi <- exec_siafi[ ,.(elemento_item_cod), by = uo_cod]
no_match_aux_agrupamento <- exec_siafi[!aux_agrupamento, on = .(uo_cod, elemento_item_cod)]

nrow_exec_siafi <- nrow(exec_siafi)
nrow_outros <- nrow(aux_agrupamento[agrupamento_dcmefo == 'Outros'])
ratio_outros <- nrow_outros/nrow_exec_siafi
