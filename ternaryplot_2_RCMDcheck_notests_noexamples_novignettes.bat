set pkgname=ternaryplot

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD check --no-tests --no-examples --no-vignettes %pkgname%

@REM --as-cran 

pause
