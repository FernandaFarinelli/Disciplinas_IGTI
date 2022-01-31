#Instalar a biblioteca
install.packages("tm")


# importa biblioteca

library("tm")

getwd()

# Lê arquivo
texto <- unclean_text <- readLines("./textoemexmplo.txt",encoding='UTF-8')
unclean_text

# Remove menções
clean_tweet = gsub("@\\w+", " ", unclean_text)
clean_tweet

# Remove hashtags

clean_tweet <- gsub("#\\w+", " ", clean_tweet)
clean_tweet

# Remove links

clean_tweet = gsub(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)", " ", clean_tweet)
clean_tweet

#Remove retweets

#clean_tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", clean_tweet)
#clean_tweet

#remove pontuação
clean_tweet = gsub("[[:punct:]]", " ", clean_tweet)
clean_tweet

clean_tweet = gsub("[[:digit:]]", " ", clean_tweet)
clean_tweet

#Remove caracteres especiais

clean_tweet = gsub("–", " ", clean_tweet)
clean_tweet

#Remove caracteres especiais

clean_tweet = gsub("“", " ", clean_tweet)
clean_tweet = gsub("”", " ", clean_tweet)
clean_tweet

# Remover mutlplos espaços por apenas 1
clean_tweet = gsub("[ \t]{2,}", " ", clean_tweet)
clean_tweet

texto

# Load the data as a corpus
TextDoc <- Corpus(VectorSource(texto))

#Cria o toSpace 
toSpace <- content_transformer(function(x, pattern) {return (gsub(pattern, " ", x))})

TextDoc[[1]]$content

TextDoc <- tm_map(TextDoc, toSpace, "@\\w+")
TextDoc[[1]]$content

TextDoc <- tm_map(TextDoc, toSpace, "#\\w+")
TextDoc[[1]]$content


TextDoc <- tm_map(TextDoc, toSpace, " ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)")
TextDoc[[1]]$content

getTransformations()

TextDoc[[5]]$content

#Remove punctuation – replace punctuation marks with ” “
TextDoc <- tm_map(TextDoc, removePunctuation)
TextDoc[[5]]$content

TextDoc[[8]]$content

TextDoc <- tm_map(TextDoc, toSpace, "–")
TextDoc <- tm_map(TextDoc, toSpace, "“")
TextDoc <- tm_map(TextDoc, toSpace, "”")
TextDoc[[5]]$content
TextDoc[[8]]$content

#Transform to lower case (need to wrap in content_transformer)
TextDoc <- tm_map(TextDoc,content_transformer(tolower))
TextDoc[[5]]$content

TextDoc[[2]]$content

#Strip digits (std transformation, so no need for content_transformer)
TextDoc <- tm_map(TextDoc, removeNumbers)
TextDoc[[2]]$content

#remove stopwords using the standard list in tm
TextDoc <- tm_map(TextDoc, removeWords, stopwords("portuguese"))

TextDoc[[5]]$content
TextDoc[[8]]$content

print(stopwords("portuguese"))

#remove stopwords using the standard list in tm
TextDoc <- tm_map(TextDoc, removeWords, "é")
TextDoc[[5]]$content
TextDoc[[8]]$content

#Strip whitespace
TextDoc <- tm_map(TextDoc, stripWhitespace)
TextDoc[[5]]$content
TextDoc[[8]]$content

TextDoc[[5]]$content
TextDoc[[7]]$content
TextDoc[[8]]$content

#stem the corpus
TextDoc <- tm_map(TextDoc, stemDocument)


TextDoc[[5]]$content
TextDoc[[7]]$content
TextDoc[[8]]$content

# Criar matriz term-document
TextDoc_matrix <- TermDocumentMatrix(TextDoc)

TextDoc_matrix

#Transformando em matrix para permitir a manipulação
matriz <- as.matrix(TextDoc_matrix)

head(matriz)

#organizar os dados de forma decrescente
matriz <- sort(rowSums(matriz), decreasing=T)

head(matriz,10)

#criando um data.frame para a matriz
matriz <- data.frame(word=names(matriz), freq = matriz)
matriz

head(matriz, n=10)

findFreqTerms(TextDoc_matrix, lowfreq = 2, highfreq = Inf)

# Find words that are correlated with "dom" with a coefficient > .70
findAssocs(TextDoc_matrix, "dom", .70)

# Find words that are correlated with "dom" with a coefficient > .70
findAssocs(TextDoc_matrix, "dom", .50)

# Find words that are correlated with "dom" with a coefficient > .70
findAssocs(TextDoc_matrix, "palavra", .70)

# Criar matriz term-document
#TextDoc_matrix <- TermDocumentMatrix(TextDoc)

Doc_TermMatriz <- DocumentTermMatrix(TextDoc) 
inspect(Doc_TermMatriz)
