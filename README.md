
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mcdus

<!-- badges: start -->

[![R-CMD-check](https://github.com/mjmoon/mcdus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mjmoon/mcdus/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `mcdus` is to provide easy and reproducible access to the
U.S. Mortality Multiple Cause Files available from [CDC Vital Statistics
Online Data
Portal](https://www.cdc.gov/nchs/data_access/vitalstatsonline.htm#Mortality_Multiple).
Currently, data files from 1999 to 2020 are availble for download using
the package covering years since adopting ICD-10.

## Installation

You can install the development version of mcdus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mjmoon/mcdus")
```

## Example

The functions allow you to download zip files, uncompress the ASCII data
files, and parse them into a R data frame object.

``` r
library(mcdus)
download_mcdus_zip("2019")
uncompress_mcdus_zip("2019")
mcd2019 <- parse_mcdus("2019")[[1]]
```

To check the data specification, you can open up the source
documentation online from the package.

``` r
open_mcdus_documentation("2019")
```
