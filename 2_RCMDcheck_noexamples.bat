set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD check --no-examples %pkgname%

@REM --as-cran _0.2.11.tar.gz

pause
