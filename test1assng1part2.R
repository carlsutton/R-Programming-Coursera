#  testing function code before making the function
#  Set up arguements to pass to function
require(data.table)
id <- c(2,4,6,8,10,12)
directory <- "spectdata"
numFiles <- length(id)
rows <- 1:numFiles
files_temp <- data.frame()      #  initialize a data.frame
for (i in 1:numFiles) {
        allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
        files_temp <- read.csv(allFiles[i],header = TRUE) #  read data file  
        files_temp <- files_temp[complete.cases(files_temp),] 
        file <- data.table(files_temp) 
        rows[i] <- nrow(file)
          
}   
out <- data.frame("id" =id, "nobs" = rows)