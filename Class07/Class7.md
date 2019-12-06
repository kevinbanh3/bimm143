Class 07 Packages
================
Kevin Banh
10/22/2019

## R function

``` r
source("http://tinyurl.com/rescale-R")
```

``` r
rescale(1:10)
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

``` r
rescale(c(1,10,5,NA,6))
```

    ## [1] 0.0000000 1.0000000 0.4444444        NA 0.5555556

``` r
rescale2(c(1:10, 2))
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000 0.1111111

Write function to find where NA is in two input vectors write simple
input where know answer

``` r
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3, 4)
```

found **is.na()** function

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

**which**

``` r
which(is.na(x))
```

    ## [1] 3 5

``` r
which( is.na(y))
```

    ## [1] 1 3

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

``` r
is.na(y)
```

    ## [1]  TRUE FALSE  TRUE FALSE FALSE

``` r
is.na(x) & is.na(y)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

sum(is.na(x) & is.na(y)) **sum()** tell you how much TRUE you have

``` r
sum( !c(TRUE, TRUE, FALSE, TRUE))
```

    ## [1] 1

now turn into function

na\_na \<- function(x, y) { sum(is.na(x) & is.na(y)) } both\_na()

``` r
na_na <- function(x, y) {
  sum(is.na(x) & is.na(y))
}
```

``` r
na_na(x,y)
```

    ## [1] 1

x \<- c(NA, NA, NA) y1 \<- c( 1, NA, NA) y2 \<- c( 1, NA, NA, NA)

``` r
x <- c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)
```

``` r
both_na(x, y2)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 3

``` r
x2 <- c(NA, NA)
both_na(x2, y2)
```

    ## [1] 3

Recycle

``` r
plot(1:10, col=c("red", "salmon", "magenta"))
```

![](Class7_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

``` r
x <- c(1, NA, NA)
y3 <- c( 1, NA, NA, NA, NA, NA, NA)
both_na(x, y3)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 4

``` r
length(x)
```

    ## [1] 3

``` r
length(y3)
```

    ## [1] 7

``` r
na_na2 <- function(x, y) {
  if(length(x) != length(y)) {
    stop("must be same on gau zai")
  }
  sum(is.na(x) & is.na(y))
}
```

“mayonaise” == “instrument”

``` r
#na_na2(x, y3)
```

``` r
student_1 <- c(100, 100, 100, 100, 100, 100, 100, 90)
student_2 <- c(100, NA, 90, 90, 90, 97, 80)

student_1[-which.min(student_1)]
```

    ## [1] 100 100 100 100 100 100 100

``` r
mean(student_1[-which.min(student_1)])
```

    ## [1] 100

``` r
student_2[-which.min(student_2)]
```

    ## [1] 100  NA  90  90  90  97

``` r
mean(student_2[-which.min(student_2)])
```

    ## [1] NA

``` r
student_2[-which.min(student_2)]
```

    ## [1] 100  NA  90  90  90  97

``` r
mean(student_2[-which.min(student_2)], na.rm = TRUE)
```

    ## [1] 93.4

``` r
grade <- function(x) {
  if(any(is.na(x))){
    warning("Stupid")
  }
  mean(x[-which.min(x)], na.rm = TRUE)
}
```

``` r
grade(student_1)
```

    ## [1] 100

``` r
grade(student_2)
```

    ## Warning in grade(student_2): Stupid

    ## [1] 93.4

``` r
url <- "https://tinyurl.com/gradeinput"
hw <- read.csv(url, row.names=1)
```

``` r
apply(hw, 1, grade)
```

    ## Warning in FUN(newX[, i], ...): Stupid
    
    ## Warning in FUN(newX[, i], ...): Stupid
    
    ## Warning in FUN(newX[, i], ...): Stupid
    
    ## Warning in FUN(newX[, i], ...): Stupid

    ##  student-1  student-2  student-3  student-4  student-5  student-6 
    ##   91.75000   82.50000   84.25000   88.00000   88.25000   89.00000 
    ##  student-7  student-8  student-9 student-10 student-11 student-12 
    ##   94.00000   93.75000   87.75000   81.33333   86.00000   91.75000 
    ## student-13 student-14 student-15 student-16 student-17 student-18 
    ##   92.25000   87.75000   83.33333   89.50000   88.00000   97.00000 
    ## student-19 student-20 
    ##   82.75000   82.75000
