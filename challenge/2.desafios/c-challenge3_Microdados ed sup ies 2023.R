
#install.packages("stringi") #idenficando a codificação
#install.packages("dplyr") 
library(stringi)
library(dplyr)

conteudo <- readBin("E:/ufal/dados/MICRODADOS_ED_SUP_IES_2023.CSV", what = "raw")
encoding <- stri_enc_detect(conteudo)
#-------------------------------------------------------------------------------

#carregamento da planilha:
dados <- read.csv("E:/ufal/dados/MICRODADOS_ED_SUP_IES_2023.CSV", 
                  header = TRUE, 
                  sep = ";",
                  encoding = "latin1"
                  )

print(dados)

#-------------------------------------------------------------------------------

#1) Filtro UF = "AL" (armazene a tabela filtrada em df1)
#filtrando os dados pedidos
df1 <- subset(dados, SG_UF_IES == "AL")
#-------------------------------------------------------------------------------

#2) Filtro UF = "Nordeste" e categoria administrativa "Publica Municipal"
df2 <- subset(dados, NO_REGIAO_IES == "Nordeste" & TP_CATEGORIA_ADMINISTRATIVA == "3")

#-------------------------------------------------------------------------------
#3) média de servidores técnicos administrativos por UF
#calcular média de técnicos por UF
media_tec_por_uf <- dados %>%
  group_by(SG_UF_IES) %>%
  summarise(media_tec = mean(QT_TEC_TOTAL, na.rm = TRUE)) %>%
  arrange(desc(media_tec))

data.frame(media_tec_por_uf)
#-------------------------------------------------------------------------------
#4) média de servidores técnicos administrativos por UF e por TP_REDE
media_rede_regiao <- dados %>%
  group_by(TP_REDE, SG_UF_IES) %>%
  summarise(
    media_tec_adm = mean(QT_TEC_TOTAL, na.rm = TRUE),
    qtd_ies = n(),
    .groups = 'drop'
  ) %>%
  arrange(TP_REDE, desc(media_tec_adm))

print(media_rede_regiao)
#-------------------------------------------------------------------------------
#5) repetir o 3ª e o 4ª para docentes
#5.1 - média de docentes por UF
media_docentes_por_uf <- dados %>%
  group_by(SG_UF_IES) %>%
  summarise(
    media_docentes = mean(QT_DOC_TOTAL, na.rm = TRUE)
  ) %>%
  arrange(desc(media_docentes))

print(media_docentes_por_uf)

#5.2 - média de docentes por UF e por TP_REDE
media_rede_doc_por_região <- dados %>%
  group_by(TP_REDE, SG_UF_IES) %>%
  summarise(
    media_docentes_por_uf = mean(QT_DOC_TOTAL, na.rm = TRUE),
    qtd_ies = n(), 
    .groups = 'drop'
  ) %>%
  arrange(TP_REDE, desc(media_docentes_por_uf))

print(media_rede_doc_por_região)


                

