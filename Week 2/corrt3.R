#  correlation function for pollutants
#  corr <- function(directory, threshold = 0)

data.loc <- path.expand("specdata")
files <- list.files(data.loc)  #list the files
# files  
num.files <- length(files)
id <- 1:num.files
# id
files.temp <- data.frame()
i = 5     
     allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
#     allFiles
     length(allFiles)
     class(allFiles)
     files.temp <- read.csv(allFiles[i],header = TRUE,stringsAsFactors = FALSE) 
     head(files.temp)
     dim(files.temp)
     class(files.temp)
#     count <- 0
     threshold <- 2000
#     complet.obs <- 1:10
#     corr <- 1:10
     row <- nrow(files.temp)
#     file.na <- 1:10
     file.na <- subset(files.temp,files.temp$sulfate == NA | files.temp$nitrate == NA)
     row.na <- nrow(file.na)
     complet.obs <- nrow(files.temp) -row.na
#    if (complet.obs = 0) {
#         next
#    }
     if (complet.obs > threshold) {
          corr <- cor(files.temp$sulfate,files.temp$nitrate,
                         use = "complete.obs")
     }else{
          corr <- 0
     }
corr