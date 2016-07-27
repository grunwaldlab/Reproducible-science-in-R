# Reproducible science in R

*Zachary S.L. Foster, Zhian N. Kamvar, and  Niklaus J. Gr&uuml;nwald*

Welcome! This primer provides a concise introduction to conducting reproducible science in R. While this primer does not require extensive knowledge of programming in R, the user is expected to install R and all packages required for this primer.

# Chapters

| Session                             | Length| Clock|
|-------------------------------------|-------|------|
|Introduction (Nik)                   | 20min |  8:30|
|Data formatting and read/write (Zh)  | 15min |  8:50|
|Markdown (Zach)                      | 30min |  9:20|
|Break                                | 20min |  9:40|
|Intro to R   (Zh)                    | 10min |  10:00|
|R markdown (Zach)                    | 50min |  10:10|
|Git and github (Zhian)               | 20min |  11:00|
|Organizing Reproducible Research     | 10min |  11:20|
|Wrapup    Survey                     | 5min  |  11:30|


# Website

You can find rendered vignettes on [our website](http://grunwaldlab.github.io/Reproducible-science-in-R/). 

## Building the webite

install the *git2r*, *knitcitations*, and *rmarkdown* packages:

```r
devtools::install_github("rstudio/rmarkdown", "cboettig/knitcitations")
install.pacakges("git2r")
```

To build the website locally:

```r
rmarkdown::render_site()
```

To build the website on the `gh-pages` branch

```r
source("make_gh_page.R", echo = TRUE)
```

You can then push your changes from the master and the gh-pages branch.

It seems to work, but ¯\\_(ツ)_/¯

# Survey

http://goo.gl/forms/OCFxqPbXhsWMBQYT2
