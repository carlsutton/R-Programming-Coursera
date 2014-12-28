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
        rank <- 1
        HA1 <- data.table(hosp,st,HALME,rank)
        ha1 <- HA1[complete.cases(HA1),]
        ha1
        rankHF <- 1
        HF1 <- data.table(hosp,st,HFLME,rankHF)
        colnames(HF1)
        hf1 <- HF1[complete.cases(HF1),] 
        hf1
        P1 <- data.table(hosp,st,PLME,rank)
        head(P1)
        p1 <- P1[complete.cases(P1),]
        p1
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
        setkey(p1,PLME,hosp,st)
        if (num == "worst")
        {
                num <- nrow(p1)
        }
        p1
        if (outcome =="heart attack") 
        {
                rank <- 1
                if(ha1[1,] == ha1[2,])
                {
                        ha1[,4] <- rank
                }
                else
                {
                        rank <- rank +1
                        ha1[,4] <- rank
                }
                ha1
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
