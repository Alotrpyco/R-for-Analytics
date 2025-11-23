#definindo diretório
getwd()
setwd("C:/Users/sergi/Documents/GitHub/Repositório/R-for-Analytics/4.Visualização de dados com ggplot2/d - atividades")

#Carregamento das bibliotecas
library(tidyverse)
library(dplyr)
################################################################################

#espiando os dados
glimpse(mpg)
glimpse(diamonds)
glimpse(economics)
################################################################################

#1.Barras (mpg): faça um gráfico com a soma de carros por manufacturer. Ordene as barras e coloque rótulos.
mpg %>%
  count(manufacturer) %>%
  mutate(manufacturer = fct_reorder(manufacturer, n)) %>%
  ggplot(aes(x = manufacturer, y = n)) +
  geom_col(fill = "steelblue") +
  geom_text(aes(label = n), vjust = -0.5, size = 3) +
  labs(
    title = "Quantidade de carros por fabricante",
    x = "Fabricante",
    y = "Número de carros"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Salva o gráfico plotado
ggsave("Quantidade_de_carros_por_fabricante.png", width = 8, height = 5, dpi = 300)
################################################################################

#2.Histograma (diamonds): plote a distribuição de carat. Teste dois valores de binwidth e comente o impacto.
diamonds %>%
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.1, color = "white", fill = "steelblue") +
  labs(title = "Distribuição do peso dos diamantes (carat)",
       x = "Peso (carat)", y = "Frequência") +
  theme_classic()

#Salvando o gráfico plotado
ggsave("histograma_peso_diamantes.png", width = 8, height = 5, dpi = 300)
################################################################################

#3.Linhas (economics): plote psavert (taxa de poupança pessoal) ao longo do tempo. Adicione uma linha de tendência.
economics %>%
  ggplot(aes(x = date, y = psavert)) +  # Corrigido: x = date, y = psavert
  geom_line(alpha = 0.5) +
  geom_smooth(method = "loess") +
  labs(title = "Taxa de poupança pessoal ao longo do tempo",
       x = "Ano", y = "Taxa de poupança pessoal (%)") +
  theme_minimal()

#Salvando o gráfico plotado
ggsave("taxa_poupanca_pessoal.png", width = 8, height = 5, dpi = 300)





