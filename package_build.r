
# +--------------------------------------------------------+
# | Generate package documentation pages from inline       |
# | documentation. Build, check and install package        |
# +--------------------------------------------------------+

rm(list=ls(all=TRUE)) 

prjName  <- "soiltexture"
pkgName  <- "soiltexture"
pkgDir   <- file.path( Sys.getenv(x = "rPackagesDir" ), prjName, "pkg" )
buildDir <- pkgDir

setwd( pkgDir )

# Source some utility functions (prefix: pdu_)
source( file.path( "..", "pkg_dev_utilities.fun.r" ) ) 

pdu_detach( pkgName = pkgName )



# +--------------------------------------------------------+
# | Generate package documentation pages from inline       |
# | documentation.                                         |
# +--------------------------------------------------------+

#   install.packages(c("sp","xtable"))

# Change the description file:
pdu_pkgDescription( 
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "1.5.0", 
    pkgDepends  = NULL,  
    pkgSuggests = c( "xtable" ), 
    pkgImports  = c( "sp", "MASS", "tools", "tcltk", "utils" ), 
    RVersion    = NULL   
)   


    # install.packages("devtools")
    # devtools::install_github("tdhock/inlinedocs")

inlinedocs::package.skeleton.dx( # R version 3.2.0 (2015-04-16), with inlinedocs 2015.06.19 (installed from GitHub)
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = FALSE # Must be edited manually!  
)   

utils::promptPackage( package = pkgName, 
    filename = file.path( pkgDir, pkgName, "man", sprintf( "%s-package.Rd", pkgName ) ),
    final = TRUE )

file.copy(
    from      = file.path( pkgDir, "..", "prepare", "TT.env.Rd" ), 
    to        = file.path( pkgDir, pkgName, "man", "TT.env.Rd" ), 
    overwrite = TRUE  
)   #



# pdu_pkgRemove( pkgName = pkgName ) 



# +--------------------------------------------------------+
# | Run R CMD build (build tar.gz source binary)           |
# | Run R CMD check (check package)                        |
# | Run R CMD INSTALL (build Windows binary and install)   |
# +--------------------------------------------------------+

# # Source some utility functions (prefix: pdu_)
# source( file.path( "..", "pkg_dev_utilities.fun.r" ) ) 

pdu_rcmdbuild( pkgName = pkgName, pkgDir = pkgDir, 
    buildDir = buildDir, gitRevison = TRUE, 
    noVignettes = FALSE, compactVignettes = "gs+qpdf", 
    md5 = TRUE )

pdu_rcmdcheck( pkgName = pkgName, pkgDir = pkgDir, 
    buildDir = buildDir, noExamples = FALSE, 
    noTests = FALSE, noVignettes = FALSE, asCRAN = TRUE )

pdu_rcmdinstall( pkgName = pkgName, pkgDir = pkgDir, 
    buildDir = buildDir, build = TRUE, 
    compactDocs = TRUE, byteCompile = TRUE, compileBoth = TRUE )

#   Remove .Rcheck folder
pdu_rm_Rcheck( pkgName = pkgName, pkgDir = pkgDir, 
    buildDir = buildDir )

#   Load and unload the package:
library( pkgName, character.only = TRUE )
pdu_detach( pkgName = pkgName )



# +--------------------------------------------------------+
# | Rebuild vignette (optional)                            |
# +--------------------------------------------------------+

# # Source some utility functions (prefix: pdu_)
# source( file.path( "..", "pkg_dev_utilities.fun.r" ) )

pdu_build_vignette( RnwFile = "soiltexture_vignette.Rnw", 
    pkgName = pkgName, pkgDir = pkgDir, buildDir = buildDir, 
    pdf = TRUE, quiet = TRUE )   



# +--------------------------------------------------------+
# | Build PDF-version of the manual (help pages)           |
# +--------------------------------------------------------+

# # Source some utility functions (prefix: pdu_)
# source( file.path( "..", "pkg_dev_utilities.fun.r" ) )

pdu_rd2pdf( pkgName = pkgName, pkgDir = pkgDir, 
    buildDir = buildDir )
