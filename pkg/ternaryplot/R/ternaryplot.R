# +-------------------------------------------------------------+
# | Language: R + roxygen2 inline documentation
# | Package: ternaryplot 
# | Author(s): Julien Moeys <Julien.Moeys@@slu.se> 
# | License: AGPL3, Affero General Public License version 3 
# +-------------------------------------------------------------+

# Useful: \code{} \code{\link[]{}} 

# TO DO: ADD A TEXT LABEL in .ternaryTicks()



#'Fetch a pre-defined ternary classification system
#'
#'Fetch a pre-defined ternary classification system
#'
#'
#'@param s 
#'  Single character string. Name of the ternary classification to 
#'  be fetched.
#'
#'
#'@return 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'
#'@export 
#'
ternarySystemGet <- function( s = "default" ){    
    if( !is.character( s ) ){ 
        stop( "'s' must be a character string" )
    }   
    
    # Get all the ternary classifications:
    # ternarySystemList <- as.list( "ternaryplot":::"ternarySystemList" ) 
    ternarySystemE <- as.list( ternarySystemEnv )  
    
    # Check if the system asked is present:
    if( s %in% names( ternarySystemE ) ){ 
        s <- ternarySystemE[[ s ]] 
    }else{ 
        stop( sprintf( 
            "The ternary plot (%s) could not be found", 
            s 
        ) ) 
    }   
    
    return( s ) 
}   




#'List all pre-defined ternary classification systems
#'
#'List all pre-defined ternary classification systems
#'
#'
#'@return 
#'  A vector of character strings, names of the pre-defined ternary 
#'  classification systems
#'
#'
#'@export 
#'
ternarySystemList <- function(){    
    # Get all the ternary classifications:
    ternarySystemE <- as.list( ternarySystemEnv ) 
    
    tsList <- names( ternarySystemE )
    
    return( tsList ) 
}   




#'Test the conformity of ternary point data
#'
#'Test the conformity of ternary point data according to a 
#'  \code{\linkS4class{ternarySystem}} object.
#'
#'
#'@usage 
#'  \S4method{ternaryDataTest}{missing}( s, \dots ) 
#'
#'  \S4method{ternaryDataTest}{character}( s, \dots ) 
#' 
#'  \S4method{ternaryDataTest}{ternarySystem}( s, x, 
#'      testRange = TRUE, testSum = TRUE, \dots ) 
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object or a character string 
#'  naming a pre-defined \code{ternarySystem}.
#'
#'@param x 
#'  A \code{\link[base]{data.frame}} or a \code{\link[base]{matrix}} 
#'  containing point ternary data (x-y-x) to be tested.
#'
#'@param testRange 
#'  Single logical. Test if the range of fraction is between 0 and 
#'  the expected sum of fractions (1 or 100). 
#'
#'@param testSum 
#'  Single logical. Test if the sum of the 3 fractions is equal to 
#'  the expected sum of fractions (1 or 100).
#'
#'@param \dots
#'  Additional parameters passed to \code{ternarySystem-methods}.
#'
#'@return 
#'  Does not return anything. Stops if an error is found.
#'
#'
#'@rdname ternaryDataTest-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryDataTest <- function( 
    s, 
    ... 
){    
    standardGeneric( "ternaryDataTest" ) 
}   

rm("ternaryDataTest") 

setGeneric( 
    "ternaryDataTest", 
    function( 
        s, 
        ... 
    ){    
        standardGeneric( "ternaryDataTest" ) 
    }   
)   

# showMethods("ternaryDataTest")



### Set and check the ternarySystem. Used inside functions.
ternarySystemSet <- function( s = "default" ){ 
    if( is.character( s ) ){ 
        s <- ternarySystemGet( s = s ) 
    }else if( !is( s, "ternarySystem" ) ){ 
        stop( "'s' must be a 'character' or a 'ternarySystem' x" ) 
    }
    
    # validObject( s ) # Create an infinite loop!
    
    return( s )
}   




#'@rdname ternaryDataTest-methods
#'@aliases ternaryDataTest,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "ternaryDataTest", 
    signature  = signature( 
        s = "ternarySystem" 
    ), 
    definition = function( 
        s, 
        x, 
        testRange = TRUE, 
        testSum   = TRUE, 
        ... 
    ){ 
        geo     <- s@'ternaryGeometry' 
        var     <- s@'ternaryVariables' 
        fracSum <- fracSum( x = s ) 
        
        # Tolerance:
        fracSumTol <- getTpPar( par = "fracSumTol" ) * fracSum 
        
        
        # message( "data.frame, missing, ternaryGeometry, ternaryVariables" )
        
        # Check the column names: 
        blrNames0 <- var@'blrNames' 
        
        # Test x class
        if( missing( "x" ) ){ stop( "'x' is missing" ) }   
        
        if( is.matrix( x ) ){ 
            x <- as.data.frame( x ) 
        }else if( !is.data.frame( x ) ){ 
            stop( sprintf( 
                "'x' must be a data.frame or a matrix (now: %s)", 
                paste( class(x), collapse = "; " )
            ) ) 
        }   
        
        testColVert <- blrNames0 %in% colnames( x ) 
        
        if( any( !testColVert ) ){ 
            stop( sprintf( 
                "Some column missing in 'x' (%s)", 
                paste( 
                    colnames( x )[ !testColVert ], 
                    collapse = ", " 
                )   
            ) ) 
        }   
        
        # Check missing values
        if( any( is.na( x ) ) ){ 
            stop( "Some values in 'x' are missing. Missing values are not allowed" )   
        }   
        
        if( testRange & (nrow( x ) != 0) ){ 
            # Check that no fraction is negative
            if( any( x[, blrNames0 ] < 0 ) ){ 
                stop( "Some fractions in 'x' are negative. Fractions can't be negative" ) 
            }   
            
            # Check that no fraction is over fracSum 
            if( any( x[, blrNames0 ] > fracSum ) ){ 
                stop( sprintf( 
                    "Some fractions in 'x' are bigger than the expected sum of fractions (%s)", 
                    fracSum 
                ) ) 
            }   
        }   
        
        if( testSum & (nrow( x ) != 0) ){ 
            # Check the fractions' sum
            testFracSum <- apply( 
                X      = x[, blrNames0 ], 
                MARGIN = 1, 
                FUN    = sum 
            )   
            
            # Within accepted bounds?
            testFracSum <- 
                (testFracSum >= (fracSum - fracSumTol)) & 
                (testFracSum <= (fracSum + fracSumTol))   
            
            if( any( !testFracSum ) ){ 
                stop( sprintf( 
                    "The fraction sum of some rows in 'x' is bigger than the expected sum of fractions (%s)", 
                    fracSum 
                ) ) 
            }   
        }   
        
    }   
)   


#'@rdname ternaryDataTest-methods
#'@aliases ternaryDataTest,character-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "ternaryDataTest", 
    signature  = signature( 
        s = "character" 
    ), 
    definition = function( 
        s, 
        ... 
    ){  
        # Fetch the ternarySystem
        s <- ternarySystemGet( s = s ) 
        
        # Call relevant method:
        ternaryDataTest( s = s, ... ) 
    }   
)   


#'@rdname ternaryDataTest-methods
#'@aliases ternaryDataTest,missing-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "ternaryDataTest", 
    signature  = signature( 
        s = "missing" 
    ), 
    definition = function( 
        s, 
        ... 
    ){  
        # Fetch the ternarySystem
        s <- ternarySystemGet() 
        
        # Call relevant method:
        ternaryDataTest( s = s, ... )  
    }   
)   




#'NOT EXPORTED Draw an invisible base-plot for ternaryPlot
#'
#'NOT EXPORTED Draw an invisible base-plot for ternaryPlot
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object, or a single 
#'  \code{character} string. Can be missing.
#'
#'@param x 
#'  A \code{\link[base]{data.frame}} or a \code{\link[base]{matrix}} 
#'  containing point ternary data (x-y-x) to be ploted on the graph. 
#'  It should contain the 3 columns names given in \code{s}. Can 
#'  be missing or \code{NULL}.
#'
#'@param scale 
#'  A \code{\link[base]{data.frame}} with 3 columns and 2 rows. 
#'  Contains the min and max limits of each of the 3 variables 
#'  (columns = variables, rows = min and max).
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@rdname ternaryWindow-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryWindow <- function( 
    s, 
    x, 
    scale = FALSE, 
    ... 
){  
    standardGeneric( "ternaryWindow" ) 
}   

rm("ternaryWindow") 

setGeneric( 
    "ternaryWindow", 
    function( 
        s, 
        x, 
        scale = FALSE, 
        ... 
    ){    
        standardGeneric( "ternaryWindow" ) 
    }   
)   


#'@rdname ternaryWindow-methods
#'@aliases ternaryWindow,missing-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryWindow", 
    signature  = "missing", 
    definition = function(
        s, 
        x, 
        scale = FALSE, 
        ... 
    ){  
        # Set the ternarySystem
        s <- ternarySystemGet() 
        
        ternaryWindow( s = s, ... ) 
    }   
)   


#'@rdname ternaryWindow-methods
#'@aliases ternaryWindow,character-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryWindow", 
    signature  = "character", 
    definition = function(
        s, 
        x, 
        scale = FALSE, 
        ... 
    ){  
        # Set the ternarySystem
        s <- ternarySystemGet( s = s )  
        
        ternaryWindow( s = s, ... ) 
    }   
)   


#'@rdname ternaryWindow-methods
#'@aliases ternaryWindow,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryWindow", 
    signature  = "ternarySystem", 
    definition = function(
        s, 
        x, 
        scale = FALSE, 
        ... 
    ){  
        # Set x if it is missing
        if( missing( "x" ) ){ 
            x <- data.frame(
                "B"    = numeric(0), 
                "L"    = numeric(0), 
                "R"    = numeric(0)  
            )   
            
            colnames( x ) <- blrNames( s = s ) 
            
        }else if( is.matrix( x ) ){ 
            x <- as.data.frame( x ) 
            
        }else if( !is.data.frame(x) ){ 
            stop( "'x' can be missing, a data.frame, or a matrix" ) 
        }   
        
        
        if( is.data.frame( scale ) ){ 
            # Test that the scale is correct
            ternaryDataTest( s = s, x = scale,  ) 
            
        }else if( is.logical( scale ) ){ 
            if( scale ){ 
                if( nrow(x) == 0 ){ 
                    stop( "'scale' can not be 'TRUE' when 'x' is missing or with 0 rows" ) 
                }   
                
                # Find the optimal isocele triangle around the data
                scale <- ternaryLims( x = x, s = s ) 
                
            }else{ 
                scale <- s@'scale' 
            }   
        }   
        
        
        ## Convert the scale into a triangular frame
        tpBox <- data.frame( 
            "B"    = c( scale[1,1], scale[2,1], scale[1,1] ), 
            "L"    = c( scale[1,2], scale[1,2], scale[2,2] ), 
            "R"    = c( scale[2,3], scale[1,3], scale[1,3] ), 
            "row.names" = c( "left", "right", "top" ) 
        )   
        
        colnames( tpBox ) <- blrNames( s = s )   
        
        
        # Convert the scale to x-y values
        
        # Create a 90 degree triangle
        blrClock0 <- blrClock( s ) 
        
        s90 <- s 

        if( is.na( blrClock0[2] ) ){ 
            s90@'ternaryGeometry'@'tlrAngles' <- c( 45, 45, 90 ) 
        }else if( blrClock0[2] ){ 
            s90@'ternaryGeometry'@'tlrAngles' <- c( 45, 90, 45 ) 
        }else{ 
            s90@'ternaryGeometry'@'tlrAngles' <- c( 45, 45, 90 ) 
        }   
        
        tpBox <- blr2xy( x = tpBox, s = s90 ) 
        
        # Draw the plot
        par( 
            mar = c(5.1, 4.1, 4.1, 4.1), # Margins c(bottom, left, top, right)
            pty = "s",                   # Plot region is 'square' (equal ratio)
            xpd = TRUE                   # Plotting can also occur out of the plot
        )    

        plot( 
            x    = tpBox[,"x"], 
            y    = tpBox[,"y"], 
            bty  = "n", # no box around, 
            xaxt = "n", # no x axis 
            yaxt = "n", # no y axis 
            type = "n", # no data visible 
            xlab = "",  # no x label
            ylab = "",  # no y label
            xlim = range( tpBox[,"x"] ), # No extra space 
            ylim = range( tpBox[,"y"] )  # No extra space 
        )   
        
        # polygon( x = tpBox[, "x" ], y = tpBox[, "y" ] ) 
        
        s@'scale' <- scale 

        return( invisible( s ) ) 
    }   
)   




#'Draw a frame (bounding-box) around an existing ternaryPlot
#'
#'Draw a frame (bounding-box) around an existing ternaryPlot
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@rdname ternaryBox-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryBox <- function( s, ... ){  
    standardGeneric( "ternaryBox" ) 
}   

rm("ternaryBox") 

setGeneric( "ternaryBox", function( s, ... ){    
    standardGeneric( "ternaryBox" ) 
} )    


#'@rdname ternaryBox-methods
#'@aliases ternaryBox,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryBox", 
    signature  = "ternarySystem", 
    definition = function( s, ... ){   
        scale <- s@'scale'
        
        ## Convert the scale into a triangular frame
        tpBox <- data.frame( 
            "B"    = c( scale[ 1, 1 ], scale[ 2, 1 ], scale[ 1, 1 ] ), 
            "L"    = c( scale[ 1, 2 ], scale[ 1, 2 ], scale[ 2, 2 ] ), 
            "R"    = c( scale[ 2, 3 ], scale[ 1, 3 ], scale[ 1, 3 ] ), 
            "row.names" = c( "left", "right", "top" ) 
        )   
        
        colnames( tpBox ) <- blrNames( s = s )   
        
        
        # Convert the scale to x-y values
        tpBox <- blr2xy( x = tpBox, s = s ) 
        
        polygon( x = tpBox[, "x" ], y = tpBox[, "y" ] ) 

        return( invisible( s ) ) 
    }   
)    




#'Draw a sequence of ternary data-points on a triangle plot
#'
#'Draw a sequence of ternary data-points on a triangle plot
#'
#'
#'@seealso
#'  \code{\link[graphics]{points}}.
#'
#'
#'@param x  
#'  A \code{\link[base]{data.frame}} or a 
#'  \code{\link[base]{matrix}} containing ternary data-points.
#'
#'@param s  
#'  A \code{\linkS4class{ternarySystem}} object, or a 
#'  character string naming a pre-defined \code{ternarySystem}. 
#'  If missing, set to \code{default}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@rdname ternaryPoints-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryPoints <- function( x, s, ... ){  
    standardGeneric( "ternaryPoints" ) 
}   

rm("ternaryPoints") 

setGeneric( "ternaryPoints", function( x, s, ... ){    
    standardGeneric( "ternaryPoints" ) 
} )    


#'@rdname ternaryPoints-methods
#'@aliases ternaryPoints,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryPoints", 
    signature  = "data.frame", 
    definition = function( x, s, ... ){ 
        # Set the value for s
        if( missing( s ) ){ 
            s <- ternarySystemSet() 
        }else{ 
            s <- ternarySystemSet( s = s )    
        }   
        
        
        xy <- blr2xy( x = x, s = s ) 
        
        points( x = xy[,"x"], y = xy[,"y"], ... ) 
    }   
)   


#'@rdname ternaryPoints-methods
#'@aliases ternaryPoints,matrix-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryPoints", 
    signature  = "matrix", 
    definition = function( x, s = "default", ... ){ 
        # Transform x into a data.frame
        x <- as.data.frame( x ) 
        
        ternaryPoints( x = x, s = s, ... )
    }   
)   




#'Draw a sequence of ternary segments on a triangle plot
#'
#'Draw a sequence of ternary segments on a triangle plot
#'
#'
#'@seealso
#'  \code{\link[graphics]{segments}}.
#'
#'
#'@param from 
#'  A \code{\link[base]{data.frame}} or a 
#'  \code{\link[base]{matrix}} containing the ternary 
#'  coordinates of points *from* which to draw.
#'
#'@param to
#'  A \code{\link[base]{data.frame}} or a 
#'  \code{\link[base]{matrix}} containing the ternary 
#'  coordinates of points *to* which to draw.
#'
#'@param s  
#'  A \code{\linkS4class{ternarySystem}} object, or a 
#'  character string naming a pre-defined \code{ternarySystem}. 
#'  If missing, set to \code{default}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[graphics]{segments}}.
#'
#' 
#'@rdname ternarySegments-methods
#'
#'@export 
#'
#'@docType methods
#'
ternarySegments <- function( from, to, s, ... ){  
    standardGeneric( "ternarySegments" ) 
}   

rm("ternarySegments") 

setGeneric( "ternarySegments", function( from, to, s, ... ){    
    standardGeneric( "ternarySegments" ) 
} )  


#'@rdname ternarySegments-methods
#'@aliases ternarySegments,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternarySegments", 
    signature  = "data.frame", 
    definition = function( from, to, s, ... ){ 
        # Set the value for s
        if( missing( s ) ){ 
            s <- ternarySystemSet() 
        }else{ 
            s <- ternarySystemSet( s = s )    
        }   
        
        # Check to and from
        if( missing( to ) ){ 
            stop( "'to' is missing" )
        }   
        
        if( class(from) != class(to) ){ 
            stop( "'from' and 'to' must be of the same class (data.frame or matrix)" )
        }           
        
        if( nrow(from) != nrow(to) ){ 
            stop( "'from' and 'to must have the same number of rows" )
        }    
        
        # Fetch coordinate columns:
        blrNames0 <- blrNames( s = s ) 
        from <- from[, blrNames0 ]  
        to   <- to[, blrNames0 ]   

        # Transform the coordinates into x-y values
        fromXY <- blr2xy( x = from, s = s ) 
        toXY   <- blr2xy( x = to, s = s ) 
        
        # Draw the segments
        segments(
            x0  = fromXY[, "x" ], 
            y0  = fromXY[, "y" ], 
            x1  = toXY[, "x" ], 
            y1  = toXY[, "y" ], 
            ...
        )   
    }   
)   


#'@rdname ternarySegments-methods
#'@aliases ternarySegments,matrix-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternarySegments", 
    signature  = "matrix", 
    definition = function( from, to, s, ... ){ 
        # Transform x into a data.frame
        x <- as.data.frame( x ) 
        
        ternarySegments( from = from, to = to, s = s, ... )
    }   
)   




#'Draw a sequence of ternary arrows on a triangle plot
#'
#'Draw a sequence of ternary arrows on a triangle plot
#'
#'
#'@seealso
#'  \code{\link[graphics]{arrows}}.
#'
#'
#'@param from 
#'  A \code{\link[base]{data.frame}} or a 
#'  \code{\link[base]{matrix}} containing the ternary 
#'  coordinates of points *from* which to draw the arrows.
#'  Each row is an arrow, and the columns must correspond 
#'  to \code{blrNames(s)} (variable names for the bottom, 
#'  left and right axis).
#'
#'@param to
#'  A \code{\link[base]{data.frame}} or a 
#'  \code{\link[base]{matrix}} containing the ternary 
#'  coordinates of points *to* which to draw the arrows.
#'  Each row is an arrow, and the columns must correspond 
#'  to \code{blrNames(s)} (variable names for the bottom, 
#'  left and right axis).
#'
#'@param s  
#'  A \code{\linkS4class{ternarySystem}} object, or a 
#'  character string naming a pre-defined \code{ternarySystem}. 
#'  If missing, set to \code{default}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[graphics]{arrows}}.
#'
#' 
#'@rdname ternaryArrows-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryArrows <- function( from, to, s, ... ){  
    standardGeneric( "ternaryArrow" ) 
}   

rm("ternaryArrows") 

setGeneric( "ternaryArrows", function( from, to, s, ... ){    
    standardGeneric( "ternaryArrows" ) 
} )  


#'@rdname ternaryArrows-methods
#'@aliases ternaryArrows,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryArrows", 
    signature  = "data.frame", 
    definition = function( from, to, s, ... ){ 
        # Set the value for s
        if( missing( s ) ){ 
            s <- ternarySystemSet() 
        }else{ 
            s <- ternarySystemSet( s = s )    
        }   
        
        # Check to and from
        if( missing( to ) ){ 
            stop( "'to' is missing" )
        }   
        
        if( class(from) != class(to) ){ 
            stop( "'from' and 'to' must be of the same class (data.frame or matrix)" )
        }           
        
        if( nrow(from) != nrow(to) ){ 
            stop( "'from' and 'to must have the same number of rows" )
        }    
        
        # Fetch coordinate columns:
        blrNames0 <- blrNames( s = s ) 
        from <- from[, blrNames0 ]  
        to   <- to[, blrNames0 ]   

        # Transform the coordinates into x-y values
        fromXY <- blr2xy( x = from, s = s ) 
        toXY   <- blr2xy( x = to, s = s ) 
        
        # Draw the arrows
        arrows(
            x0  = fromXY[, "x" ], 
            y0  = fromXY[, "y" ], 
            x1  = toXY[, "x" ], 
            y1  = toXY[, "y" ], 
            ...
        )   
    }   
)   




#'INTERNAL. Calculates grid segments start and end ternary coordinates 
#'
#'INTERNAL. Calculates grid segments start and end ternary coordinates
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param ticks
#'  Single logical. If \code{TRUE}, return values for 
#'  axis' tick-marks. If \code{FALSE}, return values for 
#'  a grid.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@rdname ternaryGridBase-methods
#'
#'@export 
#'
#'@docType methods
#'
#'@keywords internal
#'
.ternaryGridBase <- function( s, ticks = FALSE, ... ){  
    standardGeneric( ".ternaryGridBase" ) 
}   

rm(".ternaryGridBase") 

setGeneric( ".ternaryGridBase", function( s, ticks = FALSE, ... ){    
    standardGeneric( ".ternaryGridBase" ) 
} )    


#'@rdname ternaryGridBase-methods
#'@aliases .ternaryGridBase,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = ".ternaryGridBase", 
    signature  = "ternarySystem", 
    definition = function( s, ticks = FALSE, ... ){ 
        blrNames0   <- blrNames( s = s )  
        blrClock    <- blrClock( s )  
        tScale      <- s@'scale' 
        fracSum     <- fracSum( x = s ) 
        ticksShift  <- getTpPar( "ticksShift" )
        
        # Note: Axis order / index is Bottom -> Left -> Right
        #       This order is cyclic: after Right comes left
        #                             before Bottom, comes Right    
        
        
        # Fetch the ticks location:
        bTicks <- lTicks <- rTicks <- getTpPar( "ticksAt" ) * fracSum 
        
        # Select only the ticks that fit within the scale
        bTicks <- bTicks[ 
            bTicks > tScale[ "min", 1 ] & 
            bTicks < tScale[ "max", 1 ]   
        ]   

        lTicks <- lTicks[ 
            lTicks > tScale[ "min", 2 ] & 
            lTicks < tScale[ "max", 2 ]   
        ]   
        
        rTicks <- rTicks[ 
            rTicks > tScale[ "min", 3 ] & 
            rTicks < tScale[ "max", 3 ]   
        ]   
        
        # pre-format the grid-lines of each axis
        bTicks <- data.frame( 
            "B" = bTicks, 
            "L" = rep( NA_real_, length(bTicks) ), 
            "R" = rep( NA_real_, length(bTicks) )
        )   
        colnames( bTicks ) <- blrNames0 

        lTicks <- data.frame( 
            "B" = rep( NA_real_, length(lTicks) ), 
            "L" = lTicks, 
            "R" = rep( NA_real_, length(lTicks) )
        )   
        colnames( lTicks ) <- blrNames0 
        
        rTicks <- data.frame( 
            "B" = rep( NA_real_, length(rTicks) ), 
            "L" = rep( NA_real_, length(rTicks) ), 
            "R" = rTicks
        )   
        colnames( rTicks ) <- blrNames0 
        
        # Format as a list
        gridFrom <- gridTo <- list( 
            "B" = bTicks, 
            "L" = lTicks, 
            "R" = rTicks  
        )   
        names( gridFrom ) <- blrNames0
        names( gridTo )   <- blrNames0
        rm( bTicks, lTicks, rTicks )
        
        ## Calculate the grid-lines coordinates for each axis
        for( ax in 1:3 ){ 
            # Index of previous and next axis 
            if( ax == 1 ){ 
                axPrev <- 3 
                axNext <- 2 
            }else if( ax == 2 ){ 
                axPrev <- 1 
                axNext <- 3 
            }else if( ax == 3 ){ 
                axPrev <- 2 
                axNext <- 1 
            }   

            if( !is.na( blrClock[ ax ] ) ){ 

                # Axis is clockwise
                if( blrClock[ ax ] ){ 
                    nextClock <- ifelse( 
                        is.na( blrClock[ axNext ] ), 
                        FALSE, 
                        blrClock[ axNext ] 
                    )   
                    
                    prevClock <- ifelse( 
                        is.na( blrClock[ axPrev ] ), 
                        FALSE, 
                        blrClock[ axPrev ] 
                    )   

                    # Next axis is not clockwise or is NA
                    if( !nextClock ){ 
                        # Start coordinates on previous axis is 0 or min
                        gridFrom[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] 
                        
                        # Start coordinates on next axis
                        gridFrom[[ ax ]][, axNext ] <- 
                            fracSum - 
                            gridFrom[[ ax ]][, ax ] - 
                            gridFrom[[ ax ]][, axPrev ]
                        
                        if( !ticks ){ 
                            # End coordinates on next axis
                            gridTo[[ ax ]][, axNext ] <- tScale[ "min", axNext ] 
                        
                            # End coordinate on previous axis
                            gridTo[[ ax ]][, axPrev ] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axNext ] 
                        }else{ 
                            gridTo[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] - ticksShift * fracSum 

                            # End coordinate on previous axis
                                gridTo[[ ax ]][, axNext ] <- 
                                    fracSum - 
                                    gridTo[[ ax ]][, ax ] - 
                                    gridTo[[ ax ]][, axPrev ] 
                        }   

                    # Next axis is clockwise too
                    }else{ 
                        # Start coordinates on next axis is 0 or min
                        gridFrom[[ ax ]][, axNext ] <- tScale[ "min", axNext ] 
                        
                        # Start coordinates on previous axis
                        gridFrom[[ ax ]][, axPrev ] <- 
                            fracSum - 
                            gridFrom[[ ax ]][, ax ] - 
                            gridFrom[[ ax ]][, axNext ]
                        
                        if( !ticks ){ 
                            # End coordinates on previous axis
                            gridTo[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] 
                        
                            # End coordinate on next axis
                            gridTo[[ ax ]][, axNext ] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axPrev ]
                        }else{ 
                            # End coordinates on previous axis
                            gridTo[[ ax ]][, axNext ] <- tScale[ "min", axNext ] - ticksShift * fracSum  
                        
                            # End coordinate on next axis
                            gridTo[[ ax ]][, axPrev ] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axNext ]
                        }   
                    }   
                    
                # Axis is counter-clockwise
                }else{ 
                    nextClock <- ifelse( 
                        is.na( blrClock[ axNext ] ), 
                        TRUE, 
                        blrClock[ axNext ] 
                    )   
                    
                    prevClock <- ifelse( 
                        is.na( blrClock[ axPrev ] ), 
                        TRUE, 
                        blrClock[ axPrev ] 
                    )   

                    # Next axis is clockwise
                    if( nextClock ){ 
                        # Start coordinates on next axis is 0 or min
                        gridFrom[[ ax ]][, axNext ] <- tScale[ "min", axNext ] 
                        
                        # Start coordinates on previous axis
                        gridFrom[[ ax ]][, axPrev ] <- 
                            fracSum - 
                            gridFrom[[ ax ]][, ax ] - 
                            gridFrom[[ ax ]][, axNext ]

                        if( !ticks ){ 
                            # End coordinates on previous axis
                            gridTo[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] 

                            # End coordinate on next axis
                            gridTo[[ ax ]][, axNext ] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axPrev ]
                        }else{ 
                            # End coordinates on previous axis
                            gridTo[[ ax ]][, axNext ] <- tScale[ "min", axNext ] - ticksShift * fracSum  

                            # End coordinate on next axis
                            gridTo[[ ax ]][, axPrev ] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axNext ]
                        }   
                    
                    # Next axis is counter-clockwise too (or NA?)
                    }else{ 
                        # Start coordinates on previous axis is 0 or min
                        gridFrom[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] 
                        
                        # Start coordinates on next axis
                        gridFrom[[ ax ]][, axNext ] <- 
                            fracSum - 
                            gridFrom[[ ax ]][, ax ] - 
                            gridFrom[[ ax ]][, axPrev ]

                        if( !ticks ){ 
                            # End coordinates on next axis
                            gridTo[[ ax ]][, axNext ] <- tScale[ "min", axNext ] 

                            # End coordinate on previous axis
                            gridTo[[ ax ]][, axPrev] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axNext ]
                        }else{ 
                            # End coordinates on next axis
                            gridTo[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] - ticksShift * fracSum 

                            # End coordinate on previous axis
                            gridTo[[ ax ]][, axNext ] <- 
                                fracSum - 
                                gridTo[[ ax ]][, ax ] - 
                                gridTo[[ ax ]][, axPrev ] 
                        }   
                    }   
                }  
            
            }else{  ## axis orientation is NA
                gridFrom[[ ax ]] <- data.frame() 
                gridTo[[ ax ]]   <- data.frame()  
            }   
        }   
        
        # Format the output
        out <- list( 
            "from" = gridFrom, 
            "to"   = gridTo 
        )   
        
        return( out ) 
    }   
)   




#'Draw axis' tick marks on a triangle plot
#'
#'Draw axis' tick marks on a triangle plot
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@return
#'  Invisibly returns a list of \code{data.frame} 
#'  with the start and end points of the grid segments 
#   for each of the 3 axis.
#'
#' 
#'@rdname ternaryTicks-methods
#'
#'@export 
#'
#'@docType methods
#'
.ternaryTicks <- function( s, ... ){  
    standardGeneric( ".ternaryTicks" ) 
}   

rm(".ternaryTicks") 

setGeneric( ".ternaryTicks", function( s, ... ){    
    standardGeneric( ".ternaryTicks" ) 
} )    


#'@rdname ternaryTicks-methods
#'@aliases .ternaryTicks,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = ".ternaryTicks", 
    signature  = "ternarySystem", 
    definition = function( s, ... ){ 
        # Calculates the tick-marks and grid-segments position
        
        gr <- .ternaryGridBase( s = s, ticks = TRUE ) 
        
        for( ax in 1:length( gr[[ "from" ]] ) ){ 
            # Draw the tick-marks start and segments
            if( nrow( gr[[ "from" ]][[ ax ]] ) != 0 ){ 
                # ternaryPoints( 
                    # x   = gr[[ "from" ]][[ ax ]], 
                    # s   = s )  
                
                # Prevent tests
                oldPar <- tpPar( par = "testRange" )        
                tpPar  <- tpPar( testRange = FALSE ) 
                
                # Draw the grid segments
                ternarySegments( 
                    from = gr[[ "from" ]][[ ax ]], 
                    to   = gr[[ "to" ]][[ ax ]], 
                    s    = s ) 
                
                # TO DO: ADD A TEXT LABEL 
                
                # Set test again
                tpPar( par = oldPar )
            }   
        }   
        
        return( invisible( gr ) ) 
    }   
)   




#'Draw a triangular grid on a triangle plot
#'
#'Draw a triangular grid on a triangle plot
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@return
#'  Invisibly returns a list of \code{data.frame} 
#'  with the start and end points of the grid segments 
#   for each of the 3 axis.
#'
#' 
#'@rdname ternaryGrid-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryGrid <- function( s, ... ){  
    standardGeneric( "ternaryGrid" ) 
}   

rm("ternaryGrid") 

setGeneric( "ternaryGrid", function( s, ... ){    
    standardGeneric( "ternaryGrid" ) 
} )   


#'@rdname ternaryGrid-methods
#'@aliases ternaryGrid,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryGrid", 
    signature  = "ternarySystem", 
    definition = function( s, ... ){ 
        # Calculates the tick-marks and grid-segments position
        gr <- .ternaryGridBase( s = s ) 

        for( ax in 1:length( gr[[ "from" ]] ) ){ 
            if( nrow( gr[[ "from" ]][[ ax ]] ) != 0 ){ 
                # Draw the grid segments
                ternarySegments( 
                    from = gr[[ "from" ]][[ ax ]], 
                    to   = gr[[ "to" ]][[ ax ]], 
                    s    = s, 
                    col  = "lightgray" ) 
            }   
        }   
        
    }   
)   




#'Generic function for drawing a ternary plot
#'
#'Generic function for drawing a ternary plot
#'
#'
#'@usage 
#'  \S4method{ternaryPlot}{data.frame}( x, s = "default", scale = FALSE, \dots ) 
#'
#'  \S4method{ternaryPlot}{matrix}( x, s = "default", scale = FALSE, \dots ) 
#'
#'  \S4method{ternaryPlot}{missing}( x, s = "default", scale = FALSE, \dots ) 
#'
#'
#'@param x 
#'  A \code{\link[base]{data.frame}} or a \code{\link[base]{matrix}} 
#'  containing point ternary data (x-y-x) to be ploted on the graph. 
#'  It should contain the 3 columns names given in \code{s}. If 
#'  missing, only the ternary classification is drawn.
#'
#'@param s 
#'  Either a character string naming the ternary classification 
#'  system to be used (if pre-defined) or a  
#'  \code{\linkS4class{ternarySystem}} object.
#'
#'@param scale 
#'  Either a logical value or a \code{\link[base]{data.frame}} with 
#'  3 columns and 2 rows. If \code{TRUE}, the triangle plot will 
#'  be scaled to fit the data. If \code{FALSE}, no scaling is 
#'  performed, and the full extent triangle plot is drawn. If a 
#'  \code{data.frame}, contains the min and max limits of each 
#'  of the 3 variables (columns = variables, rows = min and max).
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@rdname ternaryPlot-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryPlot <- function( 
    x, 
    s = "default", 
    scale = FALSE, 
    ... 
){  
    standardGeneric( "ternaryPlot" ) 
}   

rm("ternaryPlot") 

setGeneric( 
    "ternaryPlot", 
    function( 
        x, 
        s = "default", 
        scale = FALSE, 
        ... 
    ){    
        standardGeneric( "ternaryPlot" ) 
    }   
)   

# showMethods("ternaryPlot")




#'@rdname ternaryPlot-methods
#'@aliases ternaryPlot,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "ternaryPlot", 
    signature  = "data.frame",  
    definition = function( x, s = "default", scale = FALSE, ... ){ 
        testRange <- getTpPar( par = "testRange" ) 
        testSum   <- getTpPar( par = "testSum" ) 
        
        
        # Set the value for s
        # if( missing( s ) ){ s <- "default" } 
        
        if( is.character( s ) ){ 
            s <- ternarySystemGet( s = s ) 
        }   
        
        if( !is( s, "ternarySystem" ) ){ 
            stop( "'s' must be a 'character' or a 'ternarySystem' object" ) 
        }   
        
        
        # Plot something:
        ternaryWindow( s = s ) 
        .ternaryTicks( s = s ) 
        ternaryGrid( s = s ) 
        ternaryBox( s = s ) 
        try( .ternaryAxisArrows( s = s ) ) 
        
        
        if( nrow( x ) >= 1 ){ 
            message( "Method (data.frame,ternarySystem) not implemented yet" ) 
        }   
        
        return( invisible( s ) ) 
    } 
)   


#'@rdname ternaryPlot-methods
#'@aliases ternaryPlot,matrix-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f = "ternaryPlot", 
    signature = signature( 
        x = "matrix" 
    ), 
    definition = function( x, s = "default", scale = FALSE, ... ){ 
        x <- as.data.frame( x )
        
        ternaryPlot( x = x, s = s, ... )
    } 
)   


#'@rdname ternaryPlot-methods
#'@aliases ternaryPlot,missing-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f = "ternaryPlot", 
    signature = signature( 
        x = "missing" 
    ), 
    definition = function( x, s = "default", scale = FALSE, ... ){ 
        # Set the value for s
        # if( missing( s ) ){ s <- "default" } 
        
        if( is.character( s ) ){ 
            s <- ternarySystemGet( s = s ) 
        }   
        
        if( !is( s, "ternarySystem" ) ){ 
            stop( "'s' must be a 'character' or a 'ternarySystem' object" ) 
        }   
        
        
        # Create an empty data frame of point-data
        x <- data.frame(
            "B" = numeric(0), 
            "L" = numeric(0), 
            "R" = numeric(0)  
        )    
        colnames( x ) <- blrNames( s = s )  
        
        ternaryPlot( x = x, s = s, ... )
    } 
)   


#'INTERNAL: Find optimal axis limits for a ternary plot.
#'
#'INTERNAL: Find optimal axis limits for a ternary plot.
#'
#'
#'@usage
#'  \S4method{ternaryLims}{data.frame}( x, s = "default", \dots ) 
#'
#'  \S4method{ternaryLims}{matrix}( x, s = "default", \dots ) 
#'
#'
#'@param x 
#'  A \code{\link[base]{data.frame}} or a \code{\link[base]{matrix}} 
#'  containing point ternary data (x-y-x) to be ploted on the graph. 
#'  It should contain the 3 columns names given in \code{s};
#'
#'@param s 
#'  Either a character string naming the ternary classification 
#'  system to be used (if pre-defined) or a  
#'  \code{\linkS4class{ternarySystem}} x.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'
#'@return 
#'  Returns a \code{\link[base]{data.frame}} with 3 columns (bottom, 
#'  left and right variables) and 2 rows: the minimun value and the 
#'  maximum value of each variable.
#'
#'
#'@rdname ternaryLims-methods
#'
#'@export 
#'
#'@docType methods
#'
#'@keywords internal
#'
ternaryLims <- function( 
    x, 
    s = "default", 
    ... 
){    
    standardGeneric( "ternaryLims" ) 
}   

rm("ternaryLims") 

setGeneric( 
    "ternaryLims", 
    function( 
        x, 
        s = "default", 
        ... 
    ){    
        standardGeneric( "ternaryLims" ) 
    }   
)   

# showMethods("ternaryLims")


#'@rdname ternaryLims-methods
#'@aliases ternaryLims,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f = "ternaryLims", 
    signature = signature( 
        x = "data.frame" 
    ), 
    definition = function( x, s = "default", ... ){ 
        # Set the value for s
        if( missing( s ) ){ s <- "default" } 
        
        if( is.character( s ) ){ 
            s <- ternarySystemGet( s = s ) 
        }   
        
        if( !is( s, "ternarySystem" ) ){ 
            stop( "'s' must be a 'character' or a 'ternarySystem' x" ) 
        }   
               
        
        # Fetch the variable names
        blrNames0 <- blrNames( s = s )  
        
        # Extract the variables
        x <- x[, blrNames0 ] 
        
        # x <- data.frame( "B" = runif(10,1,2), "L" = runif(10,1,2), "R" = runif(10,1,2) )

        # Find the minimum and maximum of each of the 3 axis
        blrMin <- apply( X = x, MARGIN = 2, FUN = min ) 
        blrMax <- apply( X = x, MARGIN = 2, FUN = max ) 

        # Round the values to the nearest upper / lower value
        # NB: only works because values are positive
        blrMin <- floor( x = blrMin * 10 ) / 10 
        blrMax <- ceiling( x = blrMax * 10 ) / 10 

        # Find the range of values
        blrRange <- blrMin - blrMax

        # Difference between axis range and max axis range
        blrRangeDiff <- max(blrRange) - blrRange 

        # Correct the min and max to obtain equilateral triangle
        blrMin <- blrMin - blrRangeDiff 
        blrMax <- blrMax + blrRangeDiff 
        rm( blrRange, blrRangeDiff ) 

        blrLims <- as.data.frame( rbind( blrMin, blrMax ) )
        rownames( blrLims ) <- c("min","max") 
        colnames( blrLims ) <- blrNames0 
        
        # all( unlist( lapply( X = 1:3, FUN = function(X){ all(x[,X] >= blrLims[1,X]) } ) ) )  
        # all( unlist( lapply( X = 1:3, FUN = function(X){ all(x[,X] <= blrLims[2,X]) } ) ) ) 
        
        return( blrLims )
    }   
)   


#'@rdname ternaryLims-methods
#'@aliases ternaryLims,matrix-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f = "ternaryLims", 
    signature = signature( 
        x = "matrix" 
    ), 
    definition = function( x, s = "default", ... ){ 
        x <- as.data.frame( x ) 
        
        ternaryLims( x = x, s = s, ... ) 
    }   
)   




#'Converts angles expressed in degrees into radian.
#'
#'Converts angles expressed in degrees into radian.
#'
#'@param angle
#'  Single numeric. Angle in Degrees.
#'
deg2rad <- function(
    angle
){  
    (pi/180)*angle
}   




#'Converts ternary point-data into x-y coordinates
#'
#'Converts ternary point-data (bottom, left, right axis) into 
#'  x-y coordinates, according to the specification of a 
#'  \code{\linkS4class{ternarySystem}}
#'
#'
#'@usage
#'  \S4method{blr2xy}{data.frame}( x, s = "default", \dots ) 
#'
#'  \S4method{blr2xy}{matrix}( x, s = "default", \dots ) 
#'
#'@param x
#'  A \code{\link[base]{data.frame}} or a \code{\link[base]{matrix}} 
#'  with ternary point-data.
#'
#'@param s
#'  A \code{\linkS4class{ternarySystem}} object or a character string 
#'  naming an pre-defined \code{ternarySystem}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'
#'@return 
#'  Returns a \code{\link[base]{data.frame}} with point-data in 
#'  (columns) x and y. 
#'
#'
#'@rdname blr2xy-methods
#'
#'@export 
#'
#'@docType methods
#'
blr2xy <- function( 
    x, 
    s = "default", 
    ... 
){  
    standardGeneric( "blr2xy" ) 
}   

rm("blr2xy") 

setGeneric( 
    "blr2xy", 
    function( 
        x, 
        s = "default", 
        ... 
    ){    
        standardGeneric( "blr2xy" ) 
    }   
)   

# showMethods("blr2xy")


#'@rdname blr2xy-methods
#'@aliases blr2xy,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f = "blr2xy", 
    signature = signature( 
        x = "data.frame" 
    ), 
    definition = function( x, s = "default", ... ){ 
        # Set the value for s
        if( missing( s ) ){ s <- "default" } 
        
        if( is.character( s ) ){ 
            s <- ternarySystemGet( s = s ) 
        }   
        
        if( !is( s, "ternarySystem" ) ){ 
            stop( "'s' must be a 'character' or a 'ternarySystem' x" ) 
        }   
        
        
        # Set some variables
        blrClock   <- s@'ternaryGeometry'@'blrClock' 
        tlrAngles  <- s@'ternaryGeometry'@'tlrAngles' 
        fracSum    <- s@'ternaryGeometry'@'fracSum' 
        # fracSumTol <- getTpPar( par = "fracSumTol" ) * fracSum 
        
        blrNames0   <- blrNames( s = s )  
        
        
        # Test if the ternary data are conform
        ternaryDataTest( 
            s         = s, 
            x         = x, 
            testRange = getTpPar( par = "testRange" ), 
            testSum   = getTpPar( par = "testSum" ) ) 
        
        
        # Angle transformation: degree to radian
        tlrAnglesRad <- deg2rad( angle = tlrAngles )
        
        
        # "reverse" the bottom and right orientation to 
        #   fit x and y orientation:
        for( j in 1:3 ){ 
            if( !is.na(blrClock[j]) ){ # Do not reverse NA sides
                if( j == 2 ){ # Left side 
                    if( !blrClock[j] ){ # Counter-clockwise
                        x[  , blrNames0[j] ] <- 
                            ( fracSum - x[, blrNames0[j] ] ) 
                    }   
                }else{        # Bottom or right side
                    if( blrClock[j] ){ # Clockwise
                        x[  , blrNames0[j] ] <- 
                            ( fracSum - x[, blrNames0[j] ] ) 
                    }   
                }   
            }   
        }   
         
        
        # The x,y coordnates calculation is 1st separated depending on blrClock[2]
        if( is.na( blrClock[2] ) ){ 
            # Left side direction is NA so right side is counter-clockwise:
            y <- x[  , blrNames0[3] ] * sin( tlrAnglesRad[3] )
        }else if( blrClock[2] ){ 
            # Left side direction is clockwise:
            y <- x[  , blrNames0[2] ] * sin( tlrAnglesRad[2] )
        }else{       
            # Left side direction counter-clockwise:
            y <- x[  , blrNames0[3] ] * sin( tlrAnglesRad[3] )
        }   
        
        if( blrClock[1] ){ 
            # Bottom side is clockwise
            #   If blrClock[2] this is the TTT case, otherwie this is the TXF case.
            x <- x[  , blrNames0[1] ] - y/tan( tlrAnglesRad[3] ) 
        }else{            
            # Bottom side is counter-clockwise
            #   If blrClock[2] this is the FTX case, otherwise this is the FFF case.
            x <- x[  , blrNames0[1] ] + y/tan( tlrAnglesRad[2] ) 
        }   
        
        return( data.frame( "x" = x , "y" = y ) )
    }   
)   


#'@rdname blr2xy-methods
#'@aliases blr2xy,matrix-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f = "blr2xy", 
    signature = signature( 
        x = "matrix" 
    ), 
    definition = function( x, s = "default", ... ){ 
        x <- as.data.frame( x ) 
        
        blr2xy( x = x, s = s, ... ) 
    }   
)   


# library( "ternaryplot" ) 

# f1 <- runif( 10, 0, 1 ) 
# f2 <- runif( 10, 0, 1 ) 
# f3 <- runif( 10, 0, 1 ) 

# f1b <- f1 / (f1 + f2 +f3) 
# f2b <- f2 / (f1 + f2 +f3) 
# f3b <- f3 / (f1 + f2 +f3) 
# rm( f1, f2, f3 ) 

# tbl <- data.frame( "F1" = f1b, "F2" = f2b, "F3" = f3b ) * 100  # 100%
# rm( f1b, f2b, f3b ) 
# ternaryDataTest( tbl )

# tbl <- blr2xy( x = tbl ) 

# fr <- data.frame( 
    # "F1" = c( 100, 000, 000 ), 
    # "F2" = c( 000, 100, 000 ), 
    # "F3" = c( 000, 000, 100 ) )

# fr <- blr2xy( x = fr, "default" ) 

# plot( x = 50, y = 50, xlim = c(0,100), ylim = c(0,100), 
    # type = "n", bty = "n" )  

# polygon( x = fr$"x", y = fr$"y", border = "red" )  

# points( x = tbl$"x", y = tbl$"y" ) 




# ==================== blrNames ==================== 

#'Set or get the bottom-left-right axis names of a ternarySystem 
#'  object 
#'
#'Set or get the bottom-left-right axis names of a 
#'  \code{\linkS4class{ternarySystem}} object
#'
#'
#'@usage
#'  \S4method{blrNames}{ternarySystem}( s, \dots ) 
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value 
#'  A vector of 3 character strings. Names of the 
#'  bottom-left-right axis.
#'
#' 
#'@rdname blrNames-methods
#'
#'@export 
#'
#'@docType methods
#'
blrNames <- function( s, ... ){  
    standardGeneric( "blrNames" ) 
}   

rm("blrNames") 

setGeneric( "blrNames", function( s, ... ){    
    standardGeneric( "blrNames" ) 
} )    


#'@rdname blrNames-methods
#'@aliases blrNames,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "blrNames", 
    signature  = "ternarySystem", 
    definition = function( s, ... ){  
        return( s@'ternaryVariables'@'blrNames' ) 
    }   
)   


#'@rdname blrNames-methods
#'
#'@usage
#'  \S4method{blrNames}{ternarySystem}( s, \dots ) <- value
#'
#'@export 
#'
#'@docType methods
#'
`blrNames<-` <- function( s, ..., value ){  
    standardGeneric( "blrNames<-" ) 
}   

rm("blrNames<-") 

setGeneric( "blrNames<-", function( s, ..., value ){    
    standardGeneric( "blrNames<-" ) 
} )    


#'@rdname blrNames-methods
#'@aliases blrNames<-,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "blrNames<-", 
    signature  = "ternarySystem", 
    definition = function( s, ..., value ){ 
        s@'ternaryVariables'@'blrNames' <- value 

        # Change the column names in vertices
        vertices <- s@'vertices' 
        colnames( vertices ) <- c( colnames( vertices )[1], value )  
        s@'vertices' <- vertices 
        
        # Change the column names in scale
        scale <- s@'scale' 
        colnames( scale ) <- value 
        s@'scale' <- scale 
        
        validObject( object = s@'ternaryVariables' ) 
        validObject( object = s )
        
        return( s ) 
    }   
)   




# ==================== blrClock ==================== 

#'Set or get the bottom-left-right orientation of a ternarySystem 
#'  object
#'
#'Set or get the bottom-left-right orientation of a 
#'  \code{\linkS4class{ternarySystem}} object
#'
#'
#'@usage
#'  \S4method{blrClock}{ternarySystem}( x, \dots ) 
#'
#'
#'@param x 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value 
#'  A vector of 3 logical values. Bottom-left-right orientation of 
#'  a ternarySystem object.
#'
#' 
#'@rdname blrClock-methods
#'
#'@export 
#'
#'@docType methods
#'
blrClock <- function( x, ... ){  
    standardGeneric( "blrClock" ) 
}   

rm("blrClock") 

setGeneric( "blrClock", function( x, ... ){    
    standardGeneric( "blrClock" ) 
} )    


#'@rdname blrClock-methods
#'@aliases blrClock,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "blrClock", 
    signature  = "ternarySystem", 
    definition = function( x, ... ){  
        return( x@'ternaryGeometry'@'blrClock' ) 
    }   
)   


#'@rdname blrClock-methods
#'
#'@usage
#'  \S4method{blrClock}{ternarySystem}( x, \dots ) <- value
#'
#'@export 
#'
#'@docType methods
#'
`blrClock<-` <- function( x, ..., value ){  
    standardGeneric( "blrClock<-" ) 
}   

rm("blrClock<-") 

setGeneric( "blrClock<-", function( x, ..., value ){    
    standardGeneric( "blrClock<-" ) 
} )    


#'@rdname blrClock-methods
#'@aliases blrClock<-,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "blrClock<-", 
    signature  = "ternarySystem", 
    definition = function( x, ..., value ){ 
        x@'ternaryGeometry'@'blrClock' <- value 
        
        validObject( object = x@'ternaryGeometry' )     
        
        return( x ) 
    }   
)   



# ==================== ternaryClockSwitch ==================== 

#'INTERNAL. Fetch a pre-defined ternary classification system
#'
#'INTERNAL. Fetch a pre-defined ternary classification system
#'
#'
#'@param s 
#'  Single character string. Name of the ternary classification to 
#'  be fetched.
#'
#'
#'@return 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'
#'@export 
#'
#'@keywords internal
#'
ternaryClockSwitch <- function( 
 s, 
 ttt, 
 txf, 
 ftx, 
 fff 
){  
    if( is.character( s ) ){ 
        s <- ternarySystemGet( s )
    }   
    
    vBlrClock <- blrClock( s )
    
    if(         all( vBlrClock == c( TRUE,  TRUE,  TRUE ) ) ){ 
        out <- ttt 
    }else if(   all( vBlrClock == c( TRUE,  NA,    FALSE ) ) ){ 
        out <- ttt 
    }else if(   all( vBlrClock == c( FALSE, TRUE,  NA ) ) ){ 
        out <- ftx 
    }else if(   all( vBlrClock == c( FALSE, FALSE, FALSE ) ) ){ 
        out <- fff 
    }else{ 
        stop( "unknown value for blrClock( s ): %s", 
            paste( vBlrClock, collapse = ", " )  ) 
    }   
    
    return( out ) 
}   



# ==================== fracSum ==================== 

#'Set or get the sum of the three fractions of a ternarySystem 
#'  object
#'
#'Set or get the sum of the three fractions of a 
#'  \code{\linkS4class{ternarySystem}} object
#'
#'
#'@usage
#'  \S4method{fracSum}{ternarySystem}( x, \dots ) 
#'
#'
#'@param x 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  Single numerical value. Sum of the three fractions of the 
#'  ternarySystem.
#'
#' 
#'@rdname fracSum-methods
#'
#'@export 
#'
#'@docType methods
#'
fracSum <- function( x, ... ){  
    standardGeneric( "fracSum" ) 
}   

rm("fracSum") 

setGeneric( "fracSum", function( x, ... ){    
    standardGeneric( "fracSum" ) 
} )    


#'@rdname fracSum-methods
#'@aliases fracSum,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "fracSum", 
    signature  = "ternarySystem", 
    definition = function( x, ... ){  
        return( x@'ternaryGeometry'@'fracSum' ) 
    }   
)   



#'@rdname fracSum-methods
#'
#'@usage
#'  \S4method{fracSum}{ternarySystem}( x, \dots ) <- value
#'
#'@export 
#'
#'@docType methods
#'
`fracSum<-` <- function( x, ..., value ){  
    standardGeneric( "fracSum<-" ) 
}   

rm("fracSum<-") 

setGeneric( "fracSum<-", function( x, ..., value ){    
    standardGeneric( "fracSum<-" ) 
} )    


#'@rdname fracSum-methods
#'@aliases fracSum<-,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "fracSum<-", 
    signature  = "ternarySystem", 
    definition = function( x, ..., value ){ 
        x@'ternaryGeometry'@'fracSum' <- value 
        
        validObject( object = x@'ternaryGeometry' )     
        
        return( x ) 
    }   
)   




# ==================== tlrAngles ==================== 

#'Set or get the top, left and right angles of a ternary system 
#'  object
#'
#'Set or get the top, left and right angles of a 
#'  \code{\linkS4class{ternarySystem}} object
#'
#'
#'@usage
#'  \S4method{tlrAngles}{ternarySystem}( x, \dots ) 
#'
#'
#'@param x 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  Vector of three numerical values, summing to 180. Top, left 
#'  and right angles of the ternary system object.
#'
#' 
#'@rdname tlrAngles-methods
#'
#'@export 
#'
#'@docType methods
#'
tlrAngles <- function( x, ... ){  
    standardGeneric( "tlrAngles" ) 
}   

rm("tlrAngles") 

setGeneric( "tlrAngles", function( x, ... ){    
    standardGeneric( "tlrAngles" ) 
} )    


#'@rdname tlrAngles-methods
#'@aliases tlrAngles,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "tlrAngles", 
    signature  = "ternarySystem", 
    definition = function( x, ... ){  
        return( x@'ternaryGeometry'@'tlrAngles' ) 
    }   
)   



#'@rdname tlrAngles-methods
#'
#'@usage
#'  \S4method{tlrAngles}{ternarySystem}( x, \dots ) <- value
#'
#'@export 
#'
#'@docType methods
#'
`tlrAngles<-` <- function( x, ..., value ){  
    standardGeneric( "tlrAngles<-" ) 
}   

rm("tlrAngles<-") 

setGeneric( "tlrAngles<-", function( x, ..., value ){    
    standardGeneric( "tlrAngles<-" ) 
} )    


#'@rdname tlrAngles-methods
#'@aliases tlrAngles<-,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod(
    f          = "tlrAngles<-", 
    signature  = "ternarySystem", 
    definition = function( x, ..., value ){ 
        x@'ternaryGeometry'@'tlrAngles' <- value 
        
        validObject( object = x@'ternaryGeometry' )     
        
        return( x ) 
    }   
)   




# ==================== setValidity ternarySystem ==================== 

setValidity( 
    Class  = "ternarySystem", 
    method = function(object){ 
        msg <- character(0) 
        
        # Check the title (main):
        if( length( object@'main' ) != 1 ){ 
            msg <- "'length( main )' must be 1 values" 
        }   
        
        if( !all(class( object@'main' ) %in% c( "character", "expression" )) ){ 
            msg <- c( msg, "'class( main )' must be 'character' or 'expression'" )  
        }   
        
        
        ## Check the ternary point data in the vertices
        ternaryDataTest( # TO BE DONE: should return a message
            s = object, 
            x = object@'vertices'  
        )   
        
        
        ## Check the ternary point data in the scale
        scale    <- object@'scale' 
        blrNames0 <- blrNames( s = object )  

        if( ncol( scale ) != 3 ){ 
            msg <- c( msg, sprintf( "'scale' must have 3 columns. Found", ncol(scale) ) ) 
            
        }else if( nrow( scale ) != 2 ){ 
            msg <- c( msg, sprintf( "'scale' must have 2 rows (min - max). Found", nrow(scale) ) ) 
            
        }else{
            testDiff <- as.numeric( scale[2,] - scale[1,] ) 
            testDiff <- all( testDiff == testDiff[1] ) 

            if( any( !testDiff ) ){  
                msg <- c( msg, "In 'scale', the difference between min and max must be identical" ) 
            }   
        }    

        if( !all( colnames(scale) %in% blrNames0 ) ){
            msg <- c( msg, "Column names in 'scale' must be consistent with 'blrNames' in 'ternaryGeometry'" )   
        }   
        
        
        ## Check the classes
        
        # Column names:
        if( !all( c("abbrev","name","verticesId") %in% colnames( object@'classes' ) ) ){ 
            msg <- c( msg, "colnames( object@'classes' ) should contain 'abbrev', 'name' and 'verticesId'" )  
        }else{ 
            # Vertices in verticesId
            if( class( object@'classes'[,'verticesId'] ) != "AsIs" ){ 
                msg <- c( msg, "class( object@'classes' ) should be 'AsIs'" )   
            }   
            
            # Values in verticesId
            verticesId <- unlist( object@'classes'[,'verticesId'] ) 
            names( verticesId ) <- NULL 
            
            if( !all( verticesId %in% object@'vertices'[, 'id' ] ) ){ 
                msg <- c( msg, "Some id in classes[,'verticesId'] are missing in vertices[, 'id' ]" )    
            }   
            
            if( !all( object@'vertices'[, 'id' ] %in% verticesId  ) ){ 
                msg <- c( msg, "Some id in vertices[, 'id' ] are missing in classes[,'verticesId']" )    
            }   
        }   
        
        
        if( length(msg) == 0 ){ 
            out <- TRUE 
        }else{ 
            out <- msg 
        }   
        
        return( out ) 
    }   
)   




# ==================== setValidity ternaryGeometry ==================== 

setValidity( 
    Class = "ternaryGeometry", 
    method = function(object){ 
        msg <- character(0) 
        
        if( length( object@'tlrAngles' ) != 3 ){ 
            msg <- "'length( tlrAngles )' must be 3" 
        }   
        
        if( sum( object@'tlrAngles' ) != 180 ){ 
            msg <- c( msg, "'sum( tlrAngles )' must be 180 (degrees)" ) 
        }   
        
        fracSum <- object@'fracSum' 
        
        if( length( fracSum ) != 1 ){ 
            msg <- c( msg, "'length( fracSum )' must be 1" ) 
        }   
        
        if( !(fracSum %in% c(1,100)) ){ 
            msg <- c( msg, "'fracSum' must be 0 or 100" ) 
        }   
        
        
        ## Check that blrClock is correct
        blrClock <- object@'blrClock' 
        
        ok.clock <- list( 
            #       #    Bottom Left    Right  
            "TTT"   = c( TRUE,  TRUE,   TRUE    ), 
            "FFF"   = c( FALSE, FALSE,  FALSE   ), 
            "TXF"   = c( TRUE,  NA,     FALSE   ), 
            "FTX"   = c( FALSE, TRUE,   NA      )  
           #"XFT"   = c( NA,    FALSE,  TRUE    )  # Un-tested
        )   #
        
        ok.clock <- unlist( lapply( 
            X        = ok.clock, 
            FUN      = function(X,blrClock){ 
                identical( blrClock, X ) 
            },  
            blrClock = blrClock
        ) )  
        
        if( !any(ok.clock) ){   
            msg <- c( msg, "object@blrClock is incorrect (unexpected value)" ) 
        }   
        
        
        if( length(msg) == 0 ){ 
            out <- TRUE 
        }else{ 
            out <- msg 
        }   
        
        return( out ) 
    }   
)   




# ============ ternaryText ============

#' Draw text strings (labels) on a triangle plot
#'
#' Draw text strings (labels) on a triangle plot
#'
#'
#'@seealso
#'  \code{\link[graphics]{points}}.
#'
#'
#'@param x  
#'  A \code{\link[base]{data.frame}} or a 
#'  \code{\link[base]{matrix}} containing ternary data-points, 
#'  coordinates of the text strings to be added on the plot.
#'
#'@param s  
#'  A \code{\linkS4class{ternarySystem}} object, or a 
#'  character string naming a pre-defined \code{ternarySystem}. 
#'  If missing, set to \code{default}.
#'
#'@param labels  
#'  A vector of character strings, or expressions to be added 
#'  on the triangle plot. See \code{\link[graphics]{text}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[graphics]{text}}.
#'
#' 
#'@rdname ternaryText-methods
#'
#'@export 
#'
#'@docType methods
#'
ternaryText <- function( x, labels, s, ... ){  
    standardGeneric( "ternaryText" ) 
}   

rm("ternaryText") 

setGeneric( "ternaryText", function( x, labels, s, ... ){    
    standardGeneric( "ternaryText" ) 
} )    


#'@rdname ternaryText-methods
#'@aliases ternaryText,data.frame-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryText", 
    signature  = "data.frame", 
    definition = function( x, labels, s, ... ){ 
        # Set the value for s
        if( missing( s ) ){ 
            s <- ternarySystemSet() 
        }else{ 
            s <- ternarySystemSet( s = s )    
        }   
        
        
        xy <- blr2xy( x = x, s = s ) 
        
        text( x = xy[,"x"], y = xy[,"y"], labels = labels, ... ) 
    }   
)   


#'@rdname ternaryText-methods
#'@aliases ternaryText,matrix-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = "ternaryText", 
    signature  = "matrix", 
    definition = function( x, labels, s = "default", ... ){ 
        # Transform x into a data.frame
        x <- as.data.frame( x ) 
        
        ternaryText( x = x, labels = labels, s = s, ... )
    }   
)   




# ============ .ternaryAxisArrowsBase ============

#'INTERNAL. Calculates arrows segments start and end for ternary 
#'  axis labels 
#'
#'INTERNAL. Calculates arrows segments start and end for ternary 
#'  axis labels 
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@rdname ternaryAxisArrowsBase-methods
#'
#'@export 
#'
#'@docType methods
#'
#'@keywords internal
#'
.ternaryAxisArrowsBase <- function( s, ... ){  
    standardGeneric( ".ternaryAxisArrowsBase" ) 
}   

rm(".ternaryAxisArrowsBase") 

setGeneric( ".ternaryAxisArrowsBase", function( s, ... ){    
    standardGeneric( ".ternaryAxisArrowsBase" ) 
} )    


#'@rdname ternaryAxisArrowsBase-methods
#'@aliases .ternaryAxisArrowsBase,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = ".ternaryAxisArrowsBase", 
    signature  = "ternarySystem", 
    definition = function( s, ticks = FALSE, ... ){ 
        blrNames0   <- blrNames( s = s )  
        blrClock    <- blrClock( s )  
        tScale      <- s@'scale' 
        fracSum     <- fracSum( x = s ) 
        arrowsShift <- getTpPar( "arrowsShift" ) 
        
        
        #   Note: Axis order / index is Bottom -> Left -> Right
        #   This order is cyclic: after Right comes left
        #   before Bottom, comes Right    
        
        
        #   Min and max extent of each axis
        bAxisRange <- c( tScale[ "min", 1 ], tScale[ "max", 1 ] ) 
        bAxisRange[3] <- diff( bAxisRange ) # Width
        
        lAxisRange <- c( tScale[ "min", 2 ], tScale[ "max", 2 ] ) 
        lAxisRange[3] <- diff( lAxisRange ) # Width
        
        rAxisRange <- c( tScale[ "min", 3 ], tScale[ "max", 3 ] ) 
        rAxisRange[3] <- diff( rAxisRange ) # Width
        
        
        #   Pre-format a quadrilateral polygon on which the 
        #   axis arrows and arrow labels will be drawn
        #   Note: the arrow will be drawn on vertices 1 -> 2 -> 
        #   3. Point 4 is for anchoring the axis label
        bArrows <- data.frame( 
            "B" = c( 
                bAxisRange[1] + bAxisRange[3] * 0.10, 
                bAxisRange[1] + bAxisRange[3] * 0.50, 
                bAxisRange[1] + bAxisRange[3] * 0.50, 
                bAxisRange[1] + bAxisRange[3] * 0.55 
            ),  
            "L" = rep( NA_real_, 4 ), 
            "R" = rep( NA_real_, 4 )
        )   
        colnames( bArrows ) <- blrNames0 

        lArrows <- data.frame( 
            "B" = rep( NA_real_, 4 ), 
            "L" = c( 
                lAxisRange[1] + lAxisRange[3] * 0.10, 
                lAxisRange[1] + lAxisRange[3] * 0.50, 
                lAxisRange[1] + lAxisRange[3] * 0.50, 
                lAxisRange[1] + lAxisRange[3] * 0.55 
            ),  
            "R" = rep( NA_real_, 4 )
        )   
        colnames( lArrows ) <- blrNames0 
        
        rArrows <- data.frame( 
            "B" = rep( NA_real_, 4 ), 
            "L" = rep( NA_real_, 4 ), 
            "R" = c( 
                rAxisRange[1] + rAxisRange[3] * 0.10, 
                rAxisRange[1] + rAxisRange[3] * 0.50, 
                rAxisRange[1] + rAxisRange[3] * 0.50, 
                rAxisRange[1] + rAxisRange[3] * 0.55 
            )   
        )   
        colnames( rArrows ) <- blrNames0 
        
        # Format as a list
        arroQuad <- list( # arroTo <- 
            "B" = bArrows, 
            "L" = lArrows, 
            "R" = rArrows  
        )   
        names( arroQuad ) <- blrNames0
        # names( arroTo )   <- blrNames0
        rm( bArrows, lArrows, rArrows )
        
        ## Calculate the grid-lines coordinates for each axis
        for( ax in 1:3 ){ 
            # Index of previous and next axis 
            if( ax == 1 ){ 
                axPrev <- 3 
                axNext <- 2 
            }else if( ax == 2 ){ 
                axPrev <- 1 
                axNext <- 3 
            }else if( ax == 3 ){ 
                axPrev <- 2 
                axNext <- 1 
            }   

            if( !is.na( blrClock[ ax ] ) ){ 

                # Axis is clockwise
                if( blrClock[ ax ] ){ 
                    nextClock <- ifelse( 
                        is.na( blrClock[ axNext ] ), 
                        FALSE, 
                        blrClock[ axNext ] 
                    )   
                    
                    prevClock <- ifelse( 
                        is.na( blrClock[ axPrev ] ), 
                        FALSE, 
                        blrClock[ axPrev ] 
                    )   

                    # Next axis is not clockwise or is NA
                    if( !nextClock ){ 
                        # Start coordinates on previous axis is 0 or min
                        arroQuad[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] - arrowsShift[c(2,2,1,2)] * fracSum 
                        
                        # Start coordinates on next axis
                        arroQuad[[ ax ]][, axNext ] <- 
                            fracSum - 
                            arroQuad[[ ax ]][, ax ] - 
                            arroQuad[[ ax ]][, axPrev ]
                    
                    # Next axis is clockwise too
                    }else{ 
                        # Start coordinates on next axis is 0 or min
                        arroQuad[[ ax ]][, axNext ] <- tScale[ "min", axNext ] - arrowsShift[c(2,2,1,2)] * fracSum 
                        
                        # Start coordinates on previous axis
                        arroQuad[[ ax ]][, axPrev ] <- 
                            fracSum - 
                            arroQuad[[ ax ]][, ax ] - 
                            arroQuad[[ ax ]][, axNext ]
                    }   
                    
                # Axis is counter-clockwise
                }else{ 
                    nextClock <- ifelse( 
                        is.na( blrClock[ axNext ] ), 
                        TRUE, 
                        blrClock[ axNext ] 
                    )   
                    
                    prevClock <- ifelse( 
                        is.na( blrClock[ axPrev ] ), 
                        TRUE, 
                        blrClock[ axPrev ] 
                    )   
                    
                    # Next axis is clockwise
                    if( nextClock ){ 
                        # Start coordinates on next axis is 0 or min
                        arroQuad[[ ax ]][, axNext ] <- tScale[ "min", axNext ] - arrowsShift[c(2,2,1,2)] * fracSum 
                        
                        # Start coordinates on previous axis
                        arroQuad[[ ax ]][, axPrev ] <- 
                            fracSum - 
                            arroQuad[[ ax ]][, ax ] - 
                            arroQuad[[ ax ]][, axNext ]
                    
                    # Next axis is counter-clockwise too (or NA?)
                    }else{ 
                        # Start coordinates on previous axis is 0 or min
                        arroQuad[[ ax ]][, axPrev ] <- tScale[ "min", axPrev ] - arrowsShift[c(2,2,1,1)] * fracSum 
                        
                        # Start coordinates on next axis
                        arroQuad[[ ax ]][, axNext ] <- 
                            fracSum - 
                            arroQuad[[ ax ]][, ax ] - 
                            arroQuad[[ ax ]][, axPrev ]
                    }   
                }   
                
            }else{  ## axis orientation is NA
                arroQuad[[ ax ]] <- data.frame() 
                # arroTo[[ ax ]]   <- data.frame()  
            }   
        }   
        
        # Format the output
        # out <- list( 
            # "from" = arroQuad, 
            # "to"   = arroTo 
        # )   
        
        return( arroQuad ) 
    }   
)   




# ============ .ternaryAxisArrows ============

#' INTERNAL: Draw axis' arrows and arrows' label marks on a 
#'  triangle plot
#'
#' INTERNAL: Draw axis' arrows and arrows' label marks on a 
#'  triangle plot
#'
#'
#'@param s 
#'  A \code{\linkS4class{ternarySystem}} object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#' 
#'@return
#'  Invisibly returns a list of \code{data.frame} 
#'  with the start and end points of the arrows segments 
#   for each of the 3 axis.
#'
#' 
#'@rdname ternaryAxisArrows-methods
#'
#'@export 
#'
#'@docType methods
#'
#'@keywords internal
#'
.ternaryAxisArrows <- function( s, ... ){  
    standardGeneric( ".ternaryAxisArrows" ) 
}   

rm(".ternaryAxisArrows") 

setGeneric( ".ternaryAxisArrows", function( s, ... ){    
    standardGeneric( ".ternaryAxisArrows" ) 
} )    


#'@rdname ternaryAxisArrows-methods
#'@aliases .ternaryAxisArrows,ternarySystem-method
#'
#'@export 
#'
#'@docType methods
#'
setMethod( 
    f          = ".ternaryAxisArrows", 
    signature  = "ternarySystem", 
    definition = function( s, ... ){ 
        # Calculates the tick-marks and grid-segments position
        
        gr <- .ternaryAxisArrowsBase( s = s ) 
        
        tlrAnglez       <- tlrAngles( x = s ) 
        blrLabelAngles  <- c( 0, tlrAnglez[2], tlrAnglez[3] ) 
        
        # Change sign for the case when blrClock(s) is not TRUE NA FALSE
        if( !is.na( blrClock(s)[2] ) ){ 
            blrLabelAngles[3] <- -blrLabelAngles[3]
        }   
        
        
        #   Chose the right adjustment
        adj <- ternaryClockSwitch( 
            s   = s, 
            ttt = c( 1, 0, 0 ), 
            txf = c( 1, 1, 0 ), 
            ftx = c( 0, 0, 0 ), 
            fff = c( 0, 1, 1 ) 
        )   
        
        
        for( ax in 1:length( gr ) ){ 
            # Draw the tick-marks start and segments
            if( nrow( gr[[ ax ]] ) != 0 ){ 
                # Prevent tests
                oldPar <- tpPar( par = "testRange" ) 
                tpPar  <- tpPar( testRange = FALSE ) 
                
                # ternaryPoints( 
                    # x   = gr[[ ax ]], 
                    # s   = s, 
                    # col = "blue" )  
                
                ternarySegments( 
                    from = gr[[ ax ]][ 1, ], 
                    to   = gr[[ ax ]][ 2, ], 
                    s    = s, 
                    ... ) 
                
                arrowsShift <- getTpPar( "arrowsShift" ) 
                
                # Draw the arrows' 2nd segments
                ternaryArrows( 
                    from   = gr[[ ax ]][ 2, ], 
                    to     = gr[[ ax ]][ 3, ], 
                    s      = s, 
                    length = diff( arrowsShift ) * 3, 
                    ... ) 
                
                # Add the axis / arrows labels
                ternaryText( 
                    x      = gr[[ ax ]][ 4, ], 
                    labels = s@'ternaryVariables'@'blrLabels'[ ax ], 
                    s      = s, 
                    # pos  = 2, 
                    adj    = c( adj[ ax ], .5 ), 
                    srt    = blrLabelAngles[ ax ], 
                    ... ) 
                
                # Set test again
                tpPar( par = oldPar )
            }   
        }   
        
        return( invisible( gr ) ) 
    }   
)   
