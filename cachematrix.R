
makeCacheMatrix <- function(x = matrix()) {
  # define a set of arguments. 
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
   # assign the main argument to a symbol
  take <- function() x
  # set the inverse function and assign its value to a symbol
  set_solve <- function(solve) s <<- solve
  # trieve that function when called 
  take_solve <- function() s
  # chache the returned values in a list 
  list( set=set, get = take, setsolve = set_solve, getsolve = take_solve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## retrieve the cached values and assign to a new symbol 
  s <- x$getsolve()
  # search if cached solution exist, then return solution
  if(!is.null(s)) {
    print(("Retrieve cached inverse solution"))
    return(s)
  }
   # otherwise, calculate the a new solution
   new_data <- x$get()
  s <- solve(new_data, ...)
  x$setsolve(s)
  s
}


