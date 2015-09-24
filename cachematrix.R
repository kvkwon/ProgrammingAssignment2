## The function makeCacheMatrix creates a list consisting 4 member functions
## set, get, setInv and getInv and returns it.

makeCacheMatrix <- function(x = matrix()) {
  
  inverse <- NULL #Setting the variable inverse with NULL.
  
  # The function set will set the matrix
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  
  # Next, the get function will get the matrix x
  # Which is the parameter of makeCacheMatrix function
  get <- function() x
  
  # setInv function will set the inverse of the matrix
  setInv <- function(inv) inverse <<- inv
  
  # getInv returns the inverse matrix
  getInv <- function() inverse
  
  # Finally, makeCacheMatrix returns a list
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}

## cacheSolve function returns the inverse matrix of a matrix.
## This function uses the returned list from the makeCacheMatrix function
## as the parameter.

cacheSolve <- function(x, ...) {

  inverse <- x$getInv()
  
  # First, the function checks if the inverse matrix has already been calculated
  # with the if statement
  if(!is.null(inverse)){
    message("getting cached data")
    return(m)
  }
  
  # If the inverse has never been calculated, the function calculates
  # the inverse matrix with the following codes.
  data <- x$get()
  inverse <- solve(data, ...)
  x$setInv(inverse)
  inverse
}

## To test the two functions makeCacheMatrix and cacheSolve,
## we will have to start with a square matrix.

# Testing code
tester <- matrix(1:4, nrow=2)
cachematrix <- makeCacheMatrix(tester)
cacheSolve(cachematrix)

# The inverse calculated with the testing code above, gives the
# appropriate inverse matrix and caches it.
