#definindo diretório
getwd()
setwd("E:/ufal/dados/atv_4")
##################################################################################################

#instalando as bilbiotecas
install.packages("tidyverse")
install.packages("scales")
install.packages("dplyr")
install.packages("ggplot2")

#carregamemto das bibliotecas
library(tidyverse)
library(scales)
library(dplyr)
library(ggplot2)
###################################################################################################
glimpse(mpg)
glimpse(diamonds)
view(mpg)
view(diamonds)
##################################################################################################

#1.Comparação por grupo (mpg): crie um gráfico comparando a contagem por class separando por cyl (facetas ou cores).

mpg %>%
  count(class, cyl) %>%
  mutate(class = fct_reorder(class, n, .fun = sum)) %>%
  ggplot(aes(x = class, y = n)) +
  geom_col() +
  geom_label(aes(label = n),
             position = position_stack(vjust = 0.5),
             hjust = -0.2,
             size = 3,
             label.size = 0.2)+
  facet_wrap(~ cyl, scales = "free_y") +
  coord_flip() +
  labs(title = "Contagem de carros por classe e cilindradas",
       x = "Classe do veículo",      
       y = "Número de carros") +     
  theme_bw()
######################################################################################################################
#2.Exportação: salve um gráfico seu como “meu_grafico.png” com ggsave().
ggsave("meu_grafico.png",
       width = 10, height = 6, dpi = 300)

#####################################################################################################################
#3. Desafio bônus: no diamonds, crie um boxplot de price por cut com coord_flip() e rótulos de milhares (scales::label_comma()).
diamonds %>%
  ggplot(aes(x = cut, y = price)) +
  geom_boxplot(aes(fill = cut), alpha = 0.7, show.legend = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "red") +
  coord_flip() +
  scale_y_continuous(labels = label_comma()) +
  labs(title = "Distribuição de Preços por Qualidade do Corte",
       x = "Qualidade do Corte", 
       y = "Preço (USD)",
       caption = "Ponto vermelho: preço médio") +
  theme_minimal()


