Class08
================
Kevin Banh
10/24/2019

## R Markdown

``` r
# Generate some example data for clustering
tmp <- c(rnorm(30,-3), rnorm(30,3))
x <- cbind(x=tmp, y=rev(tmp))
plot(x)
```

![](class8_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Use the kmeans() function setting k to 2 and nstart=20

``` r
special_k <- kmeans(x, centers = 2, nstart = 20)
```

Inspect/print the results

``` r
special_k
```

    ## K-means clustering with 2 clusters of sizes 30, 30
    ## 
    ## Cluster means:
    ##           x         y
    ## 1  3.085223 -3.492268
    ## 2 -3.492268  3.085223
    ## 
    ## Clustering vector:
    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1
    ## [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
    ## 
    ## Within cluster sum of squares by cluster:
    ## [1] 67.20252 67.20252
    ##  (between_SS / total_SS =  90.6 %)
    ## 
    ## Available components:
    ## 
    ## [1] "cluster"      "centers"      "totss"        "withinss"    
    ## [5] "tot.withinss" "betweenss"    "size"         "iter"        
    ## [9] "ifault"

Q. How many points are in each cluster? \#30 Q. What ‘component’ of your
result object details - cluster size? - cluster assignment/membership? -
cluster
    center?

``` r
special_k$size
```

    ## [1] 30 30

``` r
special_k$cluster
```

    ##  [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1
    ## [36] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

Plot x colored by the kmeans cluster assignment and add cluster centers
as blue points

``` r
plot(x, col = special_k$cluster)
points(special_k$centers, col = "turquoise", pch=15)
```

![](class8_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

\#Hierarchial clustering hclust() requires distance matrix as input; get
from dist() function

``` r
# First we need to calculate point (dis)similarity
# as the Euclidean distance between observations
dist_matrix <- dist(x)
# The hclust() function returns a hierarchical
# clustering model
hc <- hclust(d = dist_matrix)
# the print method is not so useful here
hc 
```

    ## 
    ## Call:
    ## hclust(d = dist_matrix)
    ## 
    ## Cluster method   : complete 
    ## Distance         : euclidean 
    ## Number of objects: 60

``` r
plot(hc)
abline(h=6, col="pink")
```

![](class8_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

``` r
grps <- cutree(hc, h=6)
```

``` r
cutree(hc, k=4)
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 2 1 1 1 2 1 1 1 2 1 1 2 1 1 2 1 1 1 1 2 3 4 4 4 4
    ## [36] 3 4 4 3 4 4 3 4 4 4 3 4 4 4 3 4 4 4 4 4 4 4 4 4 4

``` r
# Step 1. Generate some example data for clustering
x <- rbind(
 matrix(rnorm(100, mean=0, sd = 0.3), ncol = 2), # c1
 matrix(rnorm(100, mean = 1, sd = 0.3), ncol = 2), # c2
 matrix(c(rnorm(50, mean = 1, sd = 0.3), # c3
 rnorm(50, mean = 0, sd = 0.3)), ncol = 2))
colnames(x) <- c("x", "y")
# Step 2. Plot the data without clustering
plot(x)
```

![](class8_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

``` r
# Step 3. Generate colors for known clusters
# (just so we can compare to hclust results)
col <- as.factor( rep(c("c1","c2","c3"), each=50) )
plot(x, col=col)
```

![](class8_files/figure-gfm/unnamed-chunk-10-2.png)<!-- -->

Q. Use the dist(), hclust(), plot() and cutree() functions to return 2
and 3 clusters Q. How does this compare to your known ‘col’ groups?

``` r
#clustering
hc <- hclust(dist(x))
#draw tree
plot(hc)
abline(h=2, col="pink")
```

![](class8_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

``` r
#cut tree into clusters
groups<- cutree(hc, k=3)
groups
```

    ##   [1] 1 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 1 2 1 1 1 1 1 1 1 1 1 1 2 1 1
    ##  [36] 1 1 1 1 1 3 1 1 1 1 1 1 2 1 1 2 3 3 3 3 3 3 3 3 3 2 2 3 3 3 2 2 3 3 3
    ##  [71] 3 3 3 3 3 3 2 3 3 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 2 2 2 2 2
    ## [106] 2 2 2 2 2 2 1 2 2 2 2 2 2 2 2 2 2 2 2 2 1 2 2 2 2 2 2 3 2 2 2 2 2 1 2
    ## [141] 2 1 2 2 2 2 2 1 2 3

Plot data colored by their drip,

How many points in each cluster

``` r
table(groups)
```

    ## groups
    ##  1  2  3 
    ## 49 57 44

Cross tabulate EX. compare clustering result with known answer;

``` r
table(groups, col)
```

    ##       col
    ## groups c1 c2 c3
    ##      1 44  0  5
    ##      2  5  9 43
    ##      3  1 41  2

\#PCA stuffz Read example gene expression data;

``` r
mydata <- read.csv("https://tinyurl.com/expression-CSV",
 row.names=1)
head(mydata)
```

    ##        wt1 wt2  wt3  wt4 wt5 ko1 ko2 ko3 ko4 ko5
    ## gene1  439 458  408  429 420  90  88  86  90  93
    ## gene2  219 200  204  210 187 427 423 434 433 426
    ## gene3 1006 989 1030 1017 973 252 237 238 226 210
    ## gene4  783 792  829  856 760 849 856 835 885 894
    ## gene5  181 249  204  244 225 277 305 272 270 279
    ## gene6  460 502  491  491 493 612 594 577 618 638

``` r
#how many genes in dataset
dim(mydata)
```

    ## [1] 100  10

``` r
nrow(mydata)
```

    ## [1] 100

``` r
## lets do PCA with prcomp
pca <- prcomp(t(mydata), scale=TRUE) 

## See what is returned by the prcomp() function
attributes(pca)
```

    ## $names
    ## [1] "sdev"     "rotation" "center"   "scale"    "x"       
    ## 
    ## $class
    ## [1] "prcomp"

``` r
## A basic PC1 vs PC2 2-D plot
plot(pca$x[,1], pca$x[,2])
```

![](class8_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

``` r
## Precent variance is often more informative to look at
pca.var <- pca$sdev^2
pca.var.per <- round(pca.var/sum(pca.var)*100, 1) 
```

``` r
barplot(pca.var.per, main="YEET Plot",
 xlab="Principal Component", ylab="Percent Variation")
```

![](class8_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

``` r
plot(pca$x[,1], pca$x[,2])
```

![](class8_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

``` r
  col=c("red", "red","red", "red", "red", "blue", "blue", "blue", "blue", "blue")
```

``` r
x <- read.csv("UK_foods.csv", row.names = 1)
x
```

    ##                     England Wales Scotland N.Ireland
    ## Cheese                  105   103      103        66
    ## Carcass_meat            245   227      242       267
    ## Other_meat              685   803      750       586
    ## Fish                    147   160      122        93
    ## Fats_and_oils           193   235      184       209
    ## Sugars                  156   175      147       139
    ## Fresh_potatoes          720   874      566      1033
    ## Fresh_Veg               253   265      171       143
    ## Other_Veg               488   570      418       355
    ## Processed_potatoes      198   203      220       187
    ## Processed_Veg           360   365      337       334
    ## Fresh_fruit            1102  1137      957       674
    ## Cereals                1472  1582     1462      1494
    ## Beverages                57    73       53        47
    ## Soft_drinks            1374  1256     1572      1506
    ## Alcoholic_drinks        375   475      458       135
    ## Confectionery            54    64       62        41

``` r
barplot(as.matrix(x), beside=FALSE, col=rainbow(nrow(x)))
```

![](class8_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

``` r
pca <- prcomp(t(x))
summary(pca)
```

    ## Importance of components:
    ##                             PC1      PC2      PC3       PC4
    ## Standard deviation     324.1502 212.7478 73.87622 4.189e-14
    ## Proportion of Variance   0.6744   0.2905  0.03503 0.000e+00
    ## Cumulative Proportion    0.6744   0.9650  1.00000 1.000e+00
