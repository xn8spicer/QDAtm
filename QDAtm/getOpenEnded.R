# load open-ended question from survey into dataset
q64<-read.csv(file="q64.csv")
q64$ik_84_g1_open<- gsub('[[:cntrl:]]', '', q64$ik_84_g1_open)

# cleanup
library (tm)
q64.corpus <- Corpus(DataframeSource(data.frame(q64[, 1])),control = list(
  stopwords=FALSE, minWordLength = 1))
# lower case all
q64.corpus<- tm_map(q64.corpus, tolower)
# remove punctuation seems to mess with tv
q64.corpus <- tm_map(q64.corpus, removePunctuation)
# remove numbers
  q64.corpus  <- tm_map(q64.corpus, removeNumbers)
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
  stopwords=FALSE, minWordLength = 1))
q64.dtm<-DocumentTermMatrix(q64.corpus)
#inspect(q64.dtm[1:5])
#findFreqTerms(q64.tdm, 10)
d<-c("watch","tv","wii")
# cannot find word 'tv'
inspect(q64.tdm["tv"])
inspect(q64.tdm["laugh"])
#plot(q64.tdm, terms = findFreqTerms(q64.tdm, lowfreq = 6)[1:25], corThreshold = 0.5)
inspect(DocumentTermMatrix(q64.corpus,list(dictionary=d)))

# write out text files 
library(plyr)
dir<-"~/Documents/RStuff/QDAtm/QDAtm/QDAtm/responses"
d_ply(q64, "kidID", function(x)
  write.table(x[,c("ik_84_g1_open")], file = paste(dir,"/",x$kidID[1], ".txt", sep=""), sep = "\t", col.names=FALSE,row.names = FALSE))

# 
# Interlude to code in RDQA environment
#

# I added a file and then deleted it, but could not re-add it because 
# it only had a delete bit.  This pdelete actually removes it and 
# then I could re-add
pdelete(type="file")
# see what coding looks like so far
summaryCodings()

x<-list.files(path="./responses")
#write.FileList(x)  NO, just writes NA
