---
title: "Other Useful Packages"
date: 2018-12-28T11:02:05+06:00
icon: "fas fa-code" # fontawesome icon : https://fontawesome.com/icons
description: "Packages that are key to the pharmaverse, but transcend e2e clinical reporting."
# type dont remove or customize
type : "docs"
---

This list covers the wider purpose R packages that we have found most useful and those that most commonly form dependencies to the pharma-specific packages. 

Another useful reference is this document from the R Foundation titled "Regulatory Compliance and Validation Issues - A Guidance Document for the Use of R in Regulated Clinical Trial Environments" [link](https://www.r-project.org/doc/R-FDA.pdf), which shows a list of base and recommended R packages. 

<hr>

### Tables

There is a current industry working group ongoing effort around tables and the advantages of different packages [here](https://github.com/RConsortium/rtrs-wg/blob/main/Papers/01_cell_values_derivation.Rmd), which will result in a paper. In general, the problem is best divided into the following categories:

## Table Creation

flextable
gt
huxtable
mmtable2
tableone
tables

## Formatting and Rendering

There are different solutions already available, but during R/Pharma there was an announcement of the RStudio package tgen to solve the rendering problems consistently.

<hr>

### Graphs

ggplot2
grDevices
grid
gridExtra
gtable
viridisLite

<img width="80" height="90" src="https://raw.githubusercontent.com/openpharma/visR/master/man/figures/logo.png"> **visR** - a package to wrap functionality for plots, tables and diagrams adhering to graphical principles 

<hr>

### Utilities

<img width="80" height="90" src="https://user-images.githubusercontent.com/82581364/133089154-88763b10-8052-42fa-a65d-e6edcda5d858.png"> **tidyverse** [link](https://www.tidyverse.org/packages/) - an opinionated collection of R packages designed for data science, including tidyr, dplyr, readr, purrr, tibble, stringr, forcats, magrittr and haven.

**diffdf** - Functions for comparing two data.frames against each other

rlang
scales
labeling
lintr
renv

<hr>

### Statistical packages

stats
survival
car
emmeans
lme4
lmerTest
dfoptim - very specific for one specific optimization
broom
VGAM

It is also worth attracting attention here to the wider CRAN task views across several pertinent topics, such as:
[Clinical Trials](https://cran.r-project.org/web/views/ClinicalTrials.html), [Survival](https://cran.r-project.org/web/views/Survival.html), [Bayes](https://cran.r-project.org/web/views/Bayesian.html), and [Missing data](https://cran.r-project.org/web/views/MissingData.html).

<hr>

As we hope you appreciate with R such an ever-evolving language we would never be able to include and maintain a complete list of all recommended packages here, but we hope that this page helps to introduce to some of the most common packages used both within and beyond pharma.
