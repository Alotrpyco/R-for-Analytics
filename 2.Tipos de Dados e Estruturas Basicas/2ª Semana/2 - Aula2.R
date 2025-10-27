##Tipos de Dados e Estruturas Basicas - Curso R para iniciantes
#https://cran.r-project.org/web/packages/available_packages_by_name.html#available-packages-G


#1.Tipos básicos de dados no R
#1.1-Numérico
idade <- 35
class(idade)

#1.2-Caractere (texto)
nome <- "Carlos"
class(nome)

#1.3-Lógico (TRUE ou FALSE)
ativo <- TRUE
class(ativo)

################################################################################

#2.Vetores
nomes <- c("Maria", "João", "Ana")
idades <- c(23, 35, 31, 93, 22, 15, 19, 65)

#2.2-Acessar elementos
nomes[1]
idades[3]
idades[2:3]
idades[3:6]

#2.3-Operações com vetores
#2.3.1-soma de vetores

salarios <- c(2500, 3200, 2800)
bonus <- c(200, 300, 250)

salario_total <- salarios + bonus
salario_total

#2.3.2-Subtração entre vetores numéricos

idades <- c(23, 35, 31)
ajuste <- c(1, 0, -2)
novas_idades <- idades - ajuste
novas_idades

#2.3.3-multiplicação elemento a elemento de vetor

nota<-c(7,8,3)
peso<-c(0.2,0.5,0.3)

nota_corrigida<-nota*peso
nota_final=nota_corrigida[1]+nota_corrigida[2]+nota_corrigida[3]

#2.3.4-soma dos elementos de um vetor

nota_final_2=sum(nota_corrigida)

#2.3.5-Operações lógicas com vetores (Ex: verificar um critério)

idades <- c(23, 35, 31)
idades > 30       # Retorna TRUE para idades maiores que 30

check_idade <- (idades > 30)
print(check_idade)

################################################################################

#3-Fatores: Fatores são usados para representar variáveis categóricas.

setores <- c("Financeiro", "RH", "Vendas", "Financeiro")
fator_setores <- factor(setores)

fator_setores
levels(fator_setores)

fator_setor_ordenado <- factor(setores, levels = c("RH", "Vendas", "Financeiro"))
levels(fator_setor_ordenado)

sexo <- factor(c("M", "F", "F", "M"))
class(sexo)
levels(sexo)

sexo_L <- factor(c("M", "F", "F", "M"), levels = c("M","F"))
levels(sexo_L)

curso <-c("Economia", "Economia", "Contábeis", "Administração", "Artes Cênicas", "Administração")

curso_fator <- factor(curso, levels=c("Economia","Contábeis","Artes Cênicas", "Administração"))

levels(curso_fator)

nivel_educacional <- factor(
  c("Médio", "Superior", "Médio", "Fundamental"),
  levels = c("Fundamental", "Médio", "Superior"),
  ordered = TRUE)

#######################################################################################
#4-Listas: Listas armazenam elementos de diferentes tipos.


#4.1-formas igualmente válidas de escrever um comando extenso

dados_i <- list(nome = "Carlos", idade = 35, ativo = TRUE, notas = c(8.5, 7.9, 9.0))

dados <- list(nome = "Carlos",
              idade = 35, 
              ativo = TRUE, 
              notas = c(8.5, 7.9, 9.0)
)


dados_i$idade # Acessa o valor da chave idade
dados$idade

dados$nome     # Acessa elemento pelo nome
dados[[2]]     # Acessa pelo índice
dados[[4]]

#4.2-Lista com elementos de tipos diferentes
info <- list(
  nome = "Carlos",
  idade = 35,
  ativo = TRUE,
  notas = c(8.5, 7.9, 9.0)
)

info

#4.3-Acessando elementos da lista
info$nome          # Pelo nome
info[["idade"]]    # Pelo nome entre colchetes duplos
info[[4]]          # Pelo índice

info[1]            # Retorna uma sublista
info[[1]]          # Retorna o conteúdo direto (string "Carlos")

###############################################################################
#5-Verificando estrutura
str(info)       # Estrutura da lista
length(info)    # Número de elementos
names(info)     # Nomes dos elementos


#5.1-Adicionando elementos
info$email <- "carlos@email.com"
info #ou

info[["cidade"]] <- "Maceió"


#5.2-Removendo elementos
info$cidade <- NULL
info


#5.3-Modificando elementos
info$idade <- 36
info$notas[2] <- 8.3

################################################################################
#6-Listas dentro de listas (listas aninhadas)
aluno <- list(
  nome = "Ana",
  dados = list(
    idade = 22,
    curso = "Administração"
  ),
  notas = c(9.0, 8.5, 10)
)

#6.1-Acessando dados aninhados
aluno$dados$curso
aluno[["dados"]][["idade"]]


#6.2-Aplicando funções com lapply() e sapply()
#11.1-Criando uma lista de vetores
numeros <- list(a = 1:5, b = 6:10, c = 11:15)
################################################################################

#7-Soma de cada vetor
lapply(numeros, sum)    # Retorna uma lista
sapply(numeros, sum)    # Retorna um vetor (mais compacto). Se não der, retorna uma lista.

#7.1-Convertendo lista para data frame (quando possível)
dados <- list(
  nome = c("Ana", "Bruno", "Carlos"),
  idade = c(21, 25, 24),
  ativo = c(TRUE, TRUE, FALSE)
)

df <- as.data.frame(dados)
df


#7.2-Exemplo prático com lista de alunos
alunos <- list(
  aluno1 = list(nome = "Ana", notas = c(9, 8, 10)),
  aluno2 = list(nome = "Bruno", notas = c(7, 6, 8)),
  aluno3 = list(nome = "Carla", notas = c(10, 9, 9.5))
)

#7.3-Média das notas de cada aluno
sapply(alunos, function(x) mean(x$notas))

################################################################################
#8-Matrizes: Matrizes são estruturas bidimensionais (linhas x colunas) com elementos do mesmo tipo.


#8.1-Criar uma matriz 2x3 preenchida por colunas
A <- matrix(1:6, nrow = 2, ncol = 3)
A
#8.2-Criar preenchendo por linha
B <- matrix(1:6, nrow = 2, byrow = TRUE)
B

notas <- matrix(
  c(8, 7, 9,
    6, 8, 5,
    9, 9, 10),
  nrow = 3,
  byrow = TRUE
)
#8.3-operação com matrizes

M1 <- matrix(c(1, 2, 3, 4), nrow = 2)
M2 <- matrix(c(5, 6, 7, 8), nrow = 2)

M1 + M2 #soma elemento a elemento
M1 - M2 #subtração
M1 * M2 #multiplicação de matrizes 

#8.5-Multiplicação Matricial (%*%)
M1 %*% M2     # Multiplicação matricial padrão (produto interno)

#8.6-Transposta da Matriz
A <- matrix(1:6, nrow = 2)
t(A)       # Transposta (linhas viram colunas)

#8.7-Determinante
M <- matrix(c(2, 3, 1, 4), nrow = 2)
det(M)

#8.8-Inversa da Matriz
M <- matrix(c(2, 3, 1, 4), nrow = 2)
solve(M)       # Retorna a inversa da matriz

#8.9-Exemplo Integrado
notas <- matrix(
  c(8, 7, 9,
    6, 8, 5,
    9, 9, 10),
  nrow = 3,
  byrow = TRUE
)

rownames(notas) <- c("Aluno1", "Aluno2", "Aluno3")
colnames(notas) <- c("Prova1", "Prova2", "Prova3")

notas

# Média por aluno
apply(notas, 1, mean)

# Média por prova
apply(notas, 2, mean)
################################################################################

#9-Data Frames (introdução): Data frames são uma das estruturas mais usadas no R para representar dados em formato de tabela.

#9.1-Criando um data.frame
df <- data.frame(
  nome = c("Maria", "João", "Ana"),
  idade = c(23, 35, 31),
  ativo = c(TRUE, TRUE, FALSE)
)

str(df)      # Mostra a estrutura do data frame
df$idade     # Acessa a coluna "idade"
df[1, 2]     # Acessa o valor da primeira linha, segunda coluna
dados <- data.frame(
  nome = c("Ana", "Bruno", "Carlos", "Daniela"),
  idade = c(22, 25, 24, 21),
  curso = c("ADM", "ECON", "CONT", "ADM"),
  ativo = c(TRUE, TRUE, FALSE, TRUE)
)

dados

#9.2-Acessando colunas, linhas e células
dados$idade         # Coluna 'idade'
dados[2, ]          # Segunda linha
dados[, 3]          # Terceira coluna
dados[1, 2]         # Célula da 1ª linha, 2ª coluna

#9.3-Estrutura e resumo
str(dados)          # Estrutura do data frame
summary(dados)      # Resumo estatístico
nrow(dados)         # Número de linhas
ncol(dados)         # Número de colunas
names(dados)        # Nomes das colunas

#9.4-Adicionando colunas e linhas

#9.4.1-Adicionando uma coluna
dados$nota <- c(8.5, 7.2, 9.0, 6.8)

#9.4.2-Adicionando uma linha
nova_linha <- data.frame(
  nome = "Eduardo",
  idade = 23,
  curso = "ECON",
  ativo = TRUE,
  nota = 8.0
)

dados <- rbind(dados, nova_linha)

#9.4.3-Removendo colunas ou linhas
dados$ativo <- NULL        # Remove a coluna 'ativo'
dados <- dados[-2, ]       # Remove a 2ª linha

#9.4.4-Filtrando linhas com condições
dados[dados$idade > 22, ]                 # Idade maior que 22
dados[dados$curso == "ADM", ]             # Alunos de Administração
dados[dados$nota >= 8 & dados$curso == "ECON", ]  # Notas boas na Economia

#9.4.5-Juntando Data Frames com merge():A função merge() permite combinar dois data frames com base em uma ou mais colunas em comum (como um “vlookup” no Excel).
alunos <- data.frame(
  id = c(1, 2, 3),
  nome = c("Ana", "Bruno", "Carlos")
)

notas <- data.frame(
  id = c(1, 2, 3),
  nota_final = c(8.5, 7.2, 9.0)
)

#9.4.6-Tipos de merge: Você pode controlar o tipo de junção:

#9.4.7-Inner join (padrão) Junta apenas as linhas em que o valor da coluna usada no by está presente nos dois data frames.

df1 <- data.frame(id = c(1, 2, 3), nome = c("Ana", "Bruno", "Carlos"))
df2 <- data.frame(id = c(2, 3, 4), nota = c(8.5, 7.2, 9.0))

merge(df1, df2, by = "id") 

# 9.4.8-Left join. Mantém todas as linhas de x, e adiciona informações de y se houver correspondência. Se não houver, preenche com NA.

merge(df1, df2, by = "id", all.x = TRUE)

#9.4.9-Right join. Mantém todas as linhas de y, e pega as correspondências de x.

merge(df1, df2, by = "id", all.y = TRUE)

#9.4.10-Full outer join. Junta todos os dados de x e y, preenchendo com NA onde não houver correspondência.

merge(df1, df2, by = "id", all = TRUE)

#9.4.7-Junta os dois data frames pela coluna "id"
dados_completos <- merge(alunos, notas, by = "id")
dados_completos


#9.4.8-Ordenando um data.frame
#9.4.9-Ordenar por idade crescente
dados[order(dados$idade), ]

#9.4.10-Ordenar por nota decrescente
dados[order(-dados$nota), ]
################################################################################

#10-subset() – Filtro com mais clareza
subset(dados, curso == "ECON" & nota >= 8)

################################################################################
#11-Convertendo variáveis para fator
dados$curso <- as.factor(dados$curso)
str(dados)

################################################################################
#12-Estatísticas por grupo com tapply()
# Média de notas por curso
tapply(dados$nota, dados$curso, mean)

#12.1-Exemplo de aplicação prática
#12.1.1-Média de idade dos alunos ativos
media_idade_ativos <- mean(dados$idade[dados$ativo == TRUE])
print(media_idade_ativos)
################################################################################
#13.1.2-Adicionando linhas com rbind() (append de data frames): Para acrescentar linhas de um data frame ao outro (desde que tenham as mesmas colunas):
  
df1 <- data.frame(nome = c("Ana", "Bruno"), idade = c(22, 25))
df2 <- data.frame(nome = c("Carlos", "Daniela"), idade = c(24, 21))

df_total <- rbind(df1, df2)
df_total
################################################################################
#14.Tipos Lógicos: No R, o tipo lógico (ou booleano) representa apenas dois valores: TRUE ou FALSE

gasto <- 4000
orcamento <- 3500

gasto > orcamento  # TRUE
gasto <= 5000      # TRUE


T <- "texto"  # Isso sobrescreve o valor lógico! Evite!

x <- 10
x > 5      # TRUE
x == 10    # TRUE
x != 7     # TRUE
x < 3      # FALSE
################################################################################
#15.Exemplos com Operadores Lógicos
#15.1-E lógico (AND)
#Retorna TRUE apenas se ambos os valores forem TRUE.

TRUE & TRUE      # TRUE
TRUE & FALSE     # FALSE
FALSE & FALSE    # FALSE
#Exemplo com vetor:
  
  idades <- c(16, 22, 30, 17)
ingressos <- c(TRUE, TRUE, FALSE, TRUE)

# Ver quem tem 18+ E comprou ingresso
idades >= 18 & ingressos
# Resultado: FALSE  TRUE FALSE FALSE

#15.2 – OU lógico (OR): Retorna TRUE se pelo menos um dos valores for TRUE.

TRUE | FALSE     # TRUE
FALSE | FALSE    # FALSE
TRUE | TRUE      # TRUE

#Exemplo com vetor:

idoso <- c(FALSE, FALSE, TRUE, FALSE)
estudante <- c(TRUE, FALSE, FALSE, TRUE)

# Tem direito a desconto (se for idoso OU estudante)
idoso | estudante
# Resultado: TRUE FALSE TRUE TRUE

#15.3 - NÃO lógico (NOT):Inverte o valor lógico: TRUE vira FALSE, e vice-versa.
!TRUE    # FALSE
!FALSE   # TRUE

#Exemplo com vetor:
  
ativo <- c(TRUE, TRUE, FALSE, TRUE)
!ativo
# Resultado: FALSE FALSE TRUE FALSE

#15.4-Combinações mais complexas: Você pode combinar operadores:

idade <- 20
tem_documento <- TRUE

(idade >= 18) & tem_documento   # TRUE
(idade >= 18) & !tem_documento  # FALSE

#15.5 Exemplos com vetores

idades <- c(15, 22, 30, 17)

# Quais são maiores de idade?
idades >= 18
# Resultado: FALSE TRUE TRUE FALSE

# Filtro: quais idades são maiores que 20?
idades[idades > 20]

#Tipos lógicos são essenciais para selecionar dados com condições:

dados <- data.frame(
  nome = c("Ana", "Bruno", "Carlos"),
  idade = c(22, 17, 19)
)

# Selecionar apenas maiores de idade
dados[dados$idade >= 18, ]

#16-Guia Rápido: Verificação e Conversão de Tipos no R
#16.1-Funções is. — Verificam o tipo do objeto
#16.2-is.numeric(10)             # TRUE
#16.3-is.character("abc")        # TRUE
#16.4-is.logical(TRUE)           # TRUE
#16.5-is.integer(10L)            # TRUE
#16.6-is.factor(factor("A"))     # TRUE
#16.7-is.matrix(matrix(1:4, 2))  # TRUE
#16.8-is.data.frame(mtcars)      # TRUE
#16.9-is.list(list(a = 1))       # TRUE
################################################################################

#17.Funções as. — Convertem para outro tipo
#17.1-as.numeric("10.5")                     # 10.5
#17.2-as.character(123)                      # "123"
#17.3-as.logical(0)                          # FALSE
#17.4-as.integer(10.7)                       # 10
#17.5-as.factor(c("A", "B", "A"))            # Converte para fator
#17.6-as.matrix(data.frame(x = 1:3))         # Converte para matriz
#17.7-as.data.frame(matrix(1:4, ncol = 2))   # Converte para data frame
#17.8-as.list(c(1, 2, 3))                    # Converte vetor para lista

###Atenção com conversões inválidas
#as.numeric("abc")   # Retorna NA e gera um aviso
###Dica
#Use is. para testar o tipo antes de aplicar funções específicas,
#e as. para converter tipos quando necessário durante análises.

#18-Resumo
#18.1-Tipos básicos: numérico, caractere, lógico
#18.2-Vetores e suas operações
#18.3-Fatores para variáveis categóricas
#18.4-Listas com múltiplos tipos
#18.5-Matrizes bidimensionais
#18.6-Introdução aos data frames




