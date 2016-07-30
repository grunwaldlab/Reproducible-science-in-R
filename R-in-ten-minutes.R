## ----calculate_good_times------------------------------------------------
47 + 2
47 * 2

## ----its_magic-----------------------------------------------------------
# 49 - 2 and 94/2 are both 47. It's magic!
its   <- 49 - 2
magic <- 94 / 2

## ----vector_me_this------------------------------------------------------
some_numbers <- c(10.0, pi, 47.5362, 3.50, 1.1111)
some_numbers  

some_integers <- c(NA, 1, 1, 2, 3) # NA is code for "missing" in R
some_integers 

more_integers <- 1:5 # same as c(1, 2, 3, 4), but a lot easier to type!
more_integers

some_characters <- c("work it", "harder", "make it", "better",
                     "do it", "faster", "makes us", "stronger")
some_characters 

some_logic <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
some_logic

## ----v_add_o-------------------------------------------------------------
some_integers ^ 2

## ----v_drag--------------------------------------------------------------
some_integers + some_numbers

## ----get_number----------------------------------------------------------
some_numbers[2]

some_characters[c(1, 3, 5, 7)]

some_logic[1:3]

fib <- some_integers[-1] # remove the first element
fib

some_characters[fib] # you can also use other vectors!

## ----truth_and_consequences----------------------------------------------
some_numbers[some_logic]

## ----less_than_ten-------------------------------------------------------
some_numbers # the first and second elements are not less than 10.
some_numbers[some_numbers < 10]

## ------------------------------------------------------------------------
ComasOxapampa <- read.table("ex_data/ComasOxapampa.csv", sep = ",", head = TRUE)

## ------------------------------------------------------------------------
str(ComasOxapampa)

## ------------------------------------------------------------------------
ComasOxapampa$comas # vector of AUDPC values for Comas

## ------------------------------------------------------------------------
ComasOxapampa$difference <- ComasOxapampa$comas - ComasOxapampa$oxapampa
head(ComasOxapampa) # Look at the top of the data (6 rows by default)

## ------------------------------------------------------------------------
nrow(ComasOxapampa)
ncol(ComasOxapampa)

## ------------------------------------------------------------------------
length(unique(ComasOxapampa$cultivar))

## ------------------------------------------------------------------------
region_t <- t.test(ComasOxapampa$comas, ComasOxapampa$oxapampa)
region_t

## ----install_package, eval = FALSE---------------------------------------
install.packages("agricolae", repos = "https://cran.rstudio.org")

## ------------------------------------------------------------------------
library("agricolae") # The package with the audpc() function.
?audpc               # open the R documentation of the function audpc()

## ---- eval = FALSE-------------------------------------------------------
help(package = "agricolae") # Get help for a package.
help("audpc")               # Get help for the audpc function
?audpc                      # same as above
??disease                   # Search for help with the keyword 'disease' in all packages

## ------------------------------------------------------------------------
example("audpc", package = "agricolae")

browseVignettes(package = "tidyr") # see vignettes from a specific package.

## ---- eval=FALSE---------------------------------------------------------
vignette('mlg') # Multilocus Genotype vignette from the poppr package


