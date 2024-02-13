
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                   |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+

.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  
    # Welcome message
    if( interactive() ){ 
        msg <- sprintf( 
            "%s %s  For help type: help(pack='%s')", 
            pkgname, 
            as.character( packageVersion( pkgname ) ), 
            pkgname ) 
        
        packageStartupMessage( msg ) 
    }   
}   
