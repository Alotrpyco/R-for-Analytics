#definindo diretório
getwd()
setwd("E:/ufal/dados")
######################################################
library(tidyverse)
library(dplyr)
library(readr)
#1.Importando o arquivo de vendas
vendas <- read.csv("vendas.csv", sep = ",")
######################################################

#2.Filtrando apenas as vendas acima de R$200
vendas_filtrada <- vendas %>%
  filter(valor > 200)
######################################################

#3. Calcule a receita por produto
#4.Selecione apenas as colunas de produto e receita.
receita_por_produto <- vendas_filtrada %>%
  mutate(receita = quantidade * valor) %>%
  group_by(produto) %>%
  summarise(receita_total = sum(receita)) %>%
  select(produto, receita_total)
######################################################

print(receita_por_produto)
  
  
  
  



