#Testing cachematrix.R
source('C:/Users/mooc/data_scientist/github/ProgrammingAssignment2/cachematrix.R')

## Create dummy matrix that is invertible
set.seed(123)
matr <- matrix(runif(30^2),30)

## Create makeCacheMatrix object
cacheMatr <- makeCacheMatrix(matr)

## "result" is the inverse of the original matrix "matr"
## which is calculated the first time that cacheSolve
## is called.
result <- cacheSolve(cacheMatr)

## The inverse of the original matrix has been calculated in the
## previous command, so this time cacheSolve will return the 
## same inverse matrix but this time it will come from the cache.
result <- cacheSolve(cacheMatr)