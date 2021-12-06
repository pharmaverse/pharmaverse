---
title: "Other Useful Packages"
date: 2018-12-28T11:02:05+06:00
icon: "fas fa-code" # fontawesome icon : https://fontawesome.com/icons
description: "Packages that are key to the pharmaverse, but transcend e2e clinical reporting."
# type dont remove or customize
type : "docs"
---

This list covers the wider purpose R packages that we have found most useful and those that most commonly form dependencies to the pharma-specific packages. 

Another useful reference is this document from the R Foundation titled ["Regulatory Compliance and Validation Issues - A Guidance Document for the Use of R in Regulated Clinical Trial Environments"](https://www.r-project.org/doc/R-FDA.pdf), which shows a list of base and recommended R packages. 

<hr>

### Tables

There is a current industry working group ongoing effort around tables and the advantages of different packages [here](https://github.com/RConsortium/rtrs-wg/blob/main/Papers/01_cell_values_derivation.Rmd), which will result in a paper. In general, the problem is best divided into the following categories:

#### Table Creation

<img width="80" height="90" src="https://raw.githubusercontent.com/davidgohel/flextable/master/man/figures/logo.png"> **flextable** - Creates tables for HTML, PDF, Microsoft Word and PowerPoint documents from R Markdown

<img width="80" height="90" src="https://raw.githubusercontent.com/rstudio/gt/master/man/figures/logo.svg"> **gt** - Easily generate information-rich, publication-quality tables from R

**huxtable** - An R package to create styled tables in multiple output formats, with a friendly, modern interface

<img width="80" height="90" src="https://raw.githubusercontent.com/ianmoran11/mmtable2/master/man/figures/logo.png"> **mmtable2** - Create and combine tables with a ggplot2/patchwork syntax

#### Formatting and Rendering

There are different solutions already available, but during R/Pharma there was an announcement of the RStudio package tgen to solve the rendering problems consistently.

<hr>

### Graphs

<img width="80" height="90" src="https://raw.githubusercontent.com/tidyverse/ggplot2/main/man/figures/logo.png"> **ggplot2** - An implementation of the Grammar of Graphics in R

<img width="80" height="90" src="https://raw.githubusercontent.com/openpharma/visR/master/man/figures/logo.png"> **visR** - a package to wrap functionality for plots, tables and diagrams adhering to graphical principles 

<img width="80" height="90" src="https://raw.githubusercontent.com/sjmgarnier/viridisLite/master/man/figures/logo.png"> **viridisLite** - Colorblind-Friendly Color Maps for R

<hr>

### Utilities

<img width="80" height="90" src="https://user-images.githubusercontent.com/82581364/133089154-88763b10-8052-42fa-a65d-e6edcda5d858.png"> **tidyverse** [link](https://www.tidyverse.org/packages/) - an opinionated collection of R packages designed for data science, including tidyr, dplyr, readr, purrr, tibble, stringr, forcats, magrittr and haven.

**diffdf** - Functions for comparing two data.frames against each other

**rlang** - Low-level API for programming with R

**lintr** - Static code analysis for R that checks adherence to a given style, syntax errors and possible semantic issues

**renv** - Helps you create reproducible environments for your R projects 

<hr>

### Statistical packages

**stats** - Base R package with a lot of functionality useful for design and analysis of clinical trials

**survival** - Core survival analysis routines

**car** - R companion to applied regression

**emmeans** - Estimated marginal means, aka least-squares means

**lme4** - Fit linear and generalized linear mixed-effects models

**lmerTest** - Tests in linear mixed effects models

**broom** - takes the messy output of built-in functions in R and turns them into tidy tibbles

**VGAM** - Vector generalized linear and additive models

It is also worth attracting attention here to the wider CRAN task views across several pertinent topics, such as:

[Clinical Trials](https://cran.r-project.org/web/views/ClinicalTrials.html), [Survival](https://cran.r-project.org/web/views/Survival.html), [Bayes](https://cran.r-project.org/web/views/Bayesian.html), and [Missing data](https://cran.r-project.org/web/views/MissingData.html).

<hr>

As you can appreciate with R such an ever-evolving language we would never be able to include and maintain a complete list of all recommended packages here, but we hope that this page helps to introduce to some of the most common packages used both within and beyond pharma.
