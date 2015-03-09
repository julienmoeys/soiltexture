set pkgname=soiltexture
set version=1.2.22

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %pkgname%_%version%.tar.gz

pause
