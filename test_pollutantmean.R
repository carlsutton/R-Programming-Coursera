#  testing function code before making the function

pollutantmean <- function(directory, pollutant, id) {
        allFiles <- sprintf("%s/%03d.csv","specdata",id)
        files_temp <- lapply(allFiles, read.csv)
        for (i in length(id))
             a <-rbind(files_temp)
             a <- data.frame(a)
        class(a)
        for (j in length(pollutant))
                pollutant_idna <- a$pollutant[!is.na(a$pollutant)]
                pollutant_mean <- mean(pollutant_idna)
        pollutant_idna
}

id <- 1:10
print(id)
pollutant <- c("sulfate,nitrate")
directory <- "spectdata"
pollutantmean(directory, pollutant,id)
print(pollutant_idna)
first <- read.csv("specdata/023.csv")
nitrate_idna <- first$nitrate[!is.na(first$nitrate)]
sulfate_idna <- first$sulfate[!is.na(first$sulfate)]
nitrate_mean <- mean(nitrate_idna)
sulfate_mean <- mean(sulfate_idna)
pollutant_mean <- c(nitrate_mean, sulfate_mean)
pollutant_mean
first_nitrate <- first$nitrate[!is.na(first$nitrate)]
first_sulfate <- first$sulfate[!is.na(first$sulfate)]
first$nitrate <- first_nitrate
first$sulfate <- first_sulfate
second <- read.csv("specdata/002.csv")

mean_nitrate <- lappy(first$nitrate, mean, na.rm = TRUE)
mean_sulfate <- lapply(first$sulfate, mean, na.rm = TRUE)
class(mean_nitrate)
class(mean_sulfate)

