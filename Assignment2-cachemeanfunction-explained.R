cachemean <- function(x, ...) {   # the input x is an object created by makeVector
        m <- x$getmean()               # accesses the object 'x' and gets the value of the mean
        if(!is.null(m)) {              # if mean was already cached (not NULL) ...
                
                message("getting cached data")  # ... send this message to the console
                return(m)                       # ... and return the mean ... "return" ends 
                #   the function cachemean(), note
        }
        data <- x$get()        # we reach this code only if x$getmean() returned NULL
        m <- mean(data, ...)   # if m was NULL then we have to calculate the mean
        x$setmean(m)           # store the calculated mean value in x (see setmean() in makeVector
        m               # return the mean to the code that called this function