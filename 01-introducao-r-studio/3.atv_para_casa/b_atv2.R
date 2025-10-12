#1.Criar um vetor com os nomes de 4 cidades
cidades <- c("Maceió", "Recife", "Salvador", "Natal")

#2.Crie um vetor com o PIB(em milhões)
pib <- c(27000, 56000, 62000, 31000)

#3.Calcule o PIB total
pib_total <- sum(pib)

#4.Classifique o vetor de cidades como fotor
fator_cidades <- factor(cidades)

#########################################################

#5.Crie uma lista contendo o cadastro de um tipo de automóvel
car <- list(marca = "Toyota", 
            modelo = "Corolla",
            Ano = "2025",
            Cor = "Preto",
            Placa = "ABC - 1234",
            Tipo_combustivel = "Gasilina",
            Quilometragem = "15000",
            Valor = "90000")

########################################################

#6. Crie uma matriz quadrada e calcule sua inversa
#a - criando um matriz quadrada:
matrix_quadrada <- matrix(c
                          (3, 4, 5, 9),
                          nrow = 2,
                          byrow = TRUE)

#b - Calculando sua inversa. Porém, para calcular a matriz inversa, é necessário calcular o determinante. Se o determinante for diferente de 0, então a matriz inversa é possível.
#b.1 - calculando o determinante:
det(matrix_quadrada)

#b.2 - Calculando a matrix inversa:
solve(matrix_quadrada)

#7 Crie um dataframe contendo nome idade sexo e altura para 4 pessoas.
pessoas <- data.frame(
                      nome = c("Ana", "Sérgio", "Ricado", "Dora aventureira"),
                      idade = c(32, 36, 27, 25),
                      sexo = c("Feminino", "Masculino", "Masculino", "Feminino"),
                      altura = c(1.60, 1.70, 1.75, 1.59))
print(pessoas)
########################################################
#8. transforme a coluna sexo em fator
pessoas$sexo <- factor(pessoas$sexo, levels = c("masculino", "feminino"))
print(pessoas)






