best <- function(state,outcome) 
{
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
        HALME <- as.numeric(data[,13])
        HFLME <- as.numeric(data[,19])
        PLME <- as.numeric(data[,25])
        HA1 <- data.table(hosp,st,HALME)
        ha1 <- subset(HA1, st = state)
        ha1 <- subset(ha1, st ==state)
        ha1 <- ha1[complete.cases(ha1),] 
        HF1 <- data.table(hosp,st,HFLME)
        hf1 <- subset(HF1, st = state)
        hf1 <- subset(hf1, st ==state)
        hf1 <- ha1[complete.cases(hf1),] 
        P1 <- data.table(hosp,st,PLME)
        p1 <- subset(P1, st = state)
        p1 <- subset(p1, st ==state)
        p1 <- ha1[complete.cases(p1),]
        #  HALME refers to heart attack low mortality estimate
        #  setting the keys automatically orders a data table
        setkey(ha1,HALME,hosp) 
        setnames(hf1,c("hosp","st","HFLME"))
        setkey(hf1,HFLME,hosp)
        setnames(p1,c("hosp","st","PLME"))
        setkey(p1,PLME,hosp)
        if (outcome =="heart attack") print(ha1$hosp[[1]])
        if (outcome == "heart failure") print(hf1$hosp[[1]])
        if (outcome == "pneumonia") print(p1$hosp[[1]])
}               
outcome <- "heart attack"
state <- "TX"    
y<- best(state,outcome)
