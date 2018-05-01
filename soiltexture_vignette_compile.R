
detach( package:soiltexture ) 
rm(list=ls(all=TRUE)) 

setwd( file.path( Sys.getenv(x = "rPackagesDir" ), "soiltexture/pkg/soiltexture/vignettes" ) )

tools::showNonASCIIfile(file="soiltexture_vignette.Rnw")

tools::showNonASCIIfile(file="soiltexture_vignette.bib")

Stangle( "soiltexture_vignette.Rnw", encoding = "UTF-8" ) 

Sweave( "soiltexture_vignette.Rnw", encoding = "UTF-8" ) 

for( clean in c(FALSE,FALSE,TRUE) ){ 
    msg <- tools::texi2dvi( 
        file        = "soiltexture_vignette.tex", 
        pdf         = TRUE, 
        clean       = clean, 
        texinputs   = getwd() 
    )   
    
    # if( !clean ){ 
    #     detach( package:soiltexture ) 
    # }   
}   



## Copy the vignette's pdf into the 'doc' folder
file.copy( 
    from      = "soiltexture_vignette.pdf", 
    to        = "../inst/doc/soiltexture_vignette.pdf", 
    overwrite = TRUE )    

# file.remove( "soiltexture_vignette.pdf" ) 



for( ext in c( "\\.tex$", "\\.bib.bak$", "\\.R$", "\\.aux$", 
    "\\.bbl$", "\\.blg$", "\\.log$", "\\.out$", "\\.toc$", "\\.pdf$" ) ){ 
    
    file.remove( list.files( getwd(), ext, full.names = TRUE ) ) 
}   

