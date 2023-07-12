---
title: "Developers"
date: 2018-12-29T11:02:05+06:00
weight: 7
draft: false
---

This section of our pharmaverse recommended list is dedicated to those packages less relevant for individual
clinical reporting end users, and instead more relevant to other roles such as package developers or admins
maintaining package repositories.

### Package Validation

Validation and qualification are two important topics in regulatory interactions. For R package validation, 
there are example tools like `covtracer` to automate via CI/CD tools validation (and re-validation) of 
packages once we feel the quality of their documentation and unit testing is sufficient. `thevalidatoR` represents 
a simplified version of this approach. There are also packages to support decisions around risk assessment when
approaching validation strategy for R packages.

{{< pharmaverse pkg="covtracer" >}}

{{< pharmaverse pkg="thevalidatoR" >}}

{{< pharmaverse pkg="valtools" >}}

{{< pharmaverse pkg="riskmetric" >}}

{{< pharmaverse pkg="riskassessment" >}}

### CI/CD

Placeholder for continuous integration / continuous deployment and other DevOps topics.

### Synthetic Data

Placeholder for generating CDISC standards synthetic data for use when developing and testing R packages.
