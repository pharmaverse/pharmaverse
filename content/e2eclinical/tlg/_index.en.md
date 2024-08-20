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

For tables, we recommend the effort from R Consortium - [Tables in Clinical Trials with R](https://rconsortium.github.io/rtrs-wg/) - as a useful
read to compare examples from several of the below packages.

### Tables

{{< pharmaverse pkg="rtables" >}}

{{< pharmaverse pkg="chevron" >}}

{{< pharmaverse pkg="pharmaRTF" >}}

{{< pharmaverse pkg="Tplyr" >}}

{{< pharmaverse pkg="gtsummary" >}}

{{< pharmaverse pkg="cards" >}}

{{< pharmaverse pkg="cardx" >}}

{{< pharmaverse pkg="tfrmt" >}}

{{< pharmaverse pkg="tfrmtbuilder" >}}

{{< pharmaverse pkg="tidytlg" >}}

### Listings

{{< pharmaverse pkg="rlistings" >}}

### Plots

{{< pharmaverse pkg="ggsurvfit" >}}

While ggplot2 is a lower level, non-pharma specific plotting package. It is universally 
accepted as the package for graphics, so included here and as a non-pharma package.

{{< otherpackages pkg="ggplot2" >}}

### Interactive

{{< pharmaverse pkg="tidyCDISC" >}}

{{< pharmaverse pkg="rhino" >}}

### Frameworks

The following frameworks allow for the engine used to generate the output to be modified.
For example, they could be used with `ggplot2`, `rtables`, `plotly`, or `Tplyr`.

{{< pharmaverse pkg="tern" >}}

{{< pharmaverse pkg="teal" >}}

Tables, Listings, and Graphs Catalogs with many examples are available here:
- [TLG Catalog](https://insightsengineering.github.io/tlg-catalog/)
- [Biomarker Catalog](https://insightsengineering.github.io/biomarker-catalog/)

There are publicly available example Shiny applications created using these:
- The efficacy APP [Efficacy](https://genentech.shinyapps.io/teal_efficacy/)
- The safety APP [Safety](https://genentech.shinyapps.io/teal_safety/)
- The exploratory APP [Exploratory](https://genentech.shinyapps.io/teal_exploratory/)

#### Upcoming packages for consideration

The following is being worked up towards CRAN submission to be considered for later inclusion into the pharmaverse - we felt important to share here in case others are working in a similar space and would be interested to collaborate with the respective developers.

{{< pharmaverse pkg="cardinal" >}}
