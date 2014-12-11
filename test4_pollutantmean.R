#  testing function code before making the function
#  Set up arguements to pass to function
id <- 1:1
pollutant <- c("sulfate,nitrate")
directory <- "spectdata"
#  Initialize files counter for rbind process
countF <- 0
#  Loop thru the data files, read them in with read.csv, and combine with rbind
for (i in length(id)) {
        allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
        files_temp <- read.csv(allFiles[i],header = TRUE) #  read data file

# row bind files if there are multiple files
# this is not working.  It is binding the file with itself!!!!!!!!!!!!!!!!
                 if (countF == 0) {    #  Initalized as 0
                        cmbfile <- files_temp  #   first file stored in cmbfie
                        countF <- countF + 1   #   increment counter
                } 
                 else (countF > 0) {       #  multiple files need to be combined
                        cmbfile <- rbind(cmbfile,files_temp)  #  row bind new file with prior bind
                         gothere <- 100   #  test that the program reached this section
                }
}

countP <- 0
for (j in length(pollutant)) {
        if (j == 1)
                pollutant_idna <- pollutant[!is.na(pollutant)]
                countP = countP +1
                pollutant_mean <- mean(pollutant_idna)
       } else {
                pollutant <- pollutant[j]
                nitrate_idna <- pollutant[!is.na(pollutant)]
                nitrate_mean <- mean(nitrate_idna)
}
if (length(pollutant) == 1) {
        answ = pollutant[1]
        print(answ, pollutant_mean)
}else {
        Print("sulfate", pollutant_mean, "nitrate" = nitrite_mean, 03)
}

