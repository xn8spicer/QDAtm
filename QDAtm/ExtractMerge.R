# Extract from RQDA project
# library(RQDA)
# openProject("~/Documents/RStuff/QDAtm/QDAtm/QDAtm/q64.rqda", updateGUI=TRUE)

# Select fields

# Works
# myCodes<-RQDAQuery("select source.name as filename, source.id as fid, coding.cid 
#   from source  inner join coding
#   where source.id = coding.fid and coding.status = 1 and source.status = 1")

# Still need codecategory
myCodes<-RQDAQuery("select source.name as filename, source.id as fid, C.cid as cid, C.code as code
  from source  inner join 
         (select freecode.name as code, coding.cid, coding.fid from coding inner join freecode 
           where freecode.id = coding.cid and coding.status = 1) C
  where source.id = C.fid and source.status = 1")

myCodeCats<-RQDAQuery("select  treecode.catid, codecat.name as codecat, treecode.cid
    from treecode left join codecat 
    where treecode.catid = codecat.catid
    order by treecode.catid, treecode.cid")

myPersonLevelFile<-reshape (myCodes, v.names="code", timevar="cid", idvar="fid", direction="wide") 

# BOGUS
# Note that you are NOT using the cid as the factor values 
# myPersonLevelFile[, 3:5] <- lapply(myPersonLevelFile[, 3:5], as.factor) 
# You code recode
# myPersonLevelFile[is.na(myPersonLevelFile)] <- 0