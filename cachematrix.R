## Programming Assignment 2
#ver2

## Function contains a list of four functions that:
## - cretaes initital matrix
## - returns initial matrix
## - keeps inverse matrix
## - returns inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){                 # set() function changes initial matrix
        x <<- y                         # substitute initial matrix with new one
        s <<- NULL                      # make inverse matrix NULL after initial 
    }                               # matrix was substituted, so it has to be recalculated
    
    get <- function(){                  # returns initial matrix
        x
    }
    setsolve <- function(slv){          # store inverse matrix
        s <<-slv
    }
    getsolve <- function() {            # returns inverse matrix
        s
    }
    list(set = set, get = get,          # store four functions as a list of functions
         setsolve = setsolve,
         getsolve = getsolve)
}


## Function calculates inverse matrix and/or returns inverse from the cashe 
## if it was calculated earlier

cacheSolve <- function(x, ...) {        # returns inverse matrix
    s <- x$getsolve()                   # takes calculated inverse matrix
    if(!is.null(s)){                    # check if the inverse was calculated
        message ("getting cached data")             # if YES then show message and
        return(s)                                   # returns inverse matrix
    }
    data <- x$get()                                 # if NO then takes data
    s <- solve(data, ...)                           # calculates inverse matrix
    x$setsolve(s)                                   # stores inverse matrix into cache
    s                                               # returns inverse matrix
}