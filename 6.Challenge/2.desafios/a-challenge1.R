#1.crie dois vetores com despesas e receitas mensais de uma empresa por 6 meses
despesas <- c(1500, 2500, 5400, 3500, 7500, 10000)
receitas <- c(4000, 7500, 8000, 8000, 4500, 70000)

#2.calcule o lucro mensal e o lucro total da empresa
#a) calculando o lucro mensal
lucro_mensal <- receitas - despesas

#b) calculando o lucro total
lucro_total <- sum(lucro_mensal)

#3.Classifique os meses como fator e associe-os aos valores de lucro.
#definindo os nomes dos meses
meses <- factor(c("janeiro", "fevereiro", "março", "abril", "maio", "junho"))

#criando um data frame para associar meses e lucros
resultado <- data.frame(Mês = meses, lucro_mensal)
resultado

print(lucro_mensal)
print(lucro_total)
print(resultado)
################################################################################

#4.Crie um vetor com 5 notas de um aluno e calcule a média
notas <- c(7.5, 8.0, 9.0, 6.5, 7.8) #notas dos alunos

#b)calculando a média
media <- mean(notas)

#5.Com base na média, crie um fator com as categorias “aprovado” ou “reprovado”.
status <- ifelse(media >= 7, "aprovado", "reprovado") #definindo a condição para aprovação 

# Criando um fator com o status
factor_status <- factor(status, levels = c("aprovado", "reprovado"))

print(notas)
print(media)
print(status)
print(factor_status)
################################################################################

#6.Monte uma lista com nome, idade e vetor de notas de um aluno fictício.
aluno <- list(
  aluno1 = list(nome = "Thaís", idade = 14, notas = c(10, 8, 9, 5))
)

print(aluno)
################################################################################

#7.Crie um data frame com 3 alunos e 3 colunas: nome, idade e situação (“aprovado”/“reprovado”).
alunos <- data.frame(
  nome = c("Sérgio", "Ricardo", "Tores"),
  idade = c(33, 25, 38),
  status = c("Aprovado", "Aprovado", "Reprovado")
)

print(alunos)



