set pkgname=ternaryplot

cd /D "%rPackagesDir%\soiltexture\pkg" 

R CMD check %pkgname%

@REM --as-cran --no-tests 

pause
