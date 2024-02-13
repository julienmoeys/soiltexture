
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                     |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+

# grconvertX
# http://stackoverflow.com/questions/29125019/get-margin-line-locations-mgp-in-user-coordinates

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
## #@param cin 
## #
## #@param cex 
## #
## #@param lheight 
## #
.nbMargin2diffXY <- function( 
 n       = 1L, 
 side    = 1L, # 1=below, 2=left, 3=above and 4=right
 cin     = par( 'cin' ), 
 cex     = par( 'cex' ), 
 lheight = par( 'lheight' ) 
){  
    if( side %in% c( 2, 4 ) ){
        out <- diff( grconvertX( x = 0:1, 'inches', 'user' ) ) 
        #   Inches to user coordinates
    
    }else{
        out <- diff( grconvertY( y = 0:1, 'inches', 'user' ) ) 
        #   Inches to user coordinates
        
    }   
    
    out <- 
        out *     # Inches to user coordinates
        cin[2] *  # Character size (height) in inches
                  # Always height, as it is about margin height
        cex *     # Character expansion
        lheight * # The line height multiplier
        n 
    
    return( out )
}   


