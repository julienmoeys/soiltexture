set pkgname=ternaryplot

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD build --no-vignettes --compact-vignette="gs" %pkgname% 

pause
