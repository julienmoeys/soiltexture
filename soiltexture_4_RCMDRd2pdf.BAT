set pkgname=soiltexture
set version=1.4.0

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD Rd2pdf %pkgname% --output=%pkgname%.%version%.pdf

pause
