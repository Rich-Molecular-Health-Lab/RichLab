
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RichLab

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/RichLab)](https://CRAN.R-project.org/package=RichLab)
[![R-CMD-check](https://github.com/Rich-Molecular-Health-Lab/RichLabNotebook/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Rich-Molecular-Health-Lab/RichLabNotebook/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Rich-Molecular-Health-Lab/RichLabNotebook/graph/badge.svg)](https://app.codecov.io/gh/Rich-Molecular-Health-Lab/RichLabNotebook)
<!-- badges: end -->

The goal of RichLab is to maintain streamlined documentation in the lab
with consistent version control. This package contains templates for lab
notebook entries and other documents as well as some of the custom
helper functions or scripts that we use frequently in our analyses.

## Installation

To install `RichLab` on your local R Studio:

### If you don’t have `pak` installed…

``` r
install.packages("pak")
pak::pak("Rich-Molecular-Health-Lab/RichLab")
```

### If you already have `pak` installed…

``` r
pak::pak("Rich-Molecular-Health-Lab/RichLab")
```

## Example Usage

This is a basic example which shows you how start your new lab notebook
by opening the cover page template from the R console:

``` r
library(RichLab)
rmarkdown::draft("notebook_cover.Rmd", template = "Notebook Cover Page", package = "RichLab")
```

The easiest way to open up a template, however, is to create a new R
Markdown document from inside RStudio (`File` -\> `New File` -\>
`R Markdown`) and select `From Template` when the dialog box appears
(*Note: this only works after you install `RichLab`*).
