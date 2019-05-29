
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ace2fastq

<!-- badges: start -->

[![Project Status: Active â€“ The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/c5sire/ace2fastq?branch=master&svg=true)](https://ci.appveyor.com/project/c5sire/ace2fastq)
[![Travis build
status](https://travis-ci.org/c5sire/ace2fastq.svg?branch=master)](https://travis-ci.org/c5sire/ace2fastq)
[![Codecov test
coverage](https://codecov.io/gh/c5sire/ace2fastq/branch/master/graph/badge.svg)](https://codecov.io/gh/c5sire/ace2fastq?branch=master)

<!-- badges: end -->

The package provides a function that converts ‘.ace’ files (ABI ‘Sanger’
capillary sequence assembly files) to standard .fastq files.

## Installation

You can install the released version of ace2fq from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ace2fastq")
```

Latest version can be installed from github:

``` r
install.packages(devtools)

devtools::install_github("c5sire/ace2fastq")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ace2fastq)


filename <- system.file("sampledat/1.seq.ace", package = "ace2fastq")

out_file <- ace_to_fastq(filename)

lines <- readLines(out_file)
```

    #> [1] "@1.seq CO Contig1 1489 2 12 U"
    #> [1] "gctccctgatgttagcggcggACGGGTGAGTAACACGTGGG"
    #> [1] "+"
    #> [1] "!!!!!!!!!!!!!!!!!!!!!DUNUUUUUUUNUDIIIUUUU"
