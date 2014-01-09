set pkgname=soiltexturetransformation

cd /D "%rPackagesDir%\soiltexture\pkg" 

R CMD check --no-examples %pkgname%_1.0.0.tar.gz

@REM --as-cran

pause
