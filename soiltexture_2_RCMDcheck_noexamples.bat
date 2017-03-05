set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

prompt $g

@echo :::: Finding latest version of package source ::::

dir %pkgname%_*tar.gz /b /o:-n > tmp.txt
set /p targzfile=<tmp.txt 
del tmp.txt

@echo :::: Processing %targzfile% ::::

R CMD check --no-examples --as-cran %targzfile%

@REM --no-tests 

pause
