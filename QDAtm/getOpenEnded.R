# load open-ended question from survey into dataset
q64<-read.csv(file="q64.csv")
# cleanup
library (tm)
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
