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
        head(PLME)
        HA1 <- data.table(hosp,st,HALME)
        colnames(HA1)
        ha1 <- subset(HA1, st = state)
        ha1 <- subset(ha1, st ==state)
        ha1 <- ha1[complete.cases(ha1),]
        head(ha1)
        HF1 <- data.table(hosp,st,HFLME)
        colnames(HF1)
        hf1 <- subset(HF1, st = state)
        head(hf1)
        hf1 <- subset(hf1, st ==state)
        hf1 <- hf1[complete.cases(hf1),] 
        head(hf1)
        P1 <- data.table(hosp,st,PLME)
        head(P1)
        #        p1 <- subset(P1, st = state)
        p1 <- subset(P1, st == state)
        head(p1)
        p1 <- p1[complete.cases(p1),]
        head(p1)
        #  HALME refers to heart attack low mortality estimate
        #  setting the keys automatically orders a data table
        setkey(ha1,HALME,hosp) 
        head(hf1)       
        setkey(hf1,HFLME,hosp)
        head(hf1)
        setnames(p1,c("hosp","st","PLME"))
        head(p1)        
        setkey(p1,PLME,hosp)
        head(p1)
        if (outcome =="heart attack") 
        {
                print(ha1[1,hosp])
                print(class(ha1[1,hosp]))
                y <- c(as.character(ha1[1,hosp]))
                return(y)
        }
        if (outcome == "heart failure")
        {
                head(hf1)
                print(hf1[1,hosp])
                print(class(hf1[1,hosp]))
                y <- c(hf1[1,hosp])
                return(y)
        }
        if (outcome == "pneumonia")
        {
                print(p1[1,hosp])
                print(class(p1[1,hosp]))
                y <- c( p1[1,hosp])
                return(y)
        }
}               
outcome <- "heart failure"
state <- "TX"    
#  r <- best("SC", "heart attack")
#  is.character(r)
y <- best("state","outcome")
is.character(y)
