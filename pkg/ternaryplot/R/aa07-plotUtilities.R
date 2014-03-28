
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                     |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+



# .transfMgpTo0_1 ===============================================

## #INTERNAL: Transform margin lines, as in par('mgp'), into margin's relative coordinates (0 to 1)
## #
## #INTERNAL: Transform margin lines, as in par('mgp'), into margin's relative coordinates (0 to 1)
## #
## #
## #@param z
## #    A vector of numerical values. z-position, in number of lines within the margin
## #
## #@param side
## #    Single integer value. Margin's id 1=below, 2=left, 3=above and 4=right
## #
## #@param mar 
## #    A vector of 4 numerical values, giving the margin's size 
## #    in number of lines (bottom, left, top, right). If \code{NULL}, 
## #    \code{\link[graphics]{par}('mar')} is used.
## #
.transfMgpTo0_1 <- function( 
 z    = par( 'mgp' )[ 2 ], 
 side = 1L,             # 1=below, 2=left, 3=above and 4=right
 mar  = par( 'mar' )    # c(bottom, left, top, right)
){  
    #   Return the relative position
    return( z / mar[ side ] ) 
}   



# .transf0_1ToPlt ===============================================

## #INTERNAL: Transform margin's relative coordinates (0 to 1) into figure relative coordinates (0  to 1 too)
## #
## #INTERNAL: Transform margin's relative coordinates (0 to 1) into figure relative coordinates (0  to 1 too)
## #
## #
## #@param z
## #    A vector of numerical values. z-position, in margin's relative coordinates
## #
## #@param side
## #    Single integer value. Margin's id 1=below, 2=left, 3=above and 4=right
## #
## #@param plt 
## #    A vector of 4 numerical values, giving the coordinates of 
## #    the plot region as fractions of the current figure region.
## #    c(x1, x2, y1, y2).
## #
.transf0_1ToPlt <- function(
 z    = .5, 
 side = 1L,             # 1=below, 2=left, 3=above and 4=right
 plt  = par( 'plt' )    # c(x1, x2, y1, y2)
){  
    if( side == 1 ){            # below
        out <- plt[ 3 ] - z * plt[ 3 ]
        
    }else if( side == 3 ){      # above
        out <- plt[ 4 ] + z * (1 - plt[ 4 ]) 
        
    }else if( side == 2 ){      # left
        out <- plt[ 1 ] - z * plt[ 1 ] 
        
    }else{                      # right
        out <- plt[ 2 ] + z * (1 - plt[ 2 ]) 
        
    }   
    
    return( out )
}   



# .transfPltToXY ================================================

## #INTERNAL: Transform plot figures relative coordinates (0 to 1) into plot-region X-Y coordinates
## #
## #INTERNAL: Transform plot figures relative coordinates (0 to 1) into plot-region X-Y coordinates
## #
## #
## #@param z
## #    A vector of numerical values. z-position, in margin's relative coordinates
## #
## #@param side
## #    Single integer value. Margin's id 1=below, 2=left, 3=above and 4=right
## #
## #@param plt 
## #    A vector of 4 numerical values, giving the coordinates of 
## #    the plot region as fractions of the current figure region.
## #    c(x1, x2, y1, y2).
## #
## #@param usr 
## #    A vector of 4 numerical values, giving the extremes of the 
## #    user coordinates of the plotting region, c(x1, x2, y1, y2).
## #
.transfPltToXY <- function(
 z    = par( 'plt' )[ 1 ], 
 side = 1L,             # 1=below, 2=left, 3=above and 4=right
 plt  = par( 'plt' ),   # c(x1, x2, y1, y2)
 usr  = par( 'usr' )    # c(x1, x2, y1, y2)
){  
    if( side %in% c( 1, 3 ) ){ # below or above
        slope <- diff( usr[ 3:4 ] ) / diff( plt[ 3:4 ]  ) 
        int   <- usr[ 3 ] - slope * plt[ 3 ] 
        
    }else{ # side %in% c( 2, 4 ) 
        slope <- diff( usr[ 1:2 ] ) / diff( plt[ 1:2 ]  ) 
        int   <- usr[ 1 ] - slope * plt[ 1 ] 
        
    }   
    
    # conv <- ( par("mai") / par("mar") )[1] / par("cin")[2]
    
    return( ( z * slope + int ) / 1 ) 
}   



# .transfMgpToXY ================================================

## #INTERNAL: Transform margin lines, as in par('mgp'), into plot-region X-Y coordinates
## #
## #INTERNAL: Transform margin lines, as in par('mgp'), into plot-region X-Y coordinates
## #
## #
## #@param z
## #    A vector of numerical values. z-position, in number of lines within the margin
## #
## #@param side
## #    Single integer value. Margin's id 1=below, 2=left, 3=above and 4=right
## #
## #@param mar 
## #    A vector of 4 numerical values, giving the margin's size 
## #    in number of lines (bottom, left, top, right). If \code{NULL}, 
## #    \code{\link[graphics]{par}('mar')} is used.
## #
## #@param plt 
## #    A vector of 4 numerical values, giving the coordinates of 
## #    the plot region as fractions of the current figure region.
## #    c(x1, x2, y1, y2).
## #
## #@param usr 
## #    A vector of 4 numerical values, giving the extremes of the 
## #    user coordinates of the plotting region, c(x1, x2, y1, y2).
## #
.transfMgpToXY <- function( 
 z    = par( 'mgp' )[ 2 ], 
 side = 1L,             # 1=below, 2=left, 3=above and 4=right
 mar  = par( 'mar' ),   # c(bottom, left, top, right)
 plt  = par( 'plt' ),   # c(x1, x2, y1, y2) 
 usr  = par( 'usr' )    # c(x1, x2, y1, y2) 
){  
    z <- .transfMgpTo0_1( z = z, side = side ) # , mar = .mar
    z <- .transf0_1ToPlt( z = z, side = side, plt = plt ) 
    return( .transfPltToXY( z = z, side = side, plt = plt, usr = usr ) )
}   



# .nbMargin2diffXY ==============================================

## #INTERNAL: Transform a number of margin lines into a X or Y differences
## #
## #INTERNAL: Transform a number of margin lines into a X or Y differences
## #
## #
## #@param n
## #    A vector of numerical values. number of margin lines lines
## #
## #@param side
## #    Single integer value. Margin's id 1=below, 2=left, 3=above and 4=right
## #
## #@param mar 
## #    A vector of 4 numerical values, giving the margin's size 
## #    in number of lines (bottom, left, top, right). If \code{NULL}, 
## #    \code{\link[graphics]{par}('mar')} is used.
## #
## #@param plt 
## #    A vector of 4 numerical values, giving the coordinates of 
## #    the plot region as fractions of the current figure region.
## #    c(x1, x2, y1, y2).
## #
## #@param usr 
## #    A vector of 4 numerical values, giving the extremes of the 
## #    user coordinates of the plotting region, c(x1, x2, y1, y2).
## #
.nbMargin2diffXY <- function( 
 n    = 1L, 
 side = 1L,             # 1=below, 2=left, 3=above and 4=right
 mar  = par( 'mar' ),   # c(bottom, left, top, right)
 plt  = par( 'plt' ),   # c(x1, x2, y1, y2) 
 usr  = par( 'usr' )    # c(x1, x2, y1, y2) 
){  
    z <- .transfMgpToXY( z = 1:2, side = side, mar = mar, 
        plt = plt, usr = usr ) 
    
    return( abs( diff( z ) ) * n )
}   

    
    # # par( "mar" = c( 6, 5, 1, 1 ) + 0.1, cex = .5 )
    
    # # par( mar = c(5, 4, 4, 2) + .1, cex = 2 )
    
    # # Tests
    # plot( x = 1:10, y = 1:10 ) 
    
    # # par("cxy") / par("din")
    
    # # (par("mai") / par("mar")) 
    # # (par("mai") / par("mar"))[1] / par("cxy")[2]
    # # (par("mai") / par("mar"))[1] / par("cin")[2]
    
    # #axis( side = 3, col = "red", col.axis = "red", col.lab = "red" )
    # #axis( side = 4, col = "red", col.axis = "red", col.lab = "red" )
    
    # oPar  <- par() 
    # .mar  <- oPar$'mar' 
    # .plt  <- oPar$'plt'  
    # .usr  <- oPar$'usr' 
    
    # .nbMargin2diffXY( n = 1, side = .side, mar = .mar, 
            # plt = .plt, usr = .usr )
    
    # for( .side in 1:2 ){ 
        # # .side <- 1
        
        # print( sprintf( "side %s", .side ) )
        
        # .mgp  <- 1 
        
        # # dy <- .transfMgpTo0_1( z = .mgp, side = .side ) # , mar = .mar
        # # dy <- .transf0_1ToPlt( z = dy, side = .side, plt = .plt ) 
        # # dy <- .transfPltToXY( z = dy, side = .side, plt = .plt, usr = .usr )
        
        # # dy <- .transfMgpToXY( z = .mgp, side = .side, mar = .mar, 
            # # plt = .plt, usr = .usr )
        
        # dy <- .nbMargin2diffXY( n = 1, side = .side, mar = .mar, 
            # plt = .plt, usr = .usr )
        
        # for( .mgp in 0:3 ){  
            # # y <- .transfMgpTo0_1( z = .mgp, side = .side, mar = .mar ) 
            # # y <- .transf0_1ToPlt( z = y, side = .side, plt = .plt ) 
            # # y <- .transfPltToXY( z = y, side = .side, plt = .plt, usr = .usr )
            
            # y <- .transfMgpToXY( z = .mgp, side = .side, mar = .mar, 
                # plt = .plt, usr = .usr ) 
            
            # par( "xpd" = TRUE )
            
            # if( .side %in% c(1,3) ){ 
                # z <- .usr[ 3 ] + diff( .usr[3:4] )/2 
                
                # points( x = z, y = y - dy/2 ) # +dy/2
                # # text( x = z, y = y, label = "X", pos = 3, offset = 0 ) 
                
                # print( sprintf( "  y = %s", y ) )
            # }else{ 
                # x <- .usr[ 1 ] + diff( .usr[1:2] )/2
                
                # points( x = y - dy/2, y = z ) # +dy/2
                # # text( x = y, y = z, label = "Y", pos = 4, offset = 0 ) 
                
                # print( sprintf( "  y = %s", y ) )
            # }   
        # }   
        
        # # print( c( "x" = z, "y" = y, "dy" = dy ) ) 
    # }   


