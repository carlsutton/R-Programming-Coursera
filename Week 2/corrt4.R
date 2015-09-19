#  correlation function for pollutants
#  corr <- function(directory, threshold = 0)
threshold <- 2000
data.loc <- path.expand("specdata")
files <- list.files(data.loc)  #list the files
# files  
num.files <- length(files)
id <- 1:num.files
# id
count <- 1
files.temp <- data.frame()
while(i = count) {     
     allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
#     allFiles
     length(allFiles)
     class(allFiles)
     files.temp[i] <- read.csv(allFiles[i],header = TRUE,stringsAsFactors = FALSE) 
     head(files.temp)
     dim(files.temp)
     class(files.temp)    
#     complet.obs <- 1:10
#     corr <- 1:10
     row <- nrow(files.temp)
#     file.na <- 1:10
     file.na <- subset(files.temp,files.temp$sulfate == NA | files.temp$nitrate == NA)
     row.na <- nrow(file.na)
     complet.obs <- nrow(files.temp) -row.na
     if (complet.obs = 0) {
          count <- count + 1
          next
     }
     if (complet.obs > threshold) {
          corr[i] <- cor(files.temp$sulfate,files.temp$nitrate,
                         use = "complete.obs")
     }else{
          corr <- 0
     }
     if (count == num.files) {
          break
     }
     count <- count +1
corr