set pkgname=ternaryplot

cd /D "%rPackagesDir%\soiltexture\pkg" 

R CMD build --compact-vignettes="gs+qpdf" %pkgname% 

pause
