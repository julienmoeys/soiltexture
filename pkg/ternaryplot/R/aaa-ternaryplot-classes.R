# +-------------------------------------------------------------+
# | Language: R + roxygen2 inline documentation
# | Package: ternaryplot 
# | Author(s): Julien Moeys <Julien.Moeys@@slu.se> 
# | License: AGPL3, Affero General Public License version 3 
# +-------------------------------------------------------------+




#'Class for defining the geometry of a ternary plot
#'
#'Class for defining the geometry of a ternary plot. In this package, 
#'  ternary plots geometries are defined by the 3 triangle's angles 
#'  (top, left, right), and by the sum of the 3 fractions it 
#'  represents (1 if a fraction, and 100 if a percentage). 
#'
#' 
#'@section Slots:
#'  \describe{ 
#'    \item{\code{tlrAngles}:}{
#'      Vector of numeric. Top, left and right angle (in degrees) 
#'      of the ternary diagram. Must sum to 180 degrees.
#'    } 
#'    \item{\code{blrClock}:}{
#'      Vector of logical. Bottom, left and right axis directions. 
#'      Set to \code{TRUE} if the axis is clockwise, and to 
#'      \code{FALSE} if the axis is counter-clockwise.
#'    }
#'    \item{\code{fracSum}:}{
#'      Single numeric. Sum of the three fractions. Must be 1 (if 
#'      a fraction) or 100 (if a percentage).
#'    }
#'  }
#'
#'
#'@example inst/examples/ternaryGeometry.R
#'
#'
#'@name ternaryGeometry-class
#'
#'@exportClass ternaryGeometry
#'
setClass(
    Class = "ternaryGeometry", 
    
    representation = representation(
        tlrAngles = "numeric", 
        blrClock  = "logical", 
        fracSum   = "numeric"  
    ),   
    
    prototype = prototype(
        tlrAngles = c( 60, 60, 60 ), 
        blrClock  = rep( TRUE, 3 ), 
        fracSum   = 100 
    )   
    
    #contains = numeric(), 
    
    #validity = function(object){}
)   




#'Class for defining the variables of a ternary plot
#'
#'Class for defining the variables of a ternary plot. In this package, 
#'  ternary plots variables are defined by the 3 variables name  
#'  (bottom, left, right), as they will be found in \code{data.frame}
#'  containing ternary datasets, and by the label of these variables 
#'  on the axis of a ternary plot.
#'
#' 
#'@section Slots:
#'  \describe{ 
#'    \item{\code{blrNames}:}{
#'      Vector of characters. Bottom, left and right variable names 
#'      as they will be found in \code{data.frame} containing ternary 
#'      data.
#'    } 
#'    \item{\code{blrLabels}:}{
#'      Vector of characters or vector of expressions. Bottom, left 
#'      and right variable labels as they will be displayed on ternary 
#'      plots.
#'    }
#'  }
#'
#'
#'@example inst/examples/ternaryVariables.R
#'
#'
#'@name ternaryVariables-class
#'
#'@exportClass ternaryVariables
#'
setClass(
    Class = "ternaryVariables", 
    
    representation = representation(
        blrNames  = "character", 
        blrLabels = "vector" 
    ),   
    
    prototype = prototype(
        blrNames  = c( "F1", "F2", "F3" ), 
        blrLabels = c( "Fraction 1 [%]", "Fraction 2 [%]", "Fraction 3 [%]" )  
    ),   
    
    #contains      = numeric(), 
    
    validity      = function(object){ 
        msg <- character(0) 
        
        if( length( object@'blrNames' ) != 3 ){ 
            msg <- "'length( blrNames )' must be 3 values" 
        }   
        
        if( length( object@'blrLabels' ) != 3 ){ 
            msg <- c( msg, "'sum( blrLabels )' must be 3 values" ) 
        }   
        
        testLabelsClass <- !all( class( object@'blrLabels' ) %in% 
            c( "character", "expression", "name", "call" ) ) 
        
        if( testLabelsClass ){  
            msg <- c( msg, "'class( blrLabels )' must be 'character' or 'expression'" )  
        }   
        
        if( length(msg) == 0 ){ 
            out <- TRUE 
        }else{ 
            out <- msg 
        }   
        
        return( out ) 
    }   
)   




#'Class for defining a ternary classification
#'
#'Class for defining a ternary classification. ternary 
#'  classification are polygons drawn on top of 
#'  ternary plots, that define different zones in the 
#'  fractions
#'
#' 
#'@section Slots:
#'  \describe{ 
#'    \item{\code{ternaryGeometry}:}{
#'      An object of class \code{ternaryGeometry}. See
#'      \code{\link{ternaryGeometry-class}};
#'    } 
#'    \item{\code{ternaryVariables}:}{
#'      An object of class \code{ternaryVariables}. See
#'      \code{\link{ternaryVariables-class}};
#'    }
#'    \item{\code{main}:}{
#'      Single character string, or single 
#'     \code{\link[base]{expression}}. Title of the ternary 
#'     plot;
#'    }
#'  }
#'
#'
#'@example inst/examples/ternarySystem.R
#'
#'
#'@name ternarySystem-class
#'
#'@exportClass ternarySystem
#'
setClass(
    Class = "ternarySystem", 
    
    representation = representation(
        ternaryGeometry  = "ternaryGeometry", 
        ternaryVariables = "ternaryVariables", 
        main             = "vector", 
        vertices         = "data.frame", 
        classes          = "data.frame", 
        scale            = "data.frame"  
    ),   
    
    prototype = prototype(
        ternaryGeometry = new( "ternaryGeometry" ), 
        ternaryVariables = new( "ternaryVariables" ), 
        main = "Ternary plot", 
        vertices = data.frame( 
            "id"    = integer(0), 
            "F1"    = numeric(0), 
            "F2"    = numeric(0), 
            "F3"    = numeric(0)  
        ),  
        classes = data.frame( 
            "abbrev"     = character(0), 
            "name"       = character(0),  
            "verticesId" = I( vector( length = 0, mode = "list" ) ),
            stringsAsFactors = FALSE 
        ),  
        scale = data.frame( 
            "F1" = c( 000, 100 ),  
            "F2" = c( 000, 100 ),  
            "F3" = c( 000, 100 ), 
            row.names = c( "min", "max" ) 
        )   
    )    
    
    #contains      = numeric(), 
    
    #validity      = function(object){}
)   

