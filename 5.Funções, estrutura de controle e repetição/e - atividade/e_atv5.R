#definindo diretório
getwd()
setwd("E:/ufal/scripts")


#1.Usando odataset airquality, crie uma função que retorne a média da temperatura (Temp) por mês (Month).
media_temp_por_mes <- function() {

  data(airquality) #carregando o Dataset
  
  # Calculo da média da temperatura agrupada por mês
  resultado <- aggregate(Temp ~ Month, 
                         data = airquality, 
                         FUN = mean, 
                         na.rm = TRUE)
  
  colnames(resultado) <- c("Mês", "Temperatura_Média")
  
  return(resultado)
}

media_temp_por_mes()

#1.2 - Utilizado o operador pipi (%>%)

library(dplyr)

med_tem_por_mes <- function(){
  
  #carregando e trabalhando com o dataset usando pipe
  airquality %>%
    group_by(Month) %>%
    summarise(
      temperatura_media = mean(Temp, na.rm = TRUE)
    ) %>%
    rename(Mês = Month)
}

med_tem_por_mes()
