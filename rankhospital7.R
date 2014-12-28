#  rankhospital <- function(state,outcome,num)
# {
        state <- "MN"
        outcome <- "heart attack"
        num = 5000
        if (num == "best")
        {
                num <- 1
        }  
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        require(data.table)
        if(outcome !="heart attack" && outcome !="heart failure" && outcome !="pneumonia")
        {
                stop("invalid outcome")
        }
        if(!(state %in% data[[7]]))
        {
                stop("invalid state")
        }
        hosp <- data[,2]
        st <- data[,7]
        HALME <- as.numeric(data[,11])
        HFLME <- as.numeric(data[,17])
        PLME <- as.numeric(data[,23])
        head(PLME)
        HA1 <- data.table(hosp,st,HALME)
        colnames(HA1)
        ha1 <- subset(HA1, st == state)
        ha1 <- ha1[complete.cases(ha1),]
        HF1 <- data.table(hosp,st,HFLME)
        colnames(HF1)
        hf1 <- subset(HF1, st == state)
        hf1
        hf1 <- hf1[complete.cases(hf1),] 
        hf1
        P1 <- data.table(hosp,st,PLME)
        head(P1)
        p1 <- subset(P1, st == state)
        head(p1)
        p1 <- p1[complete.cases(p1),]
        
        p1
        #  HALME refers to heart attack low mortality estimate
        #  setting the keys automatically orders a data table
        setkey(ha1,HALME,hosp)
        if (num == "worst")
        {
                num <- nrow(ha1)
                num
        }
        ha1       
        setkey(hf1,HFLME,hosp)
        if (num == "worst")
        {
                num == nrow(hf1)
        }
        hf1
        setnames(p1,c("hosp","st","PLME"))
        head(p1)        
        setkey(p1,PLME,hosp)
        if (num == "worst")
        {
                num <- nrow(p1)
        }
        p1
        if (outcome =="heart attack") 
        {
                print(ha1[num,hosp])
                print(class(ha1[num,hosp]))
                y <- c(as.character(ha1[num,hosp]))
                return(y)
        }
        if (outcome == "heart failure")
        {
                head(hf1)
                print(hf1[num,hosp])
                print(class(hf1[num,hosp]))
                y <- c(hf1[num,hosp])
                return(y)
        }
        if (outcome == "pneumonia")
        {
                print(p1[num,hosp])
                print(class(p1[num,hosp]))
                y <- c( p1[num,hosp])
                return(y)
        }
}               
y <- rankhospital("MD","heart failure,5")
is.character(y)
