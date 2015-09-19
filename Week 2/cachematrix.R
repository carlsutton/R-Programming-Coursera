## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#  this function creates a "special" object that can cache its inverse
#  This is accomplished by storing (assigning) the calculated inverse
#  matrix in the calling envirnoment so that it can be found when
#  the function is run at a later time.  At least I "think" that is it.
#  The makeCacheMatrix just defines and populates functions for cachematrix
#  to use.  It does not call any of these functions.
makeCacheMatrix <- function(x = matrix()) {
        mat <- NULL
        set <- function(y) {
                x <<- y       # the matrix inverse??  I do not see where
                              #  this function is ever used
                mat <<- NULL  #  making sure mat = NULL
        }
        get <- function() x   # the matrix inverse
        setmat <- function(inverse) mat <<- inverse
        getmat <- function() mat
        #  make a list so that cashmatrix can access the functions output
        list(set = set, get = get, setmat = setmat, getmat = getmat)
}
#  The above makeCacheMatrix function created functions and populated
#  objects.  By saving and returning these objects in a list, cachematrix
#  function can now access the above, determine if the inverse exists,
#  and if so, call it, if not, compute it.
cachematrix <- function(x,...) {
        mat <- get$getmat() 
        if(!is.null(mat)) {
                message("getting cached matrix inverse")
                return(mat)
        }
        data <- x$get()
        mat <- source(mat,...)
        x$setmat(mat)
        mat
}
datavec <- rnorm(9,0,1)              #  create data
mat <- matrix(datavec,3,3)       # put data into matrix form
mat #  to see what it is
if (det(mat) ==0) message("is singular") 
result <- makeCacheMatrix(mat)   #  call function of functions
#  result is a list showing environments created and their objects
result

