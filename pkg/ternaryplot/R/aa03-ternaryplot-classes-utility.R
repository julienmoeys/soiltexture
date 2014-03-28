
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                   |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+



# blrNames ====================================================== 

#'Set or get the bottom-left-right axis names of a ternarySystem 
#'  object 
#'
#'Set or get the bottom-left-right axis names of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{ternaryVariables}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}.
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
blrNames <- function( s, ... ){  
    UseMethod( "blrNames" ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames ternarySystem
#'@S3method blrNames ternarySystem
blrNames.ternarySystem <- function( s, ... ){  
    return( s[[ 'ternaryVariables']][[ 'blrNames' ]] ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames ternaryVariables
#'@S3method blrNames ternaryVariables
blrNames.ternaryVariables <- function( s, ... ){  
    return( s[[ 'blrNames' ]] ) 
}   



# blrNames()<- ================================================== 

#'@rdname blrNames-methods
#'
#'@export
#'
`blrNames<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "blrNames<-" ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames<- ternarySystem
#'@S3method blrNames<- ternarySystem
`blrNames<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryVariables']][[ 'blrNames' ]] <- value 
    
    # Change the column names in vertices
    vertices <- s[[ 'vertices' ]] 
    colnames( vertices ) <- c( colnames( vertices )[1], value )  
    s[[ 'vertices' ]] <- vertices 
    
    # Change the column names in scale
    scale <- s[[ 'scale' ]] 
    colnames( scale ) <- value 
    s[[ 'scale' ]] <- scale 
    
    ternaryCheck( s, ... )
    
    return( s ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames<- ternaryVariables
#'@S3method blrNames<- ternaryVariables
`blrNames<-.ternaryVariables` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'blrNames' ]] <- value 
        
    ternaryCheck( s, ... )
    
    return( s ) 
}   



# blrLabels ====================================================== 

#'Set or get the bottom-left-right axis labels of a ternarySystem 
#'  object 
#'
#'Set or get the bottom-left-right axis labels of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{ternaryVariables}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}.
#'
#'@param value 
#'  A vector of 3 character strings. Names of the 
#'  bottom-left-right axis.
#'
#' 
#'@rdname blrLabels-methods
#'
#'@export 
#'
blrLabels <- function( s, ... ){  
    UseMethod( "blrLabels" ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels ternarySystem
#'@S3method blrLabels ternarySystem
blrLabels.ternarySystem <- function( s, ... ){  
    return( s[[ 'ternaryVariables']][[ 'blrLabels' ]] ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels ternaryVariables
#'@S3method blrLabels ternaryVariables
blrLabels.ternaryVariables <- function( s, ... ){  
    return( s[[ 'blrLabels' ]] ) 
}   



# blrLabels()<- ================================================== 

#'@rdname blrLabels-methods
#'
#'@export
#'
`blrLabels<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "blrLabels<-" ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels<- ternarySystem
#'@S3method blrLabels<- ternarySystem
`blrLabels<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryVariables']][[ 'blrLabels' ]] <- value 
    
    ternaryCheck( s, ... )
    
    return( s ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels<- ternaryVariables
#'@S3method blrLabels<- ternaryVariables
`blrLabels<-.ternaryVariables` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'blrLabels' ]] <- value 
        
    ternaryCheck( s, ... )
    
    return( s ) 
}   



# blrClock ====================================================== 

#'Set or get the bottom-left-right orientation of a ternarySystem 
#'  object
#'
#'Set or get the bottom-left-right orientation of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}.
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
blrClock <- function( 
 s, 
 ... 
){  
    UseMethod( "blrClock" ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock ternarySystem
#'@S3method blrClock ternarySystem
blrClock.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]][[ 'blrClock' ]] ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock ternaryGeometry
#'@S3method blrClock ternaryGeometry
blrClock.ternaryGeometry <- function( 
 s, 
 ... 
){  
    return( s[[ 'blrClock' ]] ) 
}   



# blrClock()<- ================================================== 

#'@rdname blrClock-methods
#'
#'@export
#'
`blrClock<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "blrClock<-" ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock<- ternarySystem
#'@S3method blrClock<- ternarySystem
`blrClock<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryGeometry' ]][[ 'blrClock' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... ) 
    
    return( s ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock<- ternaryGeometry
#'@S3method blrClock<- ternaryGeometry
`blrClock<-.ternaryGeometry` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'blrClock' ]] <- value 
    
    ternaryCheck( s, ... ) 
    
    return( s ) 
}   



# fracSum ======================================================= 

#'Set or get the sum of the three fractions of a ternarySystem 
#'  object
#'
#'Set or get the sum of the three fractions of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
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
fracSum <- function( 
 s, 
 ... 
){  
    UseMethod( "fracSum" ) 
}   
 


#'@rdname fracSum-methods
#'
#'@method fracSum ternarySystem
#'@S3method fracSum ternarySystem
fracSum.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]][[ 'fracSum' ]] ) 
}   
 


#'@rdname fracSum-methods
#'
#'@method fracSum ternaryGeometry
#'@S3method fracSum ternaryGeometry
fracSum.ternaryGeometry <- function( 
 s, 
 ... 
){  
    return( s[[ 'fracSum' ]] ) 
}   



# fracSum()<- =================================================== 

#'@rdname fracSum-methods
#'
#'@export
#'
`fracSum<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "fracSum<-" ) 
}   



#'@rdname fracSum-methods
#'
#'@method fracSum<- ternarySystem
#'@S3method fracSum<- ternarySystem
`fracSum<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){ 
    s[[ 'ternaryGeometry' ]][[ 'fracSum' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... ) 
    
    return( s ) 
}   



#'@rdname fracSum-methods
#'
#'@method fracSum<- ternaryGeometry
#'@S3method fracSum<- ternaryGeometry
`fracSum<-.ternaryGeometry` <- function( 
 s, 
 ..., 
 value 
){ 
    s[[ 'fracSum' ]] <- value 
    
    ternaryCheck( s, ... ) 
    
    return( s ) 
}   



# tlrAngles ===================================================== 

#'Set or get the top, left and right angles of a ternary system 
#'  object
#'
#'Set or get the top, left and right angles of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
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
tlrAngles <- function( 
 s, 
 ... 
){  
    UseMethod( "tlrAngles" ) 
}   



#'@rdname tlrAngles-methods
#'
#'@method tlrAngles ternarySystem
#'@S3method tlrAngles ternarySystem
tlrAngles.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]][[ 'tlrAngles' ]] ) 
}   



#'@rdname tlrAngles-methods
#'
#'@method tlrAngles ternaryGeometry
#'@S3method tlrAngles ternaryGeometry
tlrAngles.ternaryGeometry <- function( 
 s, 
 ... 
){  
    return( s[[ 'tlrAngles' ]] ) 
}   



# tlrAngles()<- ================================================= 

#'@rdname tlrAngles-methods
#'
#'@export
#'
`tlrAngles<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "tlrAngles<-" ) 
}   
 


#'@rdname tlrAngles-methods
#'
#'@method tlrAngles<- ternarySystem
#'@S3method tlrAngles<- ternarySystem
`tlrAngles<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryGeometry' ]][[ 'tlrAngles' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... )     
    
    return( s ) 
}   



#'@rdname tlrAngles-methods
#'
#'@method tlrAngles<- ternaryGeometry
#'@S3method tlrAngles<- ternaryGeometry
`tlrAngles<-.ternaryGeometry` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'tlrAngles' ]] <- value 
    
    ternaryCheck( s, ... )     
    
    return( s ) 
}   



# ternaryGeometry ===================================================== 

#'Set or get the ternaryGeometry of a ternarySystem object
#'
#'Set or get the ternaryGeometry of a \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  A \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#' 
#'@rdname ternaryGeometry-methods
#'
#'@export 
#'
ternaryGeometry <- function( 
 s, 
 ... 
){  
    UseMethod( "ternaryGeometry" ) 
}   



#'@rdname ternaryGeometry-methods
#'
#'@method ternaryGeometry ternarySystem
#'@S3method ternaryGeometry ternarySystem
ternaryGeometry.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]] ) 
}   



# ternaryGeometry()<- =========================================== 

#'@rdname tlrAngles-methods
#'
#'@export
#'
`ternaryGeometry<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "ternaryGeometry<-" ) 
}   
 


#'@rdname ternaryGeometry-methods
#'
#'@method ternaryGeometry<- ternarySystem
#'@S3method ternaryGeometry<- ternarySystem
`ternaryGeometry<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryGeometry' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... )     
    
    return( s ) 
}   



# ternaryVariables ============================================== 

#'Set or get the ternaryVariables of a ternarySystem object.
#'
#'Set or get the ternaryVariables of a \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  A \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryVariables}}.
#'
#' 
#'@rdname ternaryVariables-methods
#'
#'@export 
#'
ternaryVariables <- function( 
 s, 
 ... 
){  
    UseMethod( "ternaryVariables" ) 
}   



#'@rdname ternaryVariables-methods
#'
#'@method ternaryVariables ternarySystem
#'@S3method ternaryVariables ternarySystem
ternaryVariables.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryVariables' ]] ) 
}   



# ternaryVariables()<- ========================================== 

#'@rdname ternaryVariables-methods
#'
#'@export
#'
`ternaryVariables<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "ternaryVariables<-" ) 
}   
 


#'@rdname ternaryVariables-methods
#'
#'@method ternaryVariables<- ternarySystem
#'@S3method ternaryVariables<- ternarySystem
`ternaryVariables<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryVariables' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryVariables' ]], ... )     
    
    return( s ) 
}   

