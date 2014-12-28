best <- function(state,outcome) 
{     
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        if(outcome !="heart attack" && outcome !="heart failure" && outcome !="pneumonia")
        {
                stop("invalid outcome")
        }
        if(!(state %in% data[[7]]))
        {
                 stop("invalid state")
        }
        data[,13] <- as.numeric(data[,13])
        data[,19] <- as.numeric(data[,19])
        data[,25] <- as.numeric(data[,25])
        hosp <- data[,"Hospital.Name"]
        st <- data[,"State"]
        HALME <- data[,"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"]
        HA1 <- data[complete.cases(data),c(2,7,13)]
        HFLME <- data[,"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"]
        HF1 <- data[complete.cases(data),c(2,7,19)]
        PLME <- data[,"Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]
        P1 <- data[complete.cases(data),c(2,7,25)]
        require(data.table)
        ha2 <- data.table(HA1)
        ha2 <- setnames(ha2,c("hosp","st","HALME"))
        #  HALME refers to heart attack low mortality estimate
        #  setting the keys automatically orders a data table
        setkey(ha2,HALME,hosp)
        #  subset on variable state
        ha2 <- subset(ha2, st == state)
        hf2 <- data.table(HF1)      
        setnames(hf2,c("hosp","st","HFLME"))
        setkey(hf2,HFLME,hosp)
        hf2 <- subset(hf2, st == state)
        p2 <- data.table(P1)
        setnames(p2,c("hosp","st","PLME"))
        setkey(p2,PLME,hosp)
        p2 <- subset(p2, st == state)
        if (outcome =="heart attack") print(ha2$hosp[[1]])
        if (outcome == "heart failure") print(hf2$hosp[[1]])
        if (outcome == "pneumonia") print(p2$hosp[[1]])
}               
outcome <- "heart attack"
state <- "TX"    
y<- best(state, outcome)
