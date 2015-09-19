#  correlation function for pollutants
corr <- function(directory, threshold = 0)
{  
     directory <- "specdata"#    threshold <- 0
     data.loc <- path.expand(directory)
     files <- list.files(data.loc)  #list the files
     num.files <- length(files)     # number of files to read and analyze
     id <- 1:num.files             #  needed for file name in reading same
     files.temp <- data.frame()    #set class for data files
     cr <- vector()
     for (i in 1:num.files)  {     
           allFiles <- sprintf("%s/%03d.csv",directory,id) #  file names created
           files.temp <- read.csv(allFiles[i],header = TRUE, stringsAsFactors = FALSE) 
           row <- nrow(files.temp)
           file.na <- subset(files.temp,is.na(files.temp[,2]) | is.na(files.temp[,3]))#           row.na <- nrow(file.na)
#           file.complete <- subset(files.temp, !is.na(files.temp[,2]) &
 #                                       !is.na(files.temp[,3]))
#     }
#           complet.obs <- file.complete
           complet.obs <- row - nrow(file.na)
           if(complet.obs == 0 | complet.obs <= threshold) {
                next
           }else {
                complet.obs > threshold 
                cr[i] <- cor(files.temp[,2],files.temp[,3],
                    use = "complete.obs")   
           }  
               next
           if (max(cr == 0 | cr == NA | cr == NULL)) {
                cr <- 0
           }
     }
     return(cr)
}
cr <- corr("specdata",threshold = 150)
head(cr)
summary(cr)