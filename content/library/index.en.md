---
title: "How to install these packages"
description: "Explanation on how to get the pharmaverse packages either individually or via r-universe.org."
layout: "docs"
draft: false
---

### Installing individually

In an internal regulatory setting, you are likely to have your own agreed package management solutions and your own mirror of CRAN.

### Installing from r-universe.org

We currently also have an [r-universe build](https://pharmaverse.r-universe.dev/ui#builds) available.

```r
# Enable this universe
options(
    repos = c(
    pharmaverse = 'https://pharmaverse.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'
    )
  )
```
