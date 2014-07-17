## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        get <- function(){
                x
        }
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        getInv <- function(){
                inv
        }
        setInv <- function(inverse) {
                inv <<- inverse
        }
        list(set = set, get = get,getInv = getInv,setInv = setInv);
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        Inverse <- x$getInv()
        if(is.null(Inverse)){
                Inverse <- solve(x$get())
                x$setInv(Inverse)
        }
        Inverse
}

## Output:
##
## > mat <- matrix(sample(1:1000000,1000000,replace=T),nrow=1000,ncol=1000)
## > mat_obj <- makeCacheMatrix(mat)
## > system.time(Inv <- cacheSolve(mat_obj))
## user  system elapsed 
## 3.01    0.03    3.11 
## > system.time(Inv <- cacheSolve(mat_obj))
## user  system elapsed 
## 0       0       0 
##> 
