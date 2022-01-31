# Instalar o pacote RMariaD se for a primeira vez que for utlizar.

install.packages("RSQLite")

#importação do pacote deve ser SEMPRE realizada
library(RSQLite)

library(readr)


getwd()

# Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), ":memory:")


#Para listar quais tabela existem no BD execute:

dbListTables(con)

dbWriteTable(con, "contabilidade","./Datasets/contabilidade.csv")
dbListTables(con)

 dbRemoveTable(con,"./Datasets/contabilidade.csv")

dbListFields(con, "contabilidade")

dbReadTable(con, "contabilidade")

dados <- dbSendQuery(con, "SELECT * FROM contabilidade WHERE CAP = 1")
dbFetch(dados)

dados <- dbSendQuery(con, "SELECT * FROM contabilidade")
dbFetch(dados)

# Limpar o cursor de resultados
dbClearResult(dados)


dbFetch(dados)

dados <- dbSendQuery(con, "SELECT * FROM contabilidade WHERE PC BETWEEN 40000 AND 50000")
dbFetch(dados)

# Desconectar do banco de dados
dbDisconnect(con)

dbReadTable(con, "contabilidade")

# create a connection to the SQLite database
dbfile <- "./Datasets/bootcamp.sqlite"

con <- dbConnect(RSQLite::SQLite(), dbfile)

con <- dbConnect(RSQLite::SQLite(), "")

cliente <- read.csv("./Datasets/clientes_8000.csv",sep=";",encoding="UTF-8")

head(cliente)

names(cliente)[1] <- 'idade'
names(cliente)[6] <- 'raca'
names(cliente)[9] <- 'regiao'

head(cliente)

dbListTables(con)

dbWriteTable(con,"cliente",cliente)
dbListTables(con)

dbListFields(con, "cliente")

dbReadTable(con, "cliente")

dbWriteTable(con,"cliente1",cliente)
dbListTables(con)

dbRemoveTable(con,"cliente1")
dbListTables(con)

dados <- dbSendQuery(con, "SELECT DISTINCT(escolaridade) FROM cliente WHERE UF ='MG' ORDER BY 1")
dbFetch(dados)

# Desconectar do banco de dados
dbDisconnect(con)
