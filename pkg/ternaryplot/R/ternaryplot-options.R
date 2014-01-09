# +-------------------------------------------------------------+
# | Language: R + roxygen2 inline documentation
# | Package: ternaryplot 
# | Author(s): Julien Moeys <Julien.Moeys@@slu.se> 
# | License: AGPL3, Affero General Public License version 3 
# +-------------------------------------------------------------+




# +-------------------------------------------------------------+
# Create two environment that will contain the package's
# parameters.

# - Backup / reference 
.tpParList <- new.env() 

# - User visible container
tpParList  <- new.env() 



# Set some default parameters: 

#.tpParList[[ "dummy" ]]      <- NULL 
.tpParList[[ "testSum" ]]     <- TRUE 
.tpParList[[ "testRange" ]]   <- TRUE 
.tpParList[[ "fracSumTol" ]]  <- 1/1000 
.tpParList[[ "ticksAt" ]]     <- seq( from = 0, to = 1, by = .1 ) 
.tpParList[[ "ticksShift" ]]  <- 0.025 
.tpParList[[ "arrowsShift" ]] <- c( 0.05, 0.10 ) 




# +-------------------------------------------------------------+
# Define the function that handles the package default parameters: 

#'Get or set default parameters for the package.
#'
#'Get or set default parameters for the package. Notice changes done to the
#'parameter values are reset everytime the R session is closed and the package
#'is reloaded.
#'
#'
#'@details 
#'  The function has 3 possible, non-exclusive behaviours: \itemize{ \item If
#'  \code{reset=TRUE}, resetting the parameters to their initial values, as
#'  defined in this function. \item (Silently) returning the actual value of the
#'  package parameters. If \code{par=NULL}, all the values are returned.  If
#'  \code{par} is a vector of parameter names, their value will be returned.
#'  \item Setting-up the value of some parameters, passing a list of parameter
#'  value to \code{par} OR setting some of the parameters listed above. }
#'
#'  Notice that when \code{reset=TRUE} and some new parameter values are
#'  provided, the parameters are first reset, and then the new parameter values
#'  are set. If \code{par} is a list, parameters are set first according to
#'  values in \code{par}, and then according to values in the parameters listed
#'  below. This combination is not recommended, but nonetheless possible.
#'
#'  The actual value of the parameters is stored in (and can be retrieved from)
#'  the environment \code{rspPars}. The default value of the parameters are
#'  stored in the environment \code{rspPars}. Do not use them directly.
#'
#'
#'@param par  
#'  Three possible cases: \itemize{ \item If \code{par} is \code{NULL}
#'  (default): All the actual value of the parameters will be silently returned.
#'  \item If \code{par} is a vector of character strings representing parameter
#'  names. The value of the parameters named here will be (silently) returned.
#'  \item If \code{par} is a list following the format \code{tag = value}, where
#'  \code{tag} is the name of the parameter to be changed, and \code{value} is
#'  its new value.  Such a list is returned by \code{tpPar()}. Notice that
#'  parameters can also be set indivudually, using the options listed below. }
#'
#'@param reset 
#'  Single logical. If TRUE, all the parameters will be set to their
#'  default value. Values are reset before any change to the parameter values, as
#'  listed below.
#'
#'@param testRange 
#'  Single logical. Test if the range of fraction is between 0 and 
#'  the expected sum of fractions (1 or 100). 
#'
#'@param testSum 
#'  Single logical. Test if the sum of the 3 fractions is equal to 
#'  the expected sum of fractions (1 or 100).
#'
#'@param fracSumTol 
#'  Single numeric. Tolerance on the sum of the 3 ternary fractions. Overall 
#'  tolerance is \code{fracSum * fracSumTol}, where \code{fracSum} is the 
#'  expected sum of the 3 ternary fractions, as given by a 
#'  \code{\linkS4class{ternaryGeometry}} or a \code{\linkS4class{ternarySystem}}.
#'
#'@param ticksAt 
#'  Vector of numeric. Pre-defined position of the tick-marks for the 3 axis.
#'  Between 0 and 'fracSum' (the sum of the 3 fractions).
#'
#'@param ticksShift
#'  Single numeric. Tick-marks 'size', expressed so that 
#'  \code{ticksShift * fracSum} is the length of the tick-marks.
#'
#'@param arrowsShift
#'  Vector of tow numeric values. Axis' arrows' shift from their 
#'  axis, expressed so that \code{arrowsShift * fracSum} is the 
#'  start and end point.
#'
#'@return 
#'  Returns a partial or complete list of (actual) parameter values, as a
#'  named list.
#'
#'@seealso \code{\link{getTpPar}}.
#'
#'@export tpPar
#'
tpPar <- function( 
    par    = NULL, 
    reset  = FALSE, 
    testRange, 
    testSum, 
    fracSumTol, 
    ticksAt, 
    ticksShift, 
    arrowsShift 
){  
    parList <- names( formals(tpPar) ) 
    parList <- parList[ !(parList %in% c( "par", "reset" )) ] 
    
    
    ## (1) Reset the parameter values:
    if( reset ){ 
        v  <- as.list( .tpParList ) 
        nv <- names( v ) 
        
        lapply( 
            X   = 1:length(v), 
            FUN = function(X){ 
                assign( x = nv[ X ], value = v[[ X ]], envir = tpParList ) 
            }   
        )   
        
        rm( nv, v ) 
    }   
    
    
    ## (2) Change the parameter values:
    
    # Get actual parameter values:
    tpParValues <- as.list( get( x = "tpParList" ) ) 
    
    # Case: par is a list of parameters to be set
    if( is.list( par ) ){
        parNames <- names( par ) 
         
        if( is.null( parNames ) ){ 
            stop( "If 'par' is a list, its item must be named." )
        }   
        
        # Check that all parameters in par exists:
        testpar1 <- !(parNames %in% names(tpParValues)) 
        
        if( any( testpar1 ) ){ 
            stop( sprintf( 
                "Some of the parameter names listed in 'par' could not be found: %s.", 
                paste( parNames[ testpar1 ], collapse=", " ) 
            ) ) 
        }  
        
        # Set the values
        for( i in parNames ){ 
            tpParValues[[ i ]] <- par[[ i ]] 
        }   
    }   
    
    # Set all the individual parameters provided as a function's 
    # argument(s)
    for( parLabel in parList ){ 
        testExpr <- substitute( 
            expr = !missing(theLabel), 
            env  = list( theLabel = as.symbol(parLabel) ) 
        )   
        
        if( eval( testExpr ) ){ 
            tpParValues[[ parLabel ]] <- get( x = parLabel )  
        }   
    }   
    
    # Set the parameter values at once 
    nv <- names( tpParValues ) 
    lapply( 
        X   = 1:length(tpParValues), 
        FUN = function(X){ 
            assign( x = nv[ X ], value = tpParValues[[ X ]], envir = tpParList ) 
        }   
    )   
    
    
    ## (3) Return the parameter values:
    
    # Case: return the value of some parameters:
    if( is.character(par) & (length(par) != 0) ){ 
        # Test that all demanded parameters exists:    
        testpar <- !(par %in% names(tpParValues)) 
        
        if( any( testpar ) ){ 
            stop( sprintf( 
                "Some of the parameter names listed in 'par' could not be found: %s.", 
                paste( par[ testpar ], collapse=", " ) 
            ) ) 
        }  
        
        ret <- tpParValues[ par ] 
    
    # Case: return the value of all parameters:
    }else{ 
        ret <- tpParValues 
    }   
    
    return( invisible( ret ) ) 
### Returns a partial or complete list of (actual) parameter values, 
### as a named list.
}   





#'Get a single default parameters for the package.
#'
#'Get a single default parameters for the package. Wrapper around
#'  \code{\link{tpPar}}.
#'
#'
#'@param par 
#'  See the \code{par} argument in \code{\link{tpPar}}. Notice that if
#'  more than one parameter name is provided, only the first one will be
#'  returned.
#'
#'
#'@return 
#'  Return the value of the parameter \code{par}, without the list
#'  container of \code{\link{tpPar}}.
#'
#'@export getTpPar
#'
getTpPar <- function(
    par 
){  
    return( tpPar( par = par )[[ 1L ]] ) 
}   




# +-------------------------------------------------------------+
# Test that all parameters in '.tpParList' have been included in 
# the function rspParameters() 

# List of parameter names:
parNames <- names( as.list( .tpParList ) ) 

# List of argument names
tpParF <- names(formals(tpPar))
tpParF <- tpParF[ !(tpParF %in% c("par","reset")) ]

# List of parameters handled by tpPar(): do they match with 
# the default parameters?
testpar  <- !(parNames %in% tpParF)

if( any(testpar) ){ 
    stop( sprintf( 
        "Some parameters in '.tpParList' are not in names(formals(tpPar)): %s", 
        paste( parNames[ testpar ], collapse = ", " ) 
    ) )  
}   

# Other way round
testpar2 <- !(tpParF %in% parNames)

if( any(testpar2) ){ 
    stop( sprintf( 
        "Some parameters in names(formals(tpPar)) are not in '.tpParList': %s", 
        paste( tpParF[ testpar2 ], collapse = ", " ) 
    ) )  
}   

rm( testpar, parNames, testpar2, tpParF ) 



# Set the current list of parameters
tpParList <- list2env( as.list( .tpParList ) ) 
