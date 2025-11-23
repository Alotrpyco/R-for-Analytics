#definindo diretório
getwd()
setwd("C:/Users/sergi/Documents/GitHub/Repositório/R-for-Analytics/4.Visualização de dados com ggplot2/d - atividades")

#Carregamento das bibliotecas
library(tidyverse)
library(dplyr)
library(ggplot)
#epiando os dados
glimpse(mpg)
glimpse(diamonds)
glimpse(economics)

detach("package:ggplot2", unload = TRUE)
#################################################################

#1.Barras (mpg): faça um gráfico com a soma de carros por manufacturer. Ordene as barras e coloque rótulos.
mpg %>%
  count(manufacturer, name = "n") %>%
  mutate(manufacturer = fct_reorder(manufacturer, n)) %>%
  ggplot(aes(x = manufacturer, y = n)) +
  geom_col(fill = "green") +
  geom_text(aes(label = n), vjust = -0.4) +
  labs(title = "Quantidade de carros por fabricante",
       x = "Fabricante",
       y = "Contagem") +
  theme_minimal()

################################################################

#2.Histograma (diamonds): plote a distribuição de carat. Teste dois valores de binwidth e comente o impacto.
diamonds %>%
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.1, color = "white", fill = "steelblue") +
  labs(title = "Distribuição do peso dos diamantes (carat)",
       x = "Peso (carat)", y = "Frequência") +
  theme_classic()

################################################################

#3.Linhas (economics): plote psavert (taxa de poupança pessoal) ao longo do tempo. Adicione uma linha de tendência.
economics %>%
  ggplot(aes(x = date, y = psavert))+
  geom_line(alpha = 0.5) +
  geom_smooth(method = "loess") +
  labs(title = "Taxa de poupança pessoal ao longo do tempo",
       x = "Ano", y = "Taxa de poupança pessoal (%)") +
  theme_minimal()
###############################################################

#4. Exportando gráficos
diamonds <- ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.1, color = "white", fill = "steelblue") +
  labs(title = "Distribuição do peso dos diamantes (carat)",
       x = "Peso (carat)", y = "Frequência") +
  theme_minimal()
ggsave("Distribuição_do_peso_dos_diamantes.png", diamonds, width = 8,
       height = 5, dpi = 300)



