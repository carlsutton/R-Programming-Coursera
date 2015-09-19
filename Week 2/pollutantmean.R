#  Assignment 1 - pollutant mean function
pollutantmean <- function(directory, pollutant, id = 1:332) {
        numFiles <- length(id)
        k <- c(1:length(id))  #initial a vector for the number of files
        files_temp <- data.frame()      #  initialize a data.frame
        #  Loop thru the data files, read them in with read.csv, and combine with rbind
        for (i in 1:numFiles) {
                allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
                files_temp <- read.csv(allFiles[i],header = TRUE) #  read data file 
                rows[i] <- nrow(files_temp)     #  will test that I combined files correctly
                # row bind files if there are multiple files
                if(i == 1) {       #  multiple files need to be combined
                        cmbfile <- files_temp
                }else {
                        cmbfile <-rbind(cmbfile,files_temp)
                }  
        }
#        a <-sum(rows)  tested the number of rows to ascertain the binding worked correctly
#       b <- nrow(cmbfile)
#       diff <- a-b
        sulfate_idna <- cmbfile$sulfate[!is.na(cmbfile$sulfate)] #remove sulfate NA's
        sulfate_mean <- mean(sulfate_idna)
        nitrate_idna <- cmbfile$nitrate[!is.na(cmbfile$nitrate)] #remove nitrate NA's
        nitrate_mean <- mean(nitrate_idna)
        means <- nitrate_mean
}
id <- 23
pollutant <- list("nitrate")
directory <- "spectdata"       
means <- pollutantmean(directory,pollutant,id)