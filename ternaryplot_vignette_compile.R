rm(list=ls(all=TRUE)) 
pkg.name <- "template" 
rootDir  <- "C:/_R_PACKAGES" 



setwd( file.path( rootDir, pkg.name, "pkg", pkg.name, "inst/doc" ) ) 

Stangle( paste( pkg.name, "vignette.Rnw", sep = "_" ) 

Sweave( paste( pkg.name, "vignette.Rnw", sep = "_" ) 

msg <- tools::texi2dvi( 
    file        = paste( pkg.name, "vignette.tex", sep = "_", 
    pdf         = TRUE, 
    clean       = TRUE, 
    texinputs   = getwd() 
)   # 

file.remove( list.files( getwd(), "\\.tex$", full.names = TRUE ) )
file.remove( list.files( getwd(), "\\.bib.bak$", full.names = TRUE ) )
file.remove( list.files( getwd(), "\\.R$", full.names = TRUE ) )

library("tools")
res <- compactPDF( paths = getwd(), gs_quality = "ebook" ) # paste(sep="",file.name.root,".pdf") 
res 
