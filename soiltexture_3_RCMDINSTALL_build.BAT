set pkgname=soiltexture
set version=1.3.2

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %pkgname%_%version%.tar.gz

pause
