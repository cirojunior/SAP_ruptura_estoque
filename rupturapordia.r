library(dplyr, warn.conflicts = FALSE)

#Criando um novo DataFrame com nome mais amigável.
rup <- data.frame(HERC_MATERIAL_RUPTURA_1100_CJ)

#Criando a coluna de ruptura, soma acumulada por material - quantidade em estoque.
rup <- rup %>% group_by ( Material ) %>% arrange(rup$Data.entrega)
rup <- rup %>% group_by ( Material ) %>% mutate ( SomaAcumulada = cumsum ( Qtde.carteira ) )
rup["Ruptura"] <- rup$Qtde.estoque.total - rup$SomaAcumulada

#Criando um DataFrame somente com as colunas necessárias.
rup <- data.frame(rup$Material,rup$Data.entrega,rup$Ruptura)

#Filtrando somente valores negativos (Ruptura), ordenando por data e eliminando digitos após a virgula.
rup <- filter(rup, rup$rup.Ruptura < 0)
rup <- rup %>% arrange(rup$rup.Data.entrega)
options(digits = 3)


#Fazendo Pivot dos dados.
rup2 <- reshape(rup, direction = "wide", idvar = "rup.Material", timevar = "rup.Data.entrega")

#Removendo valores N/A
rup2 <- rup2 %>% replace(is.na(.), "")


#Criando uma tabela com os resultados.
library(flextable)

ft <- flextable(rup2)
ft <- autofit(ft)
ft
