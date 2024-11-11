---
title: "Other Useful Packages"
date: 2018-12-28T11:02:05+06:00
icon: "fas fa-code" # fontawesome icon : https://fontawesome.com/icons
description: "Packages that are key to the pharmaverse, but transcend end-to-end clinical reporting."
weight: 3
# type dont remove or customize
type : "docs"
---

This list covers the wider purpose R packages that we have found most useful and those that most commonly form dependencies to the pharma-specific packages. 

Another useful reference is this document from the R Foundation titled [Regulatory Compliance and Validation Issues - A Guidance Document for the Use of R in Regulated Clinical Trial Environments](https://www.r-project.org/doc/R-FDA.pdf), which shows a list of base and recommended R packages. 

<hr>

### Tables

There is a current industry working group ongoing effort around tables and the advantages of different packages [here](https://github.com/RConsortium/rtrs-wg/blob/main/Papers/01_cell_values_derivation.Rmd), which will result in a paper. In general, the problem is best divided into the following categories:

#### Table Creation

{{< otherpackages pkg="flextable" >}}

{{< otherpackages pkg="gt" >}}

{{< otherpackages pkg="huxtable" >}}

{{< otherpackages pkg="mmtable2" >}}

#### Formatting and Rendering

There are different solutions already available, but during R/Pharma there was an announcement of the RStudio package tgen to solve the rendering problems consistently.

<hr>

### Graphs

{{< otherpackages pkg="ggplot2" >}}

{{< otherpackages pkg="viridisLite" >}}

<hr>

### Utilities

{{< otherpackages pkg="tidyverse" >}}

{{< otherpackages pkg="lintr" >}}

{{< otherpackages pkg="styler" >}}

{{< otherpackages pkg="renv" >}}

<hr>

### Statistical packages

It would be impossible to capture all the relevant statistical packages, as there are potentially thousands of 
potential methods that could be applied in a study. Below we include a handful that are likely to be 
used in the majority of trial reporting events, and refer to the Cran Task Views (CTVs) that attempt 
to maintain a landscape of available packages other several important domains.

**stats** - Base R package with a lot of functionality useful for design and analysis of clinical trials

**survival** - Core survival analysis routines

**car** - R companion to applied regression

**emmeans** - Estimated marginal means, aka least-squares means

**mmrm** - Mixed models for repeated measures ([link](https://openpharma.github.io/mmrm))

**lme4** - Fit linear and generalized linear mixed-effects models

**lmerTest** - Tests in linear mixed effects models

**broom** - takes the messy output of built-in functions in R and turns them into tidy tibbles

**VGAM** - Vector generalized linear and additive models

It is also worth attracting attention here to the wider CTVs across several pertinent topics, such as:

[Clinical Trials](https://cran.r-project.org/web/views/ClinicalTrials.html), [Survival](https://cran.r-project.org/web/views/Survival.html), [Bayes](https://cran.r-project.org/web/views/Bayesian.html), [Missing data](https://cran.r-project.org/web/views/MissingData.html), and [PK](https://cran.r-project.org/web/views/Pharmacokinetics.html).

<hr>

As you can appreciate with R such an ever-evolving language we would never be able to include and maintain a complete list of all recommended packages here, but we hope that this page helps to introduce to some of the most common packages used both within and beyond pharma.
