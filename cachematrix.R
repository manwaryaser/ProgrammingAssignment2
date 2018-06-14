## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # setting a null value for s
  s <- NULL
   # assign the argument to symbole "take"
  take <- function() x
  # apply the function "solve" to symbole "s"
  set_solve <- function(solve) s <<- solve
  # assign the "s" to symbole "take_solve"
  take_solve <- function() s
  # create a list of values
  list( get = take, setsolve = set_solve, getsolve = take_solve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
 ## assign the value of take_solve to symbol
         s <- x$getsolve()
  # search if cached solution exist, then return solution
  if(!is.null(s)) {
    print(("Retrieve cached inverse solution"))
    return(s)
  }
  
  new_data <- x$get()
  s <- solve(new_data, ...)
  x$setsolve(s)
  s       
}
