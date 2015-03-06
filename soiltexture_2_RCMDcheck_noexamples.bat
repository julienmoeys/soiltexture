set pkgname=soiltexture
set version=1.2.21

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD check --no-examples --as-cran %pkgname%_%version%.tar.gz

@REM --as-cran 

pause
