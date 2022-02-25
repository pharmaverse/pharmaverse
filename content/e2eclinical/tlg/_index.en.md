---
title: "TLGs"
date: 2018-12-29T11:02:05+06:00
weight: 3
draft: false
---

TLGs (tables, listings, and graphs _- also known as TLFs/TFLs with F for figures_) refer to the packages that take data, and convert then into a human 
intepretable insight. 

There are two relevant stages of TLGs - static TLGs, which as of today are the 
only type of evidence submitted to regulatory bodies, and interactive TLGs, which are predominantly,
but not limited to, shiny apps.

### Frameworks

{{< pharmaverse pkg="nest" >}}

The Nest project is currently a closed source collaboration between 4 Pharma companies. Nest is a framework,
so engine used to generate the output can be modified. `ggplot2` and `rtables` are the preferred engines due 
to their flexibility and feature set, but examples 
exist within the Nest framework using other packages like `plotly`, `visR` and `tplyr`.

There are publicly available examples:

The efficacy APP [Efficacy](https://genentech.shinyapps.io/teal_efficacy/)

The safety APP [Safety](https://genentech.shinyapps.io/teal_safety/)

The exploratory APP [Exploratory](https://genentech.shinyapps.io/teal_exploratory/)

OPEN SOURCE RELEASE FOR Nest (tern/teal/chevron) EXPECTED ~MID-2022 Contact James Black (james.black.jb2@roche.com)

{{< pharmaverse pkg="tern" >}}

{{< pharmaverse pkg="teal" >}}

{{< pharmaverse pkg="chevron" >}}

### Tables

{{< pharmaverse pkg="rtables" >}}

{{< pharmaverse pkg="pharmaRTF" >}}

{{< pharmaverse pkg="Tplyr" >}}

**Upcoming packages**

{{< pharmaverse pkg="tidytlg" >}}

### Plots

{{< pharmaverse pkg="visR" >}}

While ggplot2 is a lower level, non-pharma specific plotting package. It is universally 
accepted as the package for graphics, so included here and as a non-pharma package.

{{< otherpackages pkg="ggplot2" >}}
