# +-------------------------------------------------------------+
# | Language: R + roxygen2 inline documentation
# | Package: ternaryplot 
# | Author(s): Julien Moeys <Julien.Moeys@@slu.se> 
# | License: AGPL3, Affero General Public License version 3 
# +-------------------------------------------------------------+




.onAttach <- function(# Print a welcome message
### Print a welcome message.

 libname, 
### See help(".onLoad")

 pkgname
### See help(".onLoad")

){  #
    msg <- sprintf( 
        "'%s' package loaded. Type help(package='%s') for examples and help.", 
        pkgname, pkgname ) 
    
    packageStartupMessage( msg ) 
### Does not return anything.
}   #

