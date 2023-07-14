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

Continuous Integration / Continuous Deployment and other DevOps methods can hugely help package developers
with efficiency saving, by reducing manual steps.

Under the pharmaverse GitHub org we have [admiralci](https://pharmaverse.github.io/admiralci) which offers
re-usable GitHub action workflows that may be useful to any pharmaverse package. Outside of this there is
a [PHUSE WG](https://advance.phuse.global/pages/viewpage.action?pageId=75399294) looking to broaden this
for greater community benefit.

### Synthetic Data

Generating CDISC standards synthetic data for use when developing and testing R packages can be a painful
but often necessary part of building clinical reporting R packages. 

Currently we offer [{admiral.test}](https://github.com/pharmaverse/admiral.test) which uses SDTM data from the
CDISC pilot project, but has added therapeutic area specifics such as oncology domains. The team behind
this are in the process of working up a more robust and generic solution to provide any pharmaverse package
developer with both test SDTM via [{pharmaversesdtm}](https://github.com/pharmaverse/pharmaversesdtm) and test ADaM
via [{pharmaverseadam}](https://github.com/pharmaverse/pharmaverseadam).
