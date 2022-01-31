#importa pacote
library('readr')

# Lê/coleta dados no arquivo

dados_cliente <- read.csv("./clientes.csv",sep=";")

head(dados_cliente)

# Definimos que a variável Grau.Instrução deve ser tratada como ordinal

levels(dados_cliente$Grau.Instrução)

dados_cliente$Grau.Instrução <- factor(dados_cliente$Grau.Instrução,
                                       levels = c('Fundamental','Médio','Superior','Mestrado','Doutorado'))

levels(dados_cliente$Grau.Instrução)

# Frequência absoluta

fa <- with(dados_cliente,table(Estado.civil,Grau.Instrução))
fa


# Frequência relativa
# Em relação ao total geral
# Em relação aos totais por linha (`margin = 1`)
# Em relação aos totais por coluna (`margin = 2`)

frg <- prop.table(fa)
round(frg,digit=2)

frl <- prop.table(fa,margin=1)
round(frl,digit=2)

frc <- prop.table(fa,margin=2)
round(frc,digit=2)


barplot(fa, legend = TRUE)

barplot(t(fa), legend = TRUE)


barplot(fa, beside = TRUE, legend = TRUE)


barplot(t(prop.table(fa)), beside = TRUE, legend = TRUE)

## Quartis de salario
quantile(dados_cliente$Salário)

## Classificação de acordo com os quartis
grupo_sal <- cut(dados_cliente$Salário, breaks =  quantile(dados_cliente$Salário),include.lowest = TRUE)



## Tabela de frequências absolutas
fa <- table(dados_cliente$Grau.Instrução, grupo_sal)
fa


frg <- prop.table(fa)
frg

frl <- prop.table(fa,margin=1)
frl

frc <- prop.table(fa,margin=2)
frc


boxplot(Salário ~ Grau.Instrução, data = dados_cliente)

print('Media')
with(dados_cliente, tapply(Salário, Grau.Instrução, mean))
print('Desvio Padrão')
with(dados_cliente, tapply(Salário, Grau.Instrução, sd))
print('Quartil')
with(dados_cliente, tapply(Salário, Grau.Instrução, quantile))

head(dados_cliente)

## Classes de Idade (Anos)
grupo_idade <- with(dados_cliente, cut(Anos, breaks = quantile(Anos),include.lowest = TRUE))

fa_idade <- table(grupo_idade)

fa_idade

## Quartis de salario
quantile(dados_cliente$Salário)

## Classificação de acordo com os quartis
grupo_sal <- cut(dados_cliente$Salário, breaks =  quantile(dados_cliente$Salário),include.lowest = TRUE)


fa_sal <- table(grupo_sal)
fa_sal

## Tabela combinada  cruzada
fa <- table(grupo_idade, grupo_sal)
fa

frg <- prop.table(fa)
frg

frl <- prop.table(fa,margin=1)
frl

frc <- prop.table(fa,margin=2)
frc

head(dados_cliente)

# Plotar gráfico de dispersão entre as variáveis

#plot(x = dados_cliente$Anos, y = dados_cliente$Salário)
plot(Salário ~ Anos, data = dados_cliente)

#Coeficiaente de relação
print('Coeficiaente de relação Pearson')
with(dados_cliente, cor(Anos, Salário)) #Pearson

print('Coeficiaente de relação kendall')
with(dados_cliente, cor(Anos, Salário, method = "kendall"))

print('Coeficiaente de relação spearman')
with(dados_cliente, cor(Anos, Salário, method = "spearman"))


