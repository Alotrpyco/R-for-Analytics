#Indrodução ao tidyvers

#1 - o que é o tidyverse?
#1.1 - O tidyverse é um ecossistema de pacotes para ciência de dados em R, incluindo:
#readr - leitura de arquivos; dplyr - manipulação de dados; ggplot2 - visualização
#tidyr - organização de dados; tibble - substituição moderna para data frames

#1.1.2 - carregamento de pacotes

install.packages("tidyverse")
library(tidyverse)

#2 - lendo dados com "readr::read_csv()"
#2.1 - exemplo de leitura

setwd("C:/Users/sergi/Documents/GitHub/Repositório/R-for-Analytics/3.Introdução ao tidyverse")
vendas <- read.csv("C:/Users/sergi/Documents/GitHub/Repositório/R-for-Analytics/3.Introdução ao tidyverse/3.1.vendas.csv")
head(vendas) #visualizando os dados

#3 - Usando "tibble" no lugar de "data.frame"

tibble(
  produto = c("A", "B", "C"),
  preco = c(10, 15, 12),
  vendido = c(100, 80, 50)
)

################################################################################

#4.Manipulação de dados com "dplyr"
#vignette("NomeDoPaconte") #Um guia mais elaborado, muitas vezes com exemplos e contexto.

#4.1 - selecionando colunas
vendas %>% select(produto, quantidade, uf)

#4.2 - filtrar linhas
filter(vendas, valor > 500)

#4.3 - criar colunas
mutate(vendas, valor_total = valor*quantidade)

#4.4 - Ordenar dados com arrange()
#últil para classificar vendas por valor decrescente, comum em relatórios de perfomace
arrange(vendas, desc(valor))

#4.5 - renomear colunas com "rename()"
#para padronizar nomes em datasets financeiros
rename(vendas, preco_unitario = valor)

#4.6 - agrupar e resumir
vendas_resumo <- vendas %>%
group_by(produto)%>%
summarise(total = sum(valor),
          media_preco = mean(valor),
          max_venda = max(valor),
          contagem = n(),
          desvio_padrao = sd(valor)
)

print(vendas_resumo)

################################################################################
#5 - Pipes (%>%) 
# O operador "%>%" permite encadear comandos de forma mais legível

vendas %>%
  filter(quantidade > 10) %>%
  mutate(receita = valor * quantidade) %>%
  group_by(produto) %>%
  summarise(total_receita = sum(receita))
        
#---o código acima é equivalente a escrever de forma aninhada:
summarise(
  group_by(
    mutate(
      filter(vendas, valor > 10),
      receita = valor * quantidade
    ),
    produto
  ),
  total_receita = sum(receita)
)

#-------------------------------------------------------------------------------
#regras básicas
#1) %>% envia o resultado da esquerda para o primeiro argumento da função à direita
#2) se quiser colocar o objeto em outro lugar, use o ponto (.):

c("R", "Python") %>% paste("é ótimo!", .)



