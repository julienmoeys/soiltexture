set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD check --no-examples --as-cran %pkgname%_1.2.14.tar.gz

@REM --as-cran 

pause
