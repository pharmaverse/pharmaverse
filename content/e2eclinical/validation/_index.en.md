---
title: "Validation"
date: 2018-12-29T11:02:05+06:00
weight: 7
draft: false
---

Validation and qualification are two important topics in regulatory interactions. For R package validation, 
Roche, GSK and Novartis have an ongoing collaboration to extend the ideas in the R Validation Hub. 
For example, by using new tools like `covtracer`, to automate via CICD tools validation (and re-validation) of 
packages once we feel the quality of their documentation and unit testing is sufficient. `thevalidatoR` represents 
a simplified version of this approach.

When we talk about package validation, the focus here is on the generalised functions we put in a package as a 
developer. There is also the user perspective of how to downstream quality check the usage of such packages
and functions in creating clinical reporting deliverables. For this reason, we categorise the packages separately
below, dependent on relevance. 

### Package Validation

{{< pharmaverse pkg="covtracer" >}}

{{< pharmaverse pkg="thevalidatoR" >}}

{{< pharmaverse pkg="valtools" >}}

### Quality Checking

{{< otherpackages pkg="diffdf" >}}
