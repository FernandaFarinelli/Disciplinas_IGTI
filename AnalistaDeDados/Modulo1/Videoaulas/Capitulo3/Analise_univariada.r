#importa pacote
library('readr')

# Lê/coleta dados no arquivo

dados_cliente <- read.csv("./clientes.csv",sep=";")

head(dados_cliente)

# Descrever a estrutura dos dados

str(dados_cliente)

tail(dados_cliente)

# Definimos que a variável Grau.Instrução deve ser tratada como ordinal

levels(dados_cliente$Grau.Instrução)

# Frequência absoluta

fa <- table(dados_cliente$Estado.civil)
fa

# Frequência relativa

fr1 <- fa/length(dados_cliente$Estado.civil)
fr1

# Frequência relativa

fr2 <- prop.table(fa)
fr2

# Frequência percentual

fpct <- prop.table(fa)*100
fpct


round(fpct,digit=2)

# Moda
names(fa)[which.max(fa)]

barplot(fa,main = "Frequência absoluta",xlab = "Estado Civil",ylab = "Quantidade")

pie(main = "Frequência relativa percentual",fpct,labels=as.character(round(fpct,digits = 2)))

# Frequência absoluta

fa <- table(dados_cliente$Grau.Instrução)
fa
# Frequência relativa

fr <- prop.table(fa)
fr

# Frequência percentual

fpct <- prop.table(fa)*100
fpct

# Moda
names(fa)[which.max(fa)]

barplot(sort(fr),main = "Frequência relativa",xlab = "Valor",ylab = "Grau de Instrução",col = "darkred",horiz = TRUE)

barplot(sort(fa),main = "Frequência absoluta",ylab = "Qtde",xlab = "Grau de Instrução")

barplot(fa,main = "Frequência absoluta",ylab = "Qtde",xlab = "Grau de Instrução")

levels(dados_cliente$Grau.Instrução)

dados_cliente$Grau.Instrução <- factor(dados_cliente$Grau.Instrução,levels = c('Fundamental','Médio','Superior','Mestrado','Doutorado'))

fa <- table(dados_cliente$Grau.Instrução)

barplot(fa,main = "Frequência absoluta",ylab = "Qtde",xlab = "Grau de Instrução")



head(dados_cliente,2)

# Frequência absoluta

fa <- table(dados_cliente$Qtde.Filhos)
print('Frequência absoluta:')
fa

# Frequência relativa

fr <- prop.table(fa)
print('Frequência relativa:')
round(fr,digit=0)

# Frequência percentual

fpct <- prop.table(fa)*100
print('Frequência relativa percentual:')
round(fpct,digit=0)

# na.rm=TRUE --> Pq alguns valores são NA
# Moda
print("Moda")
names(fa)[which.max(fa)]

# Mediana
print("Mediana")
median(dados_cliente$Qtde.Filhos,na.rm=TRUE)

#Média
print("Media")
mean(dados_cliente$Qtde.Filhos,na.rm=TRUE)

#Quartis
print("quartis")
quantile(dados_cliente$Qtde.Filhos,na.rm=TRUE)
#min
print("min")
min(dados_cliente$Qtde.Filhos,na.rm=TRUE)
#max
print("max")
max(dados_cliente$Qtde.Filhos,na.rm=TRUE)

# Amplitude (max-min)
print("Amplitude")
diff(range(dados_cliente$Qtde.Filhos,na.rm=TRUE))

# Variancia
print("Variancia")
var(dados_cliente$Qtde.Filhos,na.rm=TRUE)

# Desvio-padrão
print("Desvio-padrão")
sd(dados_cliente$Qtde.Filhos,na.rm=TRUE)

# Coeficiênte de variação
print("Coeficiênte de variação")
sd(dados_cliente$Qtde.Filhos,na.rm=TRUE)/mean(dados_cliente$Qtde.Filhos,na.rm=TRUE)

quartis <- quantile(dados_cliente$Qtde.Filhos,na.rm=TRUE)
# Amplitude interquartilica
print("Amplitude interquartilica")
quartis[4]-quartis[2]

#Resumo
summary(dados_cliente$Qtde.Filhos)

# Frequência absoluta acumulada

faa <- cumsum(fa)
faa

fa

plot(fa,main = "Frequência absoluta",ylab = "Frequência",xlab = "Qtde. de Filhos")

plot(faa,main = "Frequência absoluta acumulada",ylab = "Frequência",xlab = "Qtde. de Filhos",type="S")

head(dados_cliente,2)

summary(dados_cliente$Salário)

# Min e Max
range(dados_cliente$Salário)

#min
min <- min(dados_cliente$Salário,na.rm=TRUE)
#max
max <- max(dados_cliente$Salário,na.rm=TRUE)

#Qtde de classes
nclass.Sturges(dados_cliente$Salário)


# Agrupar
print(cut(dados_cliente$Salário,breaks=seq(min,max,length.out=8)))

# Agrupar
grupos <- cut(dados_cliente$Salário,breaks=seq(min,max,length.out=8))

print(grupos)

# Frequência absoluta

fa <- table(grupos)
print('Frequência absoluta:')
fa

# Frequência relativa

fr <- prop.table(fa)
print('Frequência relativa:')
round(fr,digit=0)

hist(dados_cliente$Salário,main=" Histograma - Salário",ylab = "Frequência",xlab = "Valor salário")

hist(dados_cliente$Salário,main=" Histograma - Salário",ylab = "Densidade",xlab = "Valor salário",freq=FALSE,labels=TRUE)

boxplot(dados_cliente$Salário,main=" Boxplot - Salário",ylab = "Valor salário")


