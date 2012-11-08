# load open-ended question from survey into dataset
q64<-read.csv(file="q64.csv")

# Could do cleanup 
#q64$ik_64_open<- gsub('[[:cntrl:]]', '', q64$ik_64_open)

# Insert file and contents into db
# library(RQDA)
# RDQA ()
# openProject("~/Documents/RStuff/QDAtm/QDAtm/QDAtm/q64.rqda", updateGUI=TRUE)

# q<-as.list(as.character(q64$ik_64_open))
# names(q)<-q64$kidID
# q[1:3]
# write.FileList(q)
# closeProject()

# alternatively write out text files, one question per case
#library(plyr)
#dir<-"~/Documents/RStuff/QDAtm/QDAtm/QDAtm/responses"
#d_ply(q64, "kidID", function(x)
#  write.table(x[,c("ik_64_open")], file = paste(dir,"/",x$kidID[1], ".txt", sep=""), sep = "\t", col.names=FALSE,row.names = FALSE))


# I added a file and then deleted it, but could not re-add it because 
# it only had a delete bit.  This pdelete actually removes it and 
# then I could re-add
# pdelete(type="file")


# see what coding looks like so far
summaryCodings()

