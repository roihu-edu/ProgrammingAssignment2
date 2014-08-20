## Put comments here that give an overall description of what your
## functions do

## The inverse of a matrix is calculated and cached if the inverse
## has not been solved yet. If the same matrix has been solved
## previously, then the cached inverse matrix is return and the
## calculation avoided.

## Creates a matrix object that is able to cache its inverse
##  Actually the returned object is a list of functions that
##  set or get the original matrix, and solve and set the inverse
##  or get the cached inverse    
## The argument "inMatrix" is an invertible matrix object.

makeCacheMatrix <- function(inMatrix = matrix()) {
    inversedMatrix<- NULL
    ## Sets the original matrix and initializes the
    ## inverse matrix
    set <- function(y) {
        inMatrix <<- y
        inversedMatrix<<- NULL
    }
    
    ## Returns the original matrix
    get <- function(){
        inMatrix
    }
    
    ## Sets the i
    setinv <- function(inv){
        inversedMatrix<<- inv   
    }
    getinv <- function(){
        inversedMatrix
    }
    list(set = set,
        get = get,
        setinv = setinv,
        getinv = getinv)
}


## Write a short comment describing this function
## The argument "inCacheMatix" is an object of the "class" makeCacheMatrix
## defined above.

cacheSolve <- function(inCacheMatrix, ...) {
        ## Return a matrix that is the inverse of 'x'
}
