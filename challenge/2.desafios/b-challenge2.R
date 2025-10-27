#1.Crie uma matriz com 3 linhas e 3 colunas representando notas de 3 alunos em 3 provas.
#1.1 - Dê nomes às linhas(nomes dos alunos) e colunas (P1, P2, P3)
notas <- matrix(
  c(8.5, 9, 10,
    10, 8.5, 9,
    9.5, 7.5, 6.5),
  nrow = 3,
  byrow = TRUE
)
rownames(notas) <- c("Taís", "Dorinha", "Sérgio")
colnames(notas) <- c("Análise", "Álgebra", "Cálculo Avançado")
  
print(notas)
#1.2 - Calcule a média por aluno (linha) e por prova (coluna)
apply(notas, 1, mean) #média por linha
apply(notas, 2, mean) #média por coluna
################################################################################
  
#2. Construa uma lista que armazene os dados de cada aluno:
#2.1 - Nome, Idade, Notas(vetor), média, situação
dados_alunos <- list(
  aluno1 = list(nome = "Taís", idade = 19, notas = c(6, 9, 10)),
  aluno2 = list(nome = "Dorinha", idade = 22, notas = c(10, 8.5, 9)),
  aluno3 = list(nome = "Sérgio", idade = 34, notas = c(9.5, 7.5, 6.5))
)
  
# Função para calcular média e situação
calcular_media_e_situacao <- function(aluno) {
  aluno$média <- mean(aluno$notas)
  aluno$situação <- ifelse(aluno$média >= 7, "Aprovado", "Reprovado")
  return(aluno)
}
  
# Aplicando a função a cada aluno na lista
dados_alunos <- lapply(dados_alunos, calcular_media_e_situacao)
  
# Visualizando os dados com as médias e situações
dados_alunos
################################################################################
  
#3. Crie dois data frames:
library(dplyr)
#3.1 Um com dados cadastrais (nome, idade)
df <- data.frame(
  nome = c("Taís", "Dorinha", "Sérgio"),
  idade = c(25, 22, 34)
)
  
#3.2 Outro com dados acadêmicos (nome, média, Situação)
df2 <- data.frame(
  nome = c("Sérgio", "Ricardo", "Torres"),
  média = c(7.5, 5, 9.5),
  situação = c("Aprovado", "Reprovado", "Aprovado")
)
    
#3.3 Use a função merge() para juntar os dois com base nome do aluno (experimente os tipos "inner", "left", "full", "join")
  
merge_inner <- merge(df,df2, by = "nome") #Inner join (padrão) Junta apenas as linhas em que o valor da coluna usada no by está presente nos dois data frames.
merge_left <- merge(df, df2, by = "nome", all.x = TRUE) # Left join. Mantém todas as linhas de x, e adiciona informações de y se houver correspondência. Se não houver, preenche com NA
merge_right <- merge(df, df2, by = "nome", all.y = TRUE) # Right join. Mantém todas as linhas de y, e pega as correspondências de x.
merge_full <- merge(df, df2, by = "nome", all = TRUE) # Full outer join. Junta todos os dados de x e y, preenchendo com NA onde não houver correspondência.
   
#visualizar os marges
print(merged_inner)
print(merge_left)
print(merge_right)
print(merge_full)
  
#4. Use operadores lógicos para:
#4.1 - Filtrar alunos com média acima de 7
alunos_aprovadoss <- lapply(dados_alunos, function(aluno){
  if (aluno$média > 7){
    return(aluno)
  }
})
  
#4.2 - verificar quem tem mais de 20 anos e foi aprovado
aluno_maior_20_aprovados <- lapply(dados_alunos, function(aluno){
  if (aluno$idade > 20 && aluno$situação == "aprovado"){
    return(aluno)
  }
})
  
#4.3 - identificar os reprovados com menos de 18 anos.
aluno_menor_18_reprovados <- lapply(dados_alunos, function(aluno){
  if (aluno$idade < 18 && aluno$situação == "reprovado"){
    return(aluno)
  }
})
################################################################################

#5 - Crie um vetor com os nomes dos meses do semestre e use-o como fator ordenado.
meses_semestre <- c("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho")
meses_fator <- factor(meses_semestre, 
                      levels = meses_semestre, 
                      ordered = TRUE)

print(meses_fator)
#5.1 - Associe esse fator aos vetores de despesas e receitas criados antes.
despesas <- c(1500, 2500, 5400, 3500, 7500, 10000)
receitas <- c(4000, 7500, 8000, 8000, 4500, 70000)

# Associando o fator ordenado aos vetores
names(receitas) <- meses_fator
names(despesas) <- meses_fator

print("Receitas por mês:")
print(receitas)

print("Despesas por mês:")
print(despesas)

#5.2 - Construa um data.frame com mês, receita, despesa, lucro.
df_financeiro <- data.frame(
  mes = meses_fator,
  receitas = receitas,
  despesas = despesas,
  lucro = receitas - despesas
)

print(df_financeiro)
################################################################################

#6 - Exporte esse "data.frame" para um arquivo .csv usando write.csv()
write.csv(df_financeiro, 
          file = "E:/ufal/dados/financeiro_semestre.csv", 
          row.names = FALSE)
################################################################################
#7 - Apresente 5 novos comandos (operações) em matrizes.
#a)."crossprod()" - Produto cruzado de matrizes
#b)."tapply()" com matrizes - Aplicar função a subconjuntos
#c)."sweep()" - Aplicar operação entre matriz e vetor
#d)."outer()" - Produto externo
#e)."eigen()" - Autovalores e autovetores
e################################################################################

#8.Apresente 5 novos comandos (operações) em listas.
#a) "rapply()" - Aplicar função recursivamente em listasLista aninhada complexa
#b) "purrr::map()" - Aplicar função a cada elemento (pacote purrr)
#c) "utils::modifyList()" - Modificar elementos de lista de forma seletiva
#d)"purrr::transpose()" - Transpor lista de listas
#e)"flatten()" - Achatar listas aninhadas
################################################################################

#9.Apresente 5 novos comandos (operações) em dataframes.
#a)"dplyr::across()" - Aplicar funções a múltiplas colunas
#b)"tidyr::pivot_wider()" - Transformar dados de longo para wide
#c)"data.table::setDT()" e operações in-place - Trabalhar com data.table
#d)"dplyr::case_when()" - Condições complexas em mutate
#e)"purrr::map_df()" - Processar e combinar listas em dataframe