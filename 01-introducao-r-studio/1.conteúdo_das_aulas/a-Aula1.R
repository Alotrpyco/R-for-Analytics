#Introdução ao R e RStudio - Curso R para iniciantes

#1-O que é o R?
#R é uma linguagem de programação livre voltada para estatística, ciência de dados e gráficos.

#2-O que é o RStudio?
#RStudio é um ambiente que facilita escrever, salvar e executar códigos R. É uma “tela amigável” para trabalhar com dados.

#3-Operações Matemáticas no R
#

#3.1-Adição
2 + 3

#3.2-Subtração
10 - 4

#3.3-Multiplicação
6 * 7

#3.4-Divisão
20 / 5

#3.5-Potência
2^3

#3.6-Raiz quadrada
sqrt(25)

#3.7-Módulo (resto da divisão)
10 %% 3

#3.8-Parte inteira da divisão
10 %/% 3
################################################################################
#4-Criando Objetos (Variáveis)
#4.1-Atribuição com "<-"
a <- 10
b <- 5
soma <- a + b
print(soma)
#Também funciona com =:
  
x = 100
################################################################################
#5-Verificando o tipo e classe dos objetos
class(soma)     # tipo de estrutura (numeric, character, etc)
typeof(soma)    # tipo interno do R

#6 - Lista de Objetos e Remoção de Variáveis: 
#Quando criamos variáveis (ou “objetos”) no R, elas ficam armazenadas na memória. Podemos listar, remover ou limpar tudo, dependendo da necessidade.

#6.1-Listando os objetos criados
ls()     # Lista todos os objetos (variáveis) que estão carregados no ambiente

#6.2-emovendo um objeto específico
rm(b)    # Remove o objeto 'b'

#6.3-Removendo vários objetos ao mesmo tempo
rm(a, soma)   # Remove os objetos 'a' e 'soma'

#6.4-Limpando todos os objetos do ambiente
rm(list = ls())   # Remove tudo do ambiente

#Essa última linha é útil para começar um script “do zero”, com o ambiente limpo. 
#Use com cuidado: ela apaga todas as variáveis que você criou.
################################################################################

#7-Acessando ajuda
help(mean)   # abre a documentação da função mean()
?mean        # atalho

help.search("regression")  #Se você não souber o nome exato da função
??regression

args(mean) #Ver a estrutura da função

help(package = "ggplot2") #Ajuda com pacotes específicos
#https://www.rdocumentation.org Documentação dos comandos
################################################################################

#8-peradores relacionais e lógicos
# Relacionais
5 > 3
4 == 4
2 != 3

# Lógicos
TRUE & FALSE
TRUE | FALSE
!TRUE
################################################################################
#9-Comentários no código
# Isto é um comentário. O R ignora essa linha.
salario <- 3000  # atribuição de valor

#Dica: use scripts: Salve seus comandos em arquivos .R ou .Rmd para reutilizá-los.
#Use a tecla Ctrl + Enter para executar linha por linha.
################################################################################

#10-Pacotes no R: o que são e como usar
###O R vem com várias funções prontas, mas você pode aumentar suas capacidades instalando pacotes (ou “bibliotecas”).
#################################################################################
#11-O que é um pacote?
#11.1-Um pacote é um conjunto de funções, dados e documentação que adiciona novos recursos ao R.

################################################################################
#12-Exemplos: - ggplot2 → gráficos - dplyr → manipulação de dados - readxl → leitura de arquivos Excel

#12.1-Instalando um pacote
#12.2-Você só precisa instalar uma vez (por computador ou usuário):
################################################################################

#13-install.packages("nome_do_pacote")
#13.1-Exemplo:
install.packages("ggplot2")
################################################################################
#14-Carregando um pacote
#14.1-Você precisa carregar o pacote sempre que iniciar um novo script ou sessão:
  
library(ggplot2)
################################################################################
#15.1-Atualizando pacotes: Para manter os pacotes atualizados:
#15.2 - update.packages()
#Você também pode usar:
################################################################################

install.packages("ggplot2")  # novamente, para instalar a versão mais recente
#17-dica importante
#17.1-Se você tentar usar uma função sem carregar o pacote, o R dará erro:
#17.2-Error in ggplot(...) : could not find function "ggplot"
################################################################################

#18-Resumo da Aula
#18.1-Conhecemos o R e o RStudio
#18.2-Aprendemos operações básicas e como criar variáveis
#18.3-Vimos comandos úteis como print(), class(), ls(), help()
#18.4-Aprendemos a usar comentários e a estrutura de um script

