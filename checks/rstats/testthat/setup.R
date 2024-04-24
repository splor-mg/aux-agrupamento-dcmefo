suppressPackageStartupMessages(library(validate))
library(data.table)
library(openxlsx)


exec_siafi <- fread('datapackages/siafi_2024/data/execucao.csv.gz')
aux_agrupamento <- fread('data/aux-agrupamento-dcmefo.csv')

setnames(aux_agrupamento, "elem_item_cod", "elemento_item_cod")

aux_agrupamento <- unique(aux_agrupamento[,.(uo_cod, elemento_item_cod, agrupamento_dcmefo)])

exec_siafi_merged <- merge(exec_siafi, aux_agrupamento, by = c("uo_cod", "elemento_item_cod")
                    , all.x = TRUE)

exec_siafi_unique <- unique(exec_siafi_merged[ ,.(uo_cod, elemento_item_cod), by = agrupamento_dcmefo])
no_match_aux_agrupamento <- exec_siafi_unique[is.na(agrupamento_dcmefo), ]

nrow_exec_siafi <- nrow(exec_siafi_unique)
nrow_outros <- nrow(exec_siafi_unique[agrupamento_dcmefo=="Outros",])
nrow_no_match <- nrow(no_match_aux_agrupamento)

ratio_outros <- nrow_outros/nrow_exec_siafi



