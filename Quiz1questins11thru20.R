#  Quiz 1 questions 11 - 20
DF <- read.csv(file ="hw1_data.csv")
colnames(DF) #  Q 11
DF[1:2, ]    #  Q 12
tail(DF)     #  Q 13
last2row <- DF[152:153, ] # Q 14
DF[47,]      # Q 15
#  count number of NA's in Ozone column
require(stringr)
# convert Ozone to an atomic vector, not data frame
a <- DF[,"Ozone"]
sum(str_count(a, "NA")) # Q 16
mean(a, na.rm = TRUE)   # Q 17
#  Exttract rows where Ozone > 31, Temp >90, thencalculate mean of SolarR
require(plyr)
q18a <- subset(DF,Ozone >31, select =c(Ozone, Temp, Solar.R))
q18b <- subset(q18a, Temp > 90, select = c(Ozone, Temp, Solar.R))
q18c <- mean(q18b[,"Solar.R"], na.rm = TRUE)
q18c   #  the mean of Solar.R for Ozone >31 and Tmep > 90
q19a <- subset(DF, Month == 6, select = c(Temp, Month))
q19b <- as.numeric(q19a[,"Temp"])
mean(q19b, na.rm = TRUE)   #  Q  19
q20a <- subset(DF, Month == 5, select = c(Month, Ozone))
q20a
q20b <- as.numeric(q20a[,"Ozone"])
max(q20b, na.rm = TRUE)