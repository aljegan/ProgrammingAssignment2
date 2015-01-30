## makeCacheMatrix and cacheSolve can be used in conjunction to cache the inverse of a matrix so that 
## long computations do not need to be performed more than necessary
## 

## 

## Write a short comment describing this function

## returns a special "matrix" object which is really a list with some functions used to cache and manage 
## a matrix object (passed as an argument to the function)
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    get <- function() return(x)
    set <- funtion(mtx) {
        inv <<- NULL
        x <<- mtx
    }
    setInv <- function(inverse) inv <<- inverse
    getInv <- function() return(inv)
    list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## cacheSolve 'finds' the inverse of a special "matrix" object returned by the function above.
## If the inverse has already been calculated, it will grab the inverse from the cache.
## If not, it will compute (expensively) the inverse and then cache it to be easily found later.

cacheSolve <- function(x, ...) {
    inv <- x$getInv()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    matrix = x$get()
    inverse = solve(matrix)
    x$setInv(inverse)
    inverse
        ## Return a matrix that is the inverse of 'x'
}
