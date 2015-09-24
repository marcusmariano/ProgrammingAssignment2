## Name: Marcus Ney Mariano
## Programming Assignment 2: Lexical Scoping
## File: cachematrix.R

## Function to crete a special "matrix"  
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    ## set value of the matrix
    set <- function(y){  
        
        ## assign a value to an object in an environment
        x <<- y
        m <<- NULL
    }
    
    ## get value of the matrix
    get <- function(){        
        x         
    } 
    
     setsolve <- function(solve){        
        x <<- solve        
    }
    
    getsolve <- function(){        
        m         
    }
    
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Function to compute the inverse of the special "matrix"
cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    
    ## checks to see if inverse of the matrix is already been calculated
    if(!is.null(m)) {
        message("Getting cached data")
        return(m)
    }
    
    ## calculate inverse of the matrix
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}