#  testing function code before making the function
#  Set up arguements to pass to function
require(data.table)
id <- 1
directory <- "spectdata"
numFiles <- length(id)
k <- c(1:length(id))  #initial a vector for the number of files
files_temp <- data.frame()      #  initialize a data.frame
for (i in 1:numFiles) {
        allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
        files_temp <- read.csv(allFiles[i],header = TRUE) #  read data file 
        file <- data.table(files_temp)
        file <- c("id", "nobs")
        file <- file[, use = "complete.obs"]
}   