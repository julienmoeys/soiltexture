# Running the latest part of this script (zipMe) requires to have 
# 7zip installed and available on Windows path.
rm(list=ls(all=TRUE)) 
if( tolower(Sys.info()["sysname"]) == "windows" ){ 
    work.wd             <- "C:/_R_PACKAGES/soiltexture/pkg/soiltexture/inst"  
    Sweave.wrapper.fun  <- "C:/_R_PACKAGES/soiltexture/Sweave_wrapper.R" 
}else{ # Linux 
    work.wd             <- "/home/jules/Documents/_WORK/R_PACKAGES/soiltexture/pkg/soiltexture/inst"  
    Sweave.wrapper.fun  <- "/home/jules/Documents/_WORK/R_PACKAGES/soiltexture/Sweave_wrapper.R"        
}   #
subdir1             <- "doc" 
file.name.root      <- "transformations"  
sweave.ext          <- ".Rnw"  
inout.dir           <- ""  



eval( parse( Sweave.wrapper.fun ) ) 



res <- Sweave.wrapper( 
    file.name.root  = file.name.root, 
    work.wd         = file.path( work.wd, subdir1 ), 
    inout.dir       = inout.dir 
)   #


file.remove( list.files( file.path( work.wd, subdir1 ), "\\.tex$", full.names = TRUE ) )
file.remove( list.files( file.path( work.wd, subdir1 ), "\\.bib.bak$", full.names = TRUE ) )
file.remove( list.files( file.path( work.wd, subdir1 ), "\\.R$", full.names = TRUE ) )

library("tools")
res <- compactPDF( paths = file.path( work.wd, subdir1 ), gs_quality = "ebook" ) # paste(sep="",file.name.root,".pdf") 
res 


### If LaTeX failed because the pdf file was open, run:
# res <- texi2dvi.wrapper( 
#     file.name.root  = file.name.root, 
#     work.wd         = work.wd, 
#     inout.dir       = inout.dir 
# )   #


