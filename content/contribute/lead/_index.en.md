---
title: "Package co-lead"
date: 2018-12-29T11:02:05+06:00
weight: 2
draft: false
---

**Ownership**

The responsibilities of package co-leads or leads (both for new or existing packages) would be to decide the strategy for the package, such as scope, contribution model, testing, governance, maintenance and communication planning.
For each of these points there exists high level guidance and pharmaverse recommendations within our charter, but the owners of the package have full control over such decisions.
Pharmaverse is not a consortium that owns or maintains these packages. 

We openly welcome developers of existing packages or those initiating new packages to reach out to us.

In order for pharmaverse to be truly successful we need to encourage that any gaps in the end-to-end clinical reporting flow are addressed by new collaborative efforts, 
rather than many individual companies addressing the same problem in isolation - which at worst ends with private code and at best ends with a proliferation of open 
source code all doing the same thing.

So we actively encourage individuals or organisations that have a new idea or an existing R package within our pharmaverse scope to contact our council representatives, so that 
we can help you initiate a new collaboration with like-minded other individuals. We can also connect you with others that would be willing to contribute to testing 
your package as you progress development.

Before you contact us, please consider whether there is already an existing pharmaverse package that could solve your need, or if you could combine forces
with an existing effort to add your feature to their package. Our aim is always to reduce duplication across our packages, so as to provide a lower bar for
pharmaceutical companies to adopt R. With this in mind, expect that we would say no to including a new package in pharmaverse unless it offers unique features
and scope compared to the packages already included.

Note: we refer to R "packages" here, but you may also have other useful pieces to share (outside of packages) that enable R, such as CI/CD workflows, utility scripts or templates.

**Inclusion Criteria for pharmaverse**

If you would like to see your package included in pharmaverse, starting in January 2023 pharmaverse will have new minimum inclusion criteria:

* __Hosting and Licensing__
  * Packages must have an acceptable open source license, preferably permissive unless a packaged dependency requires a copy-left license is used. The recommended license of pharmaverse at this point in time is the [Apache License Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
  * Source code must be hosted publicly, preferably on GitHub. Wherever hosted, there must be a place to publicly report issues. We encourage new package collaborations to use the pharmaverse GitHub organization where possible. 

* __Documentation__
  * Pharmaverse packages must be well documented. All exported function must have function documentation and pass R CMD documentation requirements.
  * Packages should have a package website available, with vignettes documenting contextual use of the package code. A hex logo is preferable and we recommend a high resolution PNG here with no background whitespace and flat vertical edging.

* __Version Compatibility and Dependencies__
  * Pharmaverse packages should have a Continuous Integration (CI) action to test R CMD Check against the latest R version. It can also be a good convention to consider adding some extra workflows for recent R versions, but this is not required.
  * Incremental, semantic versioning should be used. We recommend following the strategies detailed in [R Packages](https://r-pkgs.org/lifecycle.html#version)
  * Dependency packages to install will be determined by the team and will be clearly documented. When using these, bundling of other package's source code should be avoided where possible. Package dependencies should be intentionally limited to the most necessary, such as selected tidyverse packages

* __Support and Maintenance__
  * To stay included in pharmaverse, packages must be actively maintained - by this we mean monitoring user-raised issues and addressing bug fixes within a reasonable timeframe, even if no planned active development for a stable package.
    * If a package is started in the pharmaverse, then a maintenance strategy can be organized within participating pharmaverse organizations. If a package is included in pharmaverse but owned by a individual organization, then that organization is responsible for ensuring the package is maintained. Lack of maintenance of a package will result in the package being removed from pharmaverse.
    * If an organization no longer wishes to maintain a package, but it is crucial to the pharmaverse, then another contributing organisation within the pharmaverse may accept moving the packages under the pharmaverse GitHub organization and taking on maintenance. 
  * The main branch of the package repository must be protected, and a separate development branch should be used. A restricted set of maintainers should have authority to admit changes to the main branch.
  * The main branch of the package should additionally have extra CI automated testing for package releases. 
    * For example, testing R CMD Check on Windows, Linux, and MacOS. This could also be achieved via the CRAN checks
    * See tips and possible re-use on our [Developers](https://pharmaverse.org/e2eclinical/developers/) page

* __CRAN Acceptability__
  * Being admitted on CRAN gives confidence of a level of maturity of the package and may help for it to be viewed more favourably for industry adoption, but is not a stringent requirement as some package developers have rationale not to pursue a CRAN submission. 
  * If admitted to CRAN, the package must stay on CRAN.
    * _Note: If a pharmaverse package is archived due to the archival of a dependency, we understand that is not the fault of the pharmaverse package authors. That said, if a dependency becomes a systemic problem, steps should be taken to eliminate that package as a dependency_

If you meet all of the above criteria, one of our website team will share your application with our pharmaverse community via our Slack to determine whether
our community would like to accept the package into pharmaverse. 

We additionally have other recommended development practices, that while not required are encouraged for new pharmarverse packages or new package collaborations.

* The development team should agree on a similar style of programming for which the pharmaverse site will offer non-binding recommendations (e.g. lintr compatible and with a common vocabulary for pharma-specific standards like CDISC object naming), so as to achieve a consistent look and feel across modules. Note whilst this would be advantageous for new code from the point of launching pharmaverse onwards, it would be unrealistic to expect any existing packages to rework their code base to accommodate this.
* Where relevant, development efforts would use synthetic CDISC data (see our [Developers](https://pharmaverse.org/e2eclinical/developers/) page), and then users from each developer or tester company could optionally take the code modules back to their own restricted systems to test out using their data. The learnings from testing would be shared openly, without sharing any patient information.
* For co-developed packages, development should be done in a shared development area to ensure a consistent environment. This could be a through the use of renv, or a Docker container based upon a custom-built Docker image running an agreed R version. 
* There should be no specific tie to any company-specific statistical computing environment or internal validation/qualification process. Packages in pharmaverse are intended to be suitable for any company's environment or process. If binding tightly to company process or standards, the package scope may be too broad. 

For other best practices, we encourage you to follow guidance from both [R Packages](https://r-pkgs.org/) and [rOpenSci](https://devguide.ropensci.org/building.html).
Pharmaverse does not have strict style requirements, but we encourage package authors to follow the [Tidyverse style guide](https://style.tidyverse.org/).

**New Collaborations**

For new package collaborations, beyond our charter we also offer the following to help you get started:
* A [collaboration contract template](https://github.com/pharmaverse/pharmaverse/blob/main/content/contribute/Pharmaverse%20Collaborative%20Agreement%20(template).docx) - 
as you see there our recommendation is to target permissive licensing (such as [MIT](https://opensource.org/licenses/MIT) or 
[Apache 2.0](https://opensource.org/licenses/Apache-2.0)), but this is only a template and all decisions need to be considered with the respective legal groups of the 
companies involved.
* A [GitHub template](https://github.com/pharmaverse/admiraltemplate) focused on the {admiral} family of packages and their conventions, but could be useful as an
example of possible approaches to use, such as Issue and Pull Request templates.
* Our [Developers](https://pharmaverse.org/e2eclinical/developers/) page offers packages and resources that could be re-used when creating new pharmaverse packages.
* Example [contribution model](https://pharmaverse.github.io/admiral/CONTRIBUTING.html) - this is what is used for the {admiral} package and includes links to developer
vignettes around programming strategy, unit testing guidance and git usage. This could serve as an example to consider if you will open your package for contributions, which we would recommend.
* Recommended [support model](https://pharmaverse.org/support/) - this is important to give users a consistent experience across pharmaverse packages, and if packages 
are not kept well maintained and supported then they are likely to be removed from the pharmaverse package list.
* Option to include a pharmaverse [hosted shield/badge](https://pharmaverse.org/contribute/badges/) for your package which shows users you are part of pharmaverse 
thus adding an extra level of credibility.
