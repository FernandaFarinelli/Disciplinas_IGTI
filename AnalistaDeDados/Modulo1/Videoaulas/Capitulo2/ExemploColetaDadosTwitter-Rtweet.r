# Você precisar instalar os pacotes a primeira vez que for usar.
# Quando usar o Google Colab, vai precisar instalar sempre, antes de continuar.
# No caso de optar por usar o R, com Jupyter ou RStudio na sua máquina, só é necessário instalar uma vez.

install.packages("rtweet")

library(tweets)

# Importar a biblioteca rtweet

library(rtweet)

# Importar biblioteca para visualização
library(ggplot2)
library(dplyr)
library(maps)


# text mining library
library(tidytext)
#

# Credenciais para utilização da API do Twitter
# Define as variáveis com os valores de chaves do twitter
app = ""
api_key <- ""
api_secret_key <- ""
access_token <- ""
access_token_secret <- ""

# Autenticação via método create_token salvando o token na variável
token <- create_token( app = app,
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret)

# Buscar tweets de um determinado usuario
# A coleta pode chegar mais ou menos 32000
tweets_timeline <- get_timeline("@Ricamconsult", n = 90, include_rts = FALSE)

length(tweets_timeline)

# Visualiza os primeiros tweets do vetor

head(tweets_timeline,2)

tweets_timeline$text

## plota a serie temporal dos tweets
ts_plot(tweets_timeline, "3 hours") +
   ggplot2::theme_minimal() +
   ggplot2::theme(plot.title = ggplot2::element_text (face = "bold")) +
   ggplot2::labs (
      x = "Hora", y = "Quantidade",
      title = "Frequencia de tweets do usuário @Ricamconsult",
      subtitle = "Contagem de tweets agregados em intervalos de 3 horas",
      caption = "\nFonte: Dados coletados do Twitter por Fernanda Farinelli com o pacote rtweet"
)

## plota a serie temporal dos tweets
ts_plot(tweets_timeline, "1 day") +
   ggplot2::theme_minimal() +
   ggplot2::theme(plot.title = ggplot2::element_text (face = "bold")) +
   ggplot2::labs (
      x = "Dia", y = "Quantidade",
      title = "Frequencia de tweets do usuário @Ricamconsult",
      subtitle = "Contagem de tweets agregados em intervalos de 1 dia",
      caption = "\nFonte: Dados coletados do Twitter por Fernanda Farinelli com o pacote rtweet"
)


# Salva o vetor de tweets em um arquivo csv

write_as_csv(tweets_timeline,"tweets_timeline.csv",fileEncoding = "UTF-8")

getwd()

## Quais são os trends disponíveis
trends <- trends_available()
trends

# Quais são os trend topics no Brasil disponíveis nesse momemto.
# A localiazção do Brasil é woeid = 23424768 (Where On Earth ID)

trends_brasil <- get_trends(woeid = 23424768)
#ww_trends <- get_trends(worldwide)

##cria variaveis lat/lgn (latitude e longitude) para os tweets dosponiveis
trends_brasil <- lat_lng(trends_brasil)

trends_brasil$trend[1:10]

head(trends_brasil,1)

## busca por 10000 tweets enviados dos EUA

tweets_geocode <- search_tweets("lang:en", geocode = lookup_coords("usa"), n = 10000)
length(tweets_geocode)

##cria variaveis lat/lgn (latitude e longitude) para os tweets dosponiveis
tweets_geocode <- lat_lng(tweets_geocode)

## plota o mapa dos EUA
par(mar=c(0,0,0,0))
maps::map("world", "usa",  lwd = 0.5,fill=T,col="grey95")
maps::map(,,add=T)
maps::map.axes()
maps::map.scale(ratio=T,cex=0.5)
#abline(h=0,lty=2)
#Adiciona os tweets no mapa
with(tweets_geocode, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))

keyword <- c("covid OR covid-19")

count  <-   100              #número de tweets solicitados por palavra 27000+ funciona bem
#since  <-  c("2020-01-01") #data limite inferior no formato AAAA-MM-DD
#until  <-  c("2020-07-31") #data limite superior
type   <-  "mixed"        #"recent", "mixed" ou "popular"
lang <- "pt"
#include_rts <- TRUE|FALSE      #Incluir retweets ou não na pesquisa
#retryonratelimit <- TRUE|FALSE #Continuar ou não depois do limite de 18000 tweets por 15 minutos


## search for 100 tweets using the string key words
tweets_keyword <- search_tweets(q = keyword,n = count,lang=lang, type = type,include_rts = FALSE)

length(tweets_keyword)

table(tweets_keyword$source)

# view the first 3 rows of the dataframe
head(tweets_keyword, n = 3)

#Salvando o data frame como CSV na codificação do portugues
write_as_csv(tweets_keyword, "tweets_keywords.csv", fileEncoding = "UTF-8")

## preview users data
users_data(tweets_keyword)



## plot time series (if ggplot2 is installed)
ts_plot(tweets_keyword)

##cria variaveis lat/lgn (latitude e longitude) para os tweets dosponiveis
tweets_keyword <- lat_lng(tweets_keyword)

## plota o mapa dos EUA
par(mar=c(0,0,0,0))
#maps::map("world", "usa",  lwd = 0.5,fill=T,col="grey95")
maps::map("world", "Brazil",  lwd = 0.5,fill=T,col="grey95")
maps::map(,,add=T)
maps::map.axes()
maps::map.scale(ratio=T,cex=0.5)
abline(h=0,lty=2)
maps::map.cities(country="Brazil",minpop=1000000,pch=15,cex=0.9)

#Adiciona os tweets no mapa
with(tweets_keyword, points(lng, lat, pch = 20, cex = .75, col = rgb(0, .3, .7, .75)))

library(dplyr)

length(tweets_keyword$location)

length(unique(tweets_keyword$location))

# Localizações por tweets
length(unique(tweets_keyword$location))

#Plot graph
tweets_keyword %>%
  count(location, sort = TRUE) %>%
  mutate(location = reorder(location, n)) %>%
  top_n(20) %>%
  ggplot(aes(x = location, y = n)) +
  geom_col() +
  coord_flip() +
      labs(x = "Total",
      y = "Localização",
      title = "Local de origem dos tweets")
