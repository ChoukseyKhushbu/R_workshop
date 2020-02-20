install.packages('tm')
library(tm) #to load into current memory
install.packages('SnowballC')
install.packages('ggplot2')
install.packages('wordcloud')
library(wordcloud)
library(SnowballC)
library(ggplot2)
mydocs<-Corpus(DirSource('C://Users/ADMIN/Desktop/MLworkshop/2 corpus'))
inspect(mydocs)
tospace <- content_transformer(function(x,pattern){return (gsub(pattern," ",x))})
mydocs=tm_map(mydocs,tospace," - ")
mydocs=tm_map(mydocs,tospace," : ")
mydocs=tm_map(mydocs,tospace," @ ")
##mydocs=tm_map(mydocs,tospace,"doc")
mydocs=tm_map(mydocs,removePunctuation)
mydocs=tm_map(mydocs,content_transformer(tolower))
mydocs=tm_map(mydocs,removeNumbers)
inspect(mydocs)
mydocs=tm_map(mydocs,removeWords,stopwords("en"))
mydocs=tm_map(mydocs,stripWhitespace)
inspect(mydocs)
TermDocumentMatrix(mydocs)
writeLines(as.character(mydocs[[1]]))
dtm1<-TermDocumentMatrix(mydocs)
dtm1
dtm<-DocumentTermMatrix(mydocs)
dtm
inspect(dtm[1:2,1000:1005])
inspect(dtm[1:4,700:750])
inspect(dtm[1:4,1:10])
freq<-colSums(as.matrix(dtm))
length(freq)
freq
a = as.matrix(dtm)
v = sort(rowSums(a), decreasing =TRUE)
d = data.frame(word=names(v),freq=v)
d
##set.seed(1234)
##wordcloud(words = d$Word, freq=d$freq,max.words = 200,random.order = FALSE)
as.matrix(dtm1)
ord<-order(freq,decreasing=TRUE)
ord
MaxFreq=freq[(ord)]
MaxFreq
MaxFreq[4]
freq[tail(ord)]

findMostFreqTerms(dtm) #gives most freq words in every file
findAssocs(dtm,"salman",.5) #gives co-relation of given word 

install.packages('factoextra')
install.packages('cluster')
install.packages('tidyverse')
library(factoextra)
library(cluster)
library(tidyverse)
library(wordcloud)

set.seed(42)
wordcloud(names(freq),freq,min.freq=5,colors=brewer.pal(6,'Dark2'))
