# Reproducible science in R

*Zachary S.L. Foster, Zhian N. Kamvar, and  Niklaus J. Gr&uuml;nwald*

Welcome! This primer provides a concise introduction to conducting reproducible science in R. While this primer does not require extensive knowledge of programming in R, the user is expected to install R and all packages required for this primer.

# Chapters

1. Introduction (Nik)                   20min   8:30
1. Data formatting and read/write (Zh)  15min   8:50
1. Markdown (Zach)                      30min   9:20

Break                                   20min   9:40

1. Intro to R   (Zh)                    10min   10:00
1. R markdown (Zach)                    50min   10:10
1. Git and github (Zhian)               20min   11:00
1. Organizing Reproducible Research     10min   11:20
1. Wrapup    Survey                        5min    11:30


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
