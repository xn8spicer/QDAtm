# Problem getting tm to recognize the word 'tv'!!!

df <- data.frame(myString=character(), stringsAsFactors=FALSE)
df[1,1]<-"Here is a sentence about tv and people watching tv"
df[2,1]<-"Here is another sentence about tv"

df.corpus<-Corpus(DataframeSource(data.frame(df[, 1])),
           control = list(stopwords=TRUE, minWordLength = 1))

dtm <- DocumentTermMatrix(df.corpus, control = list(wordLengths=c(1,100))) 
df.tdm<-TermDocumentMatrix(df.corpus,control = list(
  stopwords=FALSE, wordLengths = c(1,100)))
inspect(df.tdm["is"])
searchFullText(df.corpus[[1]], "is")
inspect(df.tdm["sentence"])
searchFullText(df.corpus[[1]], "tv")
inspect(df.tdm["tv"])
