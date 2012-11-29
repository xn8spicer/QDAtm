openProject("~/Documents/RStuff/QDAtm/QDAtm/QDAtm/q64.rqda", updateGUI=TRUE)
myData<-RQDAQuery("select name, file from source")
library(tm)

#mydata.corpus<-Corpus(VectorSource(myData$file))
mydata.corpus <- Corpus(VectorSource(myData$file),control = list(
  removePunctuation=TRUE,
  removeNumbers=TRUE,
  stopwords=TRUE,
  minWordLength=1))

# make each letter lowercase
mydata.corpus <- tm_map(mydata.corpus, tolower)

# remove punctuation
mydata.corpus <- tm_map(mydata.corpus, removePunctuation)

### Maybe in here word count and replace 'tv'


# remove generic and custom stopwords
my_stopwords <- c(stopwords('english'), 'prolife', 'prochoice')
mydata.corpus <- tm_map(mydata.corpus, removeWords, my_stopwords)

# build a term-document matrix
mydata.dtm <- TermDocumentMatrix(mydata.corpus, control = list(wordLengths = c(1,30)))

# inspect the document-term matrix
inspect(mydata.dtm["tv"])

wrds<-as.matrix(mydata.dtm)
freqwrds <- sort(rowSums(wrds), decreasing=TRUE)
freqwrds

# inspect most popular words
findFreqTerms(mydata.dtm, lowfreq=30)

# associations
findAssocs(mydata.dtm, 'talk', 0.20)

# remove sparse terms to simplify the cluster plot
# Note: tweak the sparse parameter to determine the number of words.
# About 10-30 words is good.
mydata.dtm2 <- removeSparseTerms(mydata.dtm, sparse=0.95)

# convert the sparse term-document matrix to a standard data frame
mydata.df <- as.data.frame(inspect(mydata.dtm2))

# inspect dimensions of the data frame
nrow(mydata.df)
ncol(mydata.df)

# Denodogram
mydata.df.scale <- scale(mydata.df)
d <- dist(mydata.df.scale, method = "euclidean") # distance matrix
fit <- hclust(d, method="ward")
plot(fit) # display dendogram?

groups <- cutree(fit, k=5) # cut tree into 5 clusters
# draw dendogram with red borders around the 5 clusters
rect.hclust(fit, k=5, border="red")

# Word Cloud
library(wordcloud)
m <- as.matrix(mydata.dtm2)
# calculate the frequency of words
v <- sort(rowSums(m), decreasing=TRUE)
myNames <- names(v)
d <- data.frame(word=myNames, freq=v)
wordcloud(d$word, d$freq, min.freq=3)

