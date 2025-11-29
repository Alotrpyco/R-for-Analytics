getwd()
setwd("E:/ufal/dados/atv_3")
################################################################################
install.packages("tidyverse")
install.packages("dplyr")
library(tidyverse)
library(dplyr)
################################################################################

dados <- read.csv("planilha_exemplo_com_nas.csv", stringsAsFactors = FALSE)
#1.Separe os valores da coluna letra_num em duas colunas: uma contendo a sequencia de 3 letras e outra contendo o número.
df1 <- dados %>%
  separate(
    letra_num,
    into = c("letras", "numeros"),
    sep = "(?<=^[A-Z]{3})(?=[0-9]{5})",
    remove = TRUE
    
  )

#2.Coloque os valores da coluna data no formato ANO MES DIA. 
df <- df1 %>%
  mutate(
    data_texto = as.Date(data_texto, format = "%d/%m/%Y"),
    data_texto = format(data_texto, "%Y %m %d")
  )

#3.Filtre ou substitua os valores NA
#3.1 - Opção A: Filtrar linhas que NÃO contêm NAs
df_sem_na <- df %>%
  filter(!is.na(letras) & !is.na(numero_1) & !is.na(numeros) & 
           !is.na(numero_2) & !is.na(data_texto))


#4.Renomeando as colunas mantendo a adequação
df_renomeado <- df %>%
  rename(
    codigo_letras = letras,
    codigo_numeros = numeros,
    data_formatada = data_texto
    
  )
df_final <- df_renomeado

#5. Exportar para CSV com o nome dados_final
write.csv(df_final, "dados_final.csv", row.names = FALSE, fileEncoding = "UTF-8")

