set pkgname=ternaryplot

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD build --compact-vignettes="gs" %pkgname% 

pause
