#Visualização de dados com o ggplot2

#definindo diretório
getwd()
setwd("C:/Users/sergi/Documents/GitHub/Repositório/R-for-Analytics/4.Visualização de dados com ggplot2/4ª Semana")

#Carregando pacotes
library(tidyverse)
library(dplyr)

#Espiando dados
glimpse(mpg)
glimpse(diamonds)
glimpse(economics)
glimpse(mtcars)

view(mtcars)
view(diamonds)
view(mpg)
##############################################################################

#1.Gráficos de barras

#Exemplo: quantos carros por classe (class) na base mpg.

mpg %>%
  count(class, name = "n") %>%
  mutate(class = fct_reorder(class, n)) %>% #ordena pelas contagens
  ggplot(aes(x = class, y = n)) +
  geom_col(fill = "blue") +
  geom_text(aes(label = n), vjust = -0.4) +
  labs(title = "Quantidades de carros por classe",
       x = "Classe",
       y = "Contagem") +
  theme_minimal()

# Gráfico de barras em ordem decrescente

mpg %>%
  count(class, name = "n") %>%
  mutate(class = fct_reorder(class, -n)) %>% #ordena pelas contagens
  ggplot(aes(x = class, y = n)) +
  geom_col(fill = "blue") +
  geom_text(aes(label = n), vjust = -0.4) +
  labs(title = "Quantidade de carros por classe",
     x = "Classe",
     y = "Contagem") +
  theme_minimal()

# Barras proporcionais (percentuais)

mpg %>%
  count(class, name = "n") %>%
  mutate(pct = n / sum(n)) %>%
  ggplot(aes(x = fct_reorder(class, pct), y = pct)) +
  geom_col(fill = "purple") +
  scale_y_continuous(labels = scales::percent) +
  geom_text(aes(label = round(pct,3)*100), vjust = -0.4)+
  labs(title = "Proporção por classe de veículo",
       x = "Classe",
       y = "Proporção") +
  theme_classic()
################################################################################

#2.Gráfico de linhas

economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line(size = 1) +
  labs(title = "Evolução do desemprego nos EUA",
       x = "Ano",
       y = "Número de desempregados")+
  scale_y_continuous(labels = scales::label_comma()) +
  theme_bw()

economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line(color = "blue", size = 1, linetype = "dotted") +
  labs(title = "Evolução do desemprego nos EUA",
       x = "Ano",
       y = "Número de desempregados") +
  scale_y_continuous(labels = scales::label_comma()) +
  theme_bw()

#Linha com suavização (tendência)
economics %>%
  ggplot(aes(x = date, y = unemploy)) +
  geom_line(alpha = 0.5) +
  geom_smooth(method = "loess", se = FALSE) +
  labs(title = "Desempregado com linha de tendência (LOESS)",
       x = "Ano",
       y = "Desempregado") +
  theme_minimal()

################################################################################
#3.Gráfico de setore (pizza)

mpg %>%
  count(class, name = "n") %>%
  mutate(pct = n / sum(n)) %>%
  ggplot(aes(x = "", y = pct, fill = class)) +
  geom_col(width = 1, color = "white") +
  coord_polar(theta = "y") +
  geom_text(aes(label = scales::percent(pct)),
            position = position_stack(vjust = 0.5), size = 4) +
  labs(title = "Distribuição por classe (mpg)", x = NULL, y = NULL, fill = "Classe") +
  theme_void()

#Barras horizontais
mpg %>%
  count(class, name = "n") %>%
  mutate(pct = n / sum(n),
         class = fct_reorder(class, pct)) %>%
  ggplot(aes(x = class, y = pct)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Proporção por classe (alternativa às pizzas)",
       x = "Classe", y = "Proporção") +
  theme_minimal()

################################################################################

# 4.Hitrograma

ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500, color = "black", fill = "steelblue") +
  labs(title = "Distribuição dos preços de diamantes",
       x = "Preço (USD)", y = "Frequência") +
  theme_minimal()

#Densidade (alternativa suave)
ggplot(diamonds, aes(x = price)) +
  geom_density(fill = "lightblue", alpha = 0.6) +
  labs(title = "Densidade dos preços de diamantes",
       x = "preços (USD)", y = "Densidade") +
  theme_classic()

#Facetas (comparar grupos lado a lado)
mpg %>%
  count(manufacturer, fl) %>%
  mutate(manufacturer = fct_reorder(manufacturer, n, .fun = sum)) %>%
  ggplot(aes(x = manufacturer, y = n)) +
  geom_col() +
  facet_wrap(~ fl, scale = "free_y") +
  coord_flip() +
  labs(title = "Contagem por fabricante, facetando por combustível",
       x= "Fabricante", y = "Contagem") +
  theme_bw()
################################################################################

#5.Gráfico de dispersão
mtcars %>%
  rownames_to_column("modelo") %>%
  ggplot(aes(x = wt, y = mpg, color = "black")) +
  geom_point(size = 3) +
  labs(title = "Consumo (mpg) vs peso (wt)",
       x = "Peso (1000 lbs)", y = "Milhas por galão") +
  theme_minimal()

#5.1 -  Mapear estética por grupo (cores, formas)
mtcars %>%
  rownames_to_column("modelo") %>%
  mutate(cilindros = factor(cyl)) %>%
  ggplot(aes(x = wt, y = mpg, color = "purple")) +
  geom_point(size = 3) +
  geom_smooth(se = FALSE) +
  labs(title = "Consumo (mpg) vs Peso (wt) por nº de cilindros",
       x = "Peso (1000 lbs)", y = "Milhas por galão",
       color = "Cilindros") +
  theme_minimal()
################################################################################

#Título, rótulos e escalas
mpg %>%
  mutate(cambio = if_else(trans %>% str_detect("Auto"), "Automático", "Manual")) %>%
  count(cambio) %>%
  ggplot(aes(x = cambio, y = n, fill = cambio)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = n), vjust = -0.4) +
  labs(title = "transmissão dos veículos (mpg)",
       x = NULL, y = "Quantidade") +
  scale_y_continuous(expand = expansion(mult = c(0, .1))) +
  theme_minimal()
################################################################################

#Exportando gráficos
p <- ggplot(diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500, color = "blue", fill = "steelblue") +
  labs(title = "Distribuição dos preços de diamantes",
       x = "Preço (USD)", y = "Frequência") +
  theme_minimal()

ggsave("hist_preco_diamonds.png", p, width = 8, height = 5, dpi = 300)

  
ggplot(diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.6) +
  labs(title = "Preço vs Peso de diamantes",
       x = "Peso (carat)", y = "Preço (USD)") +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")

  
  
  
  
  
