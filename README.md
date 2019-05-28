
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ace2fastq

<!-- badges: start -->

[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/c5sire/ace2fastq?branch=master&svg=true)](https://ci.appveyor.com/project/c5sire/ace2fastq)
<!-- badges: end -->

The goal of ace2fastq is to provide a utility function that converts
‘.ace’ files (ABI ‘Sanger’ capillary sequence assembly files) to a
standard .fastq files

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

n <- 40
substr(lines[1], 1, n)
#> [1] "@ 1.seq   CO Contig1 1489 2 12 U"
substr(lines[2], 60, 60+n)
#> [1] "gctccctgatgttagcggcggACGGGTGAGTAACACGTGGG"
substr(lines[3], 1, 1)
#> [1] "+"
substr(lines[4], 60, 60+n)
#> [1] "!!!!!!!!!!!!!!!!!!!!!DUNUUUUUUUNUDIIIUUUU"
```
