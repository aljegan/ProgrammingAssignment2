## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  get <- function() return(x)
  setInv <- function(inverse) inv <<- inverse
  getInv <- function() return(inv)
  list(get = get, setInv = setInv, getInv = getInv)
}


## Write a short comment describing this function

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
