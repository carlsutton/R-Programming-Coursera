#  testing function code before making the function
#  Set up arguements to pass to function
id <- 1:10
pollutant <- c("sulfate,nitrate")
directory <- "spectdata"
#  Initialize files counter for rbind process
countF <- 0
#  Loop thru the data files, read them in with read.csv, and combine with rbind
for (i in id) {
        allFiles <- sprintf("%s/%03d.csv","specdata",id) #  file names created
        files_temp <- read.csv(allFiles[i],header = TRUE) #  read data file
       
# row bind files if there are multiple files
# this is not working.  It is binding the file with itself!!!!!!!!!!!!!!!!
                 if (countF == 0) {    #  Initalized as 0
                        cmbfile <- files_temp  #   first file stored in cmbfie
                        countF <- countF + 1   #   increment counter
                } 
                 if(countF > 0) {       #  multiple files need to be combined
                        cmbfile <- rbind(cmbfile,files_temp)  #  row bind new file with prior bind
                         gothere <- 100   #  test that the program reached this section
                }
}

#  I have attempted to us "if" and "else" statements to print out just
#  the pollutant asked for.  All I got were error messages. I will just print out everything 
#  
sulfate_idna <- cmbfile$sulfate[!is.na(cmbfile$sulfate)]
sulfate_mean <- mean(sulfate_idna)

nitrate_idna <- cmbfile$nitrate[!is.na(cmbfile$nitrate)]
nitrate_mean <- mean(nitrate_idna)
#  yikes, even the print function is a pile of horse droppings
sulfate_mean
nitrate_mean
#  Yes, I know the answers are not correct.  I have simply run out of time and patience
#  attempting to learn this via trial and error.  Not being into self mutilation, this 
#  inelegant pile of bhorse droppping is being submitted.  I will allocate 2 hrs each to the 
# remaining sections and then go back to the Data Camp course on data.table.  At least I learn 
#  something useful in that course.
#  Anybody know of a 3 or 4 semester course on how to learn R.  i would be interested in taking
# such courses if they exist.  This method  is just ot frustrating and time consuming to be
#  feasible.