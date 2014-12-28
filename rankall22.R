#rankall <- function(outcome,num)
#{
        outcome <- "heart attack"
        num <- 20
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
        hosp <- data[,2]
        st <- data[,7]
        HALME <- as.numeric(data[,11])
        HFLME <- as.numeric(data[,17])
        PLME <- as.numeric(data[,23])
#       just filing the data.table with phony rank numbers
        rowHA <- nrow(data)
        rankHA <- 1:rowHA
        rankHA
        #  read all heart attack data, including NA's, filling in vector for rankHA
        HA1 <- data.table(hosp,st,HALME,rankHA)
        ha1 <- ha1[complete.cases(ha1),]
#       create data table for heart attack with NA's removed
        head(ha1)
#       just filing the data.table with phony rank numbers
        rankHF <- rankHA
        HF1 <- data.table(hosp,st,HFLME,rankHF)
        hf1 <- hf1[complete.cases(hf1),] 
        head(hf1)
        rowP <- nrow(PLME)
        rankP <- 1:rowP
        P1 <- data.table(hosp,st,PLME,rankP)
        p1 <- P1[complete.cases(p1),]
        head(p1)
        #  HALME refers to heart attack low mortality estimate
        #  setting the keys automatically orders a data table
        setkey(ha1,HALME,hosp,st)
        if (num == "worst")
        {
                num <- nrow(ha1)
                num
        }
        head(ha1)       
        setkey(hf1,HFLME,hosp,st)
        head(hf1)
        if (num == "worst")
        {
                num == nrow(hf1)
        }
        hf1
        head(p1)        
        setkey(p1,PLME,hosp,rankP)
        if (num == "worst")
        {
                num <- nrow(p1)
        }
        p1
        if (outcome =="heart attack") 
        {
                rankHA <- rank(ha1[,3], ties.method = "first")
                y <- data.frame(ha1[num,hosp],ha1[num,st])
                print(y)
                print(class(y))
                head(y,10)
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
y <- rankall("heart attack",20)
