#  correlation function for pollutants
#  corr <- function(directory, threshold = 0)
#  will set up function when code works
data.loc <- path.expand("specdata")  # set path to data
files <- list.files(data.loc)  # save the file names 
num.files <- length(files)     # How many files??
files.temp <- data.frame()     # initialize variable IF COMMENTED OUT, ERROR, FILES.TEMP NOT FOUND hUh??
# mat.cor <- 1:num.files         # initialize matrices
id <- 1:num.files              # create file id's
for (i in 1:num.files) { 
     #  reading in all data file names
     allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
     # allFiles
     #  read in a data file
     #  this is where the code blows up.  files.temp[i] is a data frame
     #  with 0 rows and 332 columns, ie  number of columns = number of files.
     #  Contrast this to the script with no for loop which works wonderfully
     #  but if files.temp is used in place of files.temp[i] it works.  Weird???
     #  the warnings are just stating the obvious, the files are not being copied
     files.temp[i] <- read.csv(allFiles[i],header = TRUE, stringsAsFactors = FALSE)
}
dim(files.temp)
head(files.temp)

     mat.cor <- as.data.frame(files.temp)
     row <- nrow(files.temp)
     mat.cor <- as.matrix(mat.cor[,2:4],nrow = row, ncol = 3) # convert data file
                                                            # to x by 3 matrix
     count <- 0           # initialize count
     threshold <- 0       #  set threshold for tesing, will be in function later
     total <- 1:row  # initialize variable (another weird necissity of R)
     # corr <- 1:num.files        #  ditto
     # file.na <- 1:row      #  ditto
     #  subsetting on NA's to get count instead of using an if statement
     file.na <- subset(files.temp,c(files.temp$sulfate == NA |
                     files.temp$nitrate == NA))
     row.na <- nrow(file.na) # determine the number of rows where sulfate or nitrate
                        # or both are NA
     complet.obs <- nrow(files.temp -row.na) # calculate number of complete observating 
     if (complet.obs == 0) {
          next
     }
     if (complet.obs > threshold) {
          corr <- cor(x = mat.cor[,1], y = mat.cor[,2], use = "complete.obs")
     }  
     head(count)
     head(files.temp)
     corr
}
