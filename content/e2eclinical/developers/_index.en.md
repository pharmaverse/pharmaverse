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

For a GitHub specific CI example related to package validation see:

{{< pharmaverse pkg="thevalidatoR" >}}

### Synthetic Data

Generating CDISC standards synthetic data for use when developing and testing R packages can be a painful
but often necessary part of building clinical reporting R packages.

We offer the following packages that as a basis re-used SDTM data from the CDISC pilot project, with added
therapeutic area specifics such as oncology domains. These have then been ran through {admiral} templates
to provide consistent ADaM test data.

{{< pharmaverse pkg="pharmaversesdtm" >}}

{{< pharmaverse pkg="pharmaverseadam" >}}

### Developer Utilities

[{admiraldev}](https://pharmaverse.github.io/admiraldev/) offers numerous developer utilities focused on the {admiral}
family of packages, but some could be useful to re-use. Take a look at the reference page to explore further.

There is an ongoing effort [{roxytractor}](https://github.com/pharmaverse/roxytractor) to extract information from
{roxygen2} documentation within R packages, simplifying the process of converting documentation into structured data
efficiently. This could be useful in activities such as training GenAI/LLM solutions.
