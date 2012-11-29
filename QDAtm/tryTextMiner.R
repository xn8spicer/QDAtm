# TextMiner example, assumes you have read in data using getOpenEnded.R
library (tm)
q64.corpus <- Corpus(DataframeSource(data.frame(q64[, 1])),control = list(
  removePunctuation=TRUE,
  removeNumbers=TRUE,
  stopwords=TRUE,
  wordLength=c(2,100)))
q64.tdm <- TermDocumentMatrix(q64.corpus, 
                              control = list (removePunctuation=TRUE,stopwords=TRUE,wordLengths=c(2,100)))

plot(q64.tdm, terms = findFreqTerms(q64.tdm, lowfreq = 4)[1:12], corThreshold = 0.3)

plot(q64.tdm, terms=x, corThreshold = 0.5)

# lower case all
#q64.corpus<- tm_map(q64.corpus, tolower)
# remove punctuation seems to mess with tv
#q64.corpus <- tm_map(q64.corpus, removePunctuation)
# remove numbers
#  q64.corpus  <- tm_map(q64.corpus, removeNumbers)


# myStopwords<-stopwords('english')
# myStopwords
# # add words to list of stopwords
# myStopwords <- c(stopwords('english'), "available","via")
# myStopwords
# # keep “group” by removing it from stopwords
# idx <- which(myStopwords == "group")
# myStopwords <- myStopwords[-idx]
# myStopwords
# q64.corpus<- tm_map(q64.corpus, removeWords, myStopwords)
q64.tdm<-TermDocumentMatrix(q64.corpus,control = list(
  stopwords=FALSE, wordLengths = c(2,100)))
q64.dtm<-DocumentTermMatrix(q64.corpus,control = list(wordLengths = c(2,100)) )
#inspect(q64.dtm[1:5])
#findFreqTerms(q64.tdm, 10)
d<-c("watch","tv","wii")
# cannot find word 'tv'
inspect(q64.tdm["tv"])
inspect(q64.tdm["laugh"])
#plot(q64.tdm, terms = findFreqTerms(q64.tdm, lowfreq = 6)[1:25], corThreshold = 0.5)
inspect(DocumentTermMatrix(q64.corpus,list(dictionary=d)))
inspect(TermDocumentMatrix(q64.corpus,list(dictionary=d)))


library(twitteR)
rdmTweets<-userTimeline("rdatamining", n=200)
(nDocs <- length(rdmTweets))
rdmTweets[11:14]
for (i in 11:14){
  cat(paste("[[",i, "]] ",sep=""))
  writeLines(strwrap(rdmTweets[[i]]$getText(), width=73))
}
df<-do.call("rbind",lapply(rdmTweets,as.data.frame))
dim(df)
library(tm)
myCorpus<-Corpus(VectorSource(df$text))


# More trials.  Seems that the data is seen as sentences instead of words

```{r eval=FALSE}
# Create Corpus from a directory of text files
# Seems like it 
library(tm)
source <- DirSource("~/RStuff/qda_tm/QDAtm/QDAtm/responses/") #input path for documents
YourCorpus <- Corpus(source, readerControl=list(reader=readPlain)) #load in documents
tdm <- TermDocumentMatrix(YourCorpus, control = list (removePunctuation = TRUE,                                                  removeNumbers = TRUE,                                                  stopwords = TRUE,
                                                      wordLengths=c(4,100)))
dtm <- DocumentTermMatrix(YourCorpus, control = list (removePunctuation = TRUE,                                                  removeNumbers = TRUE,                                                  stopwords = TRUE,
                                                      wordLengths=c(4,100)))

plot(tdm, terms = findFreqTerms(tdm)[1:25], corThreshold = 0.25)
library(slam)
cs<-col_sums(dtm)
head(findFreqTerms(tdm))
```




