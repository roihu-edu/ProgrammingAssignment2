## The code creates a new type of matrix object with the function
## makeCacheMatrix(). The special object contains the
## original matrix and a container for the inverse matrix (initially
## an empty variable).
## When the special matrix object (makeCacheMatrix) is used to
## get the inverse matrix with the function cacheSolve(), the
## First is checked wether the inverse is already stored in the cache
## and if not it is first calculated. The function cahceSolve()
## Returns the inverse matrix.


## Creates a matrix object that caches its inverse via the cacheSolve()
## function.
## This function creates an object with four functions that
## "set" or "get" the original matrix, and "set" or "get" the 
## inverse matrix.
## The argument "inMatrix" is an invertible matrix object.

makeCacheMatrix <- function(inMatrix = matrix()) {
    inversedMatrix<- NULL
    ## Sets the original matrix and initializes the
    ## inverse matrix (as an NULL variable)
    set <- function(y) {
        inMatrix <<- y
        inversedMatrix<<- NULL
    }    
    ## Returns the original matrix
    get <- function(){
        inMatrix
    }    
    ## Sets the inversed matrix
    ## inv - the solved inversed matrix
    setinv <- function(inv){
        inversedMatrix<<- inv   
    }    
    ## 
    getinv <- function(){
        inversedMatrix
    }    
    list(set = set,
        get = get,
        setinv = setinv,
        getinv = getinv)
}


## The cacheSolve() function is used to obtain the inverse matrix of
## an object of the type makeCacheMatrix(). When this function is used,
## it solves the inverse matrix if the object does not contain it yet;
## then sets the inverse to the cache with $setinv(), and returns
## the inverse. If the object already contains the inverse, then
# the cached inverse is returned. 
## The argument "inCacheMatix" is an object of 
## the "class" makeCacheMatrix()
cacheSolve <- function(inCacheMatrix, ...) {
    ## Gets the cached inverse from the object (it will be NULL if
    ## it is the first time this object is used.
    invMat <- inCacheMatrix$getinv()
    if(!is.null(invMat)){
        ## The cached inverse was found and it is not needed to be solved
        message("Getting cached inverse matrix")
        ## The code returns the cached inverse and exits here
        return(invMat)
    }
    message("Inverse matrix not cached yet, solving the matrix.")
    ## If the inverse was not cached then the original matrix is retrieved
    origMat <- inCacheMatrix$get()
    ## then solved
    solvedMat <- solve(origMat)
    ##  and finally the solved matrix is cached into the object
    inCacheMatrix$setinv(solvedMat)
    ## the solved matrix is returned
    solvedMat
}
