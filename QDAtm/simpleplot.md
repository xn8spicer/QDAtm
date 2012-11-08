RQDA package for Qualitative Data Analysis
==========================================
I downloaded the package and installed it from within the standard R64 console.  It asked if I wanted to install Gtk2 and I said OK.  I am getting some errors about Gtk when I  launch RQDA in RStudio about not know my local directory or monitor, but things seem to work.

Text Mining with the tm package
========================================================
To use plotting in tm package I needed to install Rgraphviz from [bioconductor][http://www.bioconductor.org/packages/release/bioc/html/Rgraphviz.html]



```r
library("tm")
data("crude")
tdm <- TermDocumentMatrix(crude, control = list(removePunctuation = TRUE, removeNumbers = TRUE, 
    stopwords = TRUE, wordLengths = c(2, 100)))
```


You can also embed plots, for example:


```r
plot(tdm, terms = findFreqTerms(tdm, lowfreq = 6)[1:25], corThreshold = 0.5)
```

```
## Loading required package: Rgraphviz
```

```
## Loading required package: graph
```

```
## Loading required package: grid
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

Or look for combinations....

```r
d <- c("oil", "crude", "prices")
inspect(DocumentTermMatrix(crude, list(dictionary = d)))
```

```
## A document-term matrix (20 documents, 3 terms)
## 
## Non-/sparse entries: 41/19
## Sparsity           : 32%
## Maximal term length: 6 
## Weighting          : term frequency (tf)
## 
##      Terms
## Docs  crude oil prices
##   127     1   3      2
##   144     0   9      1
##   191     2   2      0
##   194     3   1      0
##   211     0   1      0
##   236     1   6      2
##   237     0   3      0
##   242     0   3      1
##   246     0   4      0
##   248     0   8      5
##   273     5   5      4
##   349     2   3      0
##   352     0   4      2
##   353     2   4      1
##   368     0   3      0
##   489     0   4      2
##   502     0   4      2
##   543     2   2      2
##   704     0   1      2
##   708     1   1      0
```

