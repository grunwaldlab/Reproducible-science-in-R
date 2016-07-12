# Reproducible science in R

*Zachary S.L. Foster, Zhian N. Kamvar, and  Niklaus J. Gr&uuml;nwald*

Welcome! This primer provides a concise introduction to conducting reproducible science in R. While this primer does not require extensive knowledge of programming in R, the user is expected to install R and all packages required for this primer.

# Chapters

1. Introduction (Nik)
1. Getting ready to use R (Nik)
1. Data formatting and read/write
1. Markdown (Zach)
1. R markdown (Zach)
1. Git and github (Zhian)
1. Organizing Reproducible Research


# Website

You can find rendered vignettes on [our website](http://grunwaldlab.github.io/Reproducible-science-in-R/). 

## Building the webite

install the *quiltr* package and *knitcitations*:

```r
devtools::install_github("grunwaldlab/quiltr", "cboettig/knitcitations")
library("quiltr")
```

To build the website locally and open it in a viewer window:

```r
quiltr::quilt()
```

To build the website and subsequently push it to github (this assumes that you have git and github already configured with ssh keys):

```r
quiltr::make_gh_website()
```

It seems to work, but ¯\\_(ツ)_/¯
