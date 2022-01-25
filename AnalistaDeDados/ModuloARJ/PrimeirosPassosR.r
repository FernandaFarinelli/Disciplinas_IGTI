2+2 #adição
4-2 #subtração

2*2 # multiplicação

4/2 # Divisão

3^3 # Exponencial
sqrt(16) # Raiz quadrada
log(100,10) #Logarítimo de 100 na base 10

# Criar variavel recebendo valores

x<-3+2

y=4

#imprimir conteúdo da variavel
x
y

z=x+y
z

paste("X= ", x, "Y= ", y,"Z= ",z, sep=" ") #concatena valores na string

sprintf("X = %d; Y = %d; Z = %d", x,y,z)

#imprimir conteúdo da variavel
print(x)

#Criar vetor

vetor <- c(1,2,3,4,5,6)

vetor

#calculo da média
media <- (1+2+3+4+5+6)/6
media
mean(vetor)

print(vetor)

nome <- 'linguagem R'
nome
toupper(nome) # todas maiusculas
tolower(nome) # todas minusculas

class(x)
class(vetor)
class(nome)

pi

letters
LETTERS

month.abb
month.name

x <- 10 # atribuindo o valor 10 ao objeto x
y <- 20 # atribuindo o valor 20 ao objeto y
x
y
x < y # x é menor que y ?
x > y # x é maior que x ?
x < x # x é menor que x ?
x > x # x é maior que x ?
x <= x # x é menor igual que x ?
x >= x # x é maior igual que x ?
x != y # x é diferente de y ?
x == y # x é igual a y ?

x <- 20 # atribuindo o valor 20 ao objeto x
y <- 20 # atribuindo o valor 20 ao objeto y
x
y
x == y # x é igual a y ?

# Leitura de arquivo csv

dados <- read.csv(file = '/content/sample_data/california_housing_test.csv')
length(dados) # numero de colunas

head(dados)
tail(dados)

#Leitura de arquivo xls

dados <- read_excel("/content/clientes.xlsx", sheet = 1)

install.packages("readxl") #instalar

library(readxl) #importar

#Buscar ajuda para um pacote
help(readxl)

#Leitura de arquivo xls

clientes <- read_excel("/content/clientes.xlsx", sheet = 1)


head(clientes,3)
tail(clientes,2)

clientes$Idade

plot(clientes$Idade)

# medidas de posição
summary(clientes)

# gerar gráfico gráfico linear
plot(clientes$Idade, clientes$qtd_filhos)

plot(Idade ~ salario, data = clientes)


