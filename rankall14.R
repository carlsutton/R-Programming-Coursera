#rankall <- function(outcome,num)
#{
        outcome <- "heart attack"
        num <- 5
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
        rankHA <- 1L
        HA1 <- data.table(hosp,st,HALME,rankHA)
        ha1 <- HA1[complete.cases(HA1),]
        ha1
        rankHF <- 1L
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
        if (outcome == "heart attack") 
        {
                rankhasorted <- 1L
                rankhasorted <- ha1[,rankHA:=rank(-HALME,ties.method="first")]
                ranked <- ha1[, (rankHA = rankhasorted), by = rankHA]
                setkey(ha1,rankHA,HALME,st,hosp)
                #rankHA <- num
                ha2 <- ha1[hosp,st]
        }
 
}               
y <- rankall("heart attack",20)
