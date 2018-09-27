Linux: [![Linux Build Status (Travis CI)](https://travis-ci.org/julienmoeys/soiltexture.svg?branch=master)](https://travis-ci.org/julienmoeys/soiltexture). 
Windows: [![Windows Build Status (AppVeyor)](https://ci.appveyor.com/api/projects/status/github/julienmoeys/soiltexture?branch=master&svg=true)](https://ci.appveyor.com/project/julienmoeys/soiltexture)

Official package release on CRAN: [https://cran.r-project.org/package=soiltexture]()



soiltexture
============================================================

Homepage of the soiltexture R package.

The package repositry was recently moved from rforge to 
GitHub . Original pages:  
https://r-forge.r-project.org/R/?group_id=740 
http://soiltexture.r-forge.r-project.org/

This page is under construction.

Please refer to the old homepage for more information.



Installation:
------------------------------------------------------------

**Official release on [CRAN](http://cran.r-project.org)**

Please make sure that the package can be installed on your 
version of R (type `R.Version()[["version.string"]]`) by 
checking the minimum version of R indicated in the package 
description (field "Depends:" on the [CRAN page of the 
package](https://cran.r-project.org/package=soiltexture)).

To install the latest official release of the package, 
type the following command in R command prompt:

```
install.packages("soiltexture")
```

Then, to get started, type

```
library("soiltexture")
help(pack='soiltexture')
```



**Development version from [Github](https://github.com/julienmoeys/soiltexture)**

Please make sure that the package can be installed on your 
version of R (type `R.Version()[["version.string"]]`) by 
checking the minimum version of R indicated in the package 
[DESCRIPTION on Github](https://github.com/julienmoeys/soiltexture/blob/master/pkg/soiltexture/DESCRIPTION).

To install the latest development version of the package 
from GitHub, you need to install the package 
[devtools](https://cran.r-project.org/web/packages/devtools/index.html)
and the software bundle 
[Rtools](https://cran.r-project.org/bin/windows/Rtools/). 
Please refer to `devtools` 
[README](https://cran.r-project.org/web/packages/devtools/readme/README.html). 

To install devtools, type in R command prompt:

```
install.packages("devtools")
```

Then, to install `soiltexture` from GitHub, type:

```
devtools::install_github("julienmoeys/soiltexture/pkg/soiltexture")
```



Frequently asked questions (FAQ):
------------------------------------------------------------

See here: [FAQ.md](FAQ.md).



User support:
------------------------------------------------------------

My current work and personal situation unfortunately does not 
leave me much time to provide support to and answer questions 
from users of the soiltexture package. I prioritise the base 
maintenance of the package on CRAN, so that the package 
remains available on the latest version of R. Answer to other 
questions is likely to be erratic or very delayed.
