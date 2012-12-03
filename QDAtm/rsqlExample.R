library(RSQLite)
driver = dbDriver("SQLite")
con <- dbConnect(driver, dbname="~/Desktop/testdata.db")
data(USArrests); #prepare some data frame
dbWriteTable(con,"arrests", USArrests) # insert it as a table

dbListTables(con) # show tables
rs <- dbSendQuery(con, "SELECT * from arrests")  # send a query
data <- fetch(rs,n=-1) # fetch 3 rows from result (use -1 to fetch all rows)
dbHasCompleted(rs)  # checks if other rows left and returns true/false




#cleanup
dbClearResult(rs)
dbDisconnect(con)
dbUnloadDriver(driver)