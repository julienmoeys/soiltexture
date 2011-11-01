# Running the latest part of this script (zipMe) requires to have 
# 7zip installed and available on Windows path.
rm(list=ls(all=TRUE)) 
work.wd             <- "C:/_R_PACKAGES/soiltexture/pkg/soiltexture/inst"  
subdir1             <- "doc" 
Sweave.wrapper.fun  <- "C:/_R_PACKAGES/soiltexture/Sweave_wrapper.R" 
file.name.root      <- "soiltexture_vignette"  
sweave.ext          <- ".Rnw"  
inout.dir           <- ""  



print("Don't forget to commit the source code to r-forge before compiling the vignette.")



eval( parse( Sweave.wrapper.fun ) ) 



res <- Sweave.wrapper( 
    file.name.root  = file.name.root, 
    work.wd         = file.path( work.wd, subdir1 ), 
    inout.dir       = inout.dir 
)   #



### If LaTeX failed because the pdf file was open, run:
# res <- texi2dvi.wrapper( 
#     file.name.root  = file.name.root, 
#     work.wd         = work.wd, 
#     inout.dir       = inout.dir 
# )   #


