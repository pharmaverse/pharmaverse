---
title: "Package co-lead"
date: 2018-12-29T11:02:05+06:00
weight: 2
draft: false
---

We openly welcome developers of existing packages or those initiating new packages to reach out to us.

In order for pharmaverse to be truly successful we need to encourage that any gaps in the end-to-end clinical reporting flow are addressed by new collaborative efforts, 
rather than many individual companies addressing the same problem in isolation - which at worst ends with private code and at best ends with a proliferation of open 
source code all doing the same thing.

So we actively encourage individuals or organisations that have an idea for a new R package within our pharmaverse scope to contact our council representatives, so that 
we can help you initiate a new collaboration with like-minded other individuals. We can also connect you with others that would be willing to contribute to testing 
your package as you progress development.

Before you contact us, please consider whether there is already an existing pharmaverse package that could solve your need, or if you could combine forces
with an existing effort to add your feature to their package. Our aim is always to reduce duplication across our packages, so as to provide a lower bar for
pharmaceutical companies to adopt R. With this in mind, expect that we would say no to including a new package in pharmaverse unless it offers unique features
and scope compared to the packages already included.

If you would like to see your package included in pharmaverse, starting in January 2023 pharmaverse will have new minimum inclusion criteria:

* __Hosting and Licensing__
  * Packages must have an acceptable open source license, preferably permissive unless a packaged dependency requires a copy-left license is used. The recommended license of pharmaverse at this point in time is the [Apache License Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
  * Source code must be hosted publicly, preferably on GitHub. Wherever hosted, there must be a place to publicly report issues. We ecnourage new package collaborations to use the pharmaverse GitHub organization where possible. 

* __Documentation__
  * Pharmaverse packages must be well documented. All exported function must have function documentation and pass R CMD documentation requirements.
  * Packages should have a package website available, with vignettes documenting contextual use of the package code.  

* __Version Compatibility and Dependencies__
  * Pharmaverse packages will follow the same R version support schedule as the tidyverse. Tidyverse packages are maintained to generally support the current version, devel version, and four previous minor release versions of R (see post [here](https://www.tidyverse.org/blog/2019/04/r-version-support/))
    * This requirement will _start_ in January 2023, meaning that the minimum version compatibility of R initially will be version 4.2.2 ("Innocent and Trusting"). Packages will not be required to support previous R versions at this point, rather R version 4.2.2 must be supported for another 4 minor releases.
  * Incremental, semantic versioning should be used. We recommend following the strategies detailed in [R Packages](https://r-pkgs.org/lifecycle.html#version)
  * Dependency packages to install will be determined by the team and will be clearly documented. When using these, bundling of other package's source code should be avoided where possible, as we prefer all pharmaverse packages to target permissive licensing (preferably MIT). 

* __Style__
  * While pharmaverse does not have strict style requirements, we encourage package authors to follow the [Tidyverse style guide](https://style.tidyverse.org/)

* __Support and Maintenance__
  * To stay included in pharmaverse, packages must be actively maintained.
    * If a package is started in the pharmaverse, then a maintenance strategy can be organized within participating pharmaverse organizations. If a package is included pharmaverse but owned by a individual organization, then that organization is responsible for ensuring the package is maintained. Lack of maintenance of a package will result in the package being removed from pharmaverse.
    * If an organization no longer wishes to maintain a package, but it is crucial to the pharmaverse, then pharmaverse may accept moving the packages under the pharmaverse Github organization and taking on maintenance. 
  * The main branch of the package repository must be protected, and a separate development branch should be used. A resticted set of maintainers should have authority to admit changes to the main branch.
  * The main branch of the package should additionally have Continuous Integration (CI) requirements in the form of automated testing. 
    * At a minimum, the CI actions should test R CMD Check on Windows, Linux, and MacOS.
    * In line with version requirements, the CI actions should test the appropriate versions of R. _Starting in January 2023, pharmaverse will offer template GitHub actions that test these minimum requirements_

* __CRAN Acceptability__
  * A pharmaverse package is considered a __pharmaverse candidate__ until it is admitted to CRAN. 
  * Once admitted to CRAN, the package must stay on CRAN.
    * _Note: If a pharmaverse package is archived due to the archival of a dependency, we understand that is not the fault of the pharmaverse package authors. That said, if a dependency becomes a systemic problem, steps should be taken to eliminate that package as a dependency_
  * Note that long term, CRAN may not be the ultimate destination for pharmaverse packages, but given that CRAN is still the defacto location for retrieving R packages, pharmaverse packages must be admitted to CRAN and comply with CRAN requirements.

* If you meet all of the above criteria, one of our respective working groups will review your package and determine whether the scope is suitable and the package
adds sufficient value to pharmaverse. 

We additionally have other recommended development practices, that while not required are encourage for new pharmarverse packages or new package collaborations.

* The development team should agree on a similar style of programming for which the pharmaverse site will offer non-binding recommendations (e.g. lintr compatible and with a common vocabulary for pharma-specific standards like CDISC object naming), so as to achieve a consistent look and feel across modules. Note whilst this would be advantageous for new code from the point of launching pharmaverse onwards, it would be unrealistic to expect any existing packages to rework their code base to accommodate this.
* Where relevant, development efforts would use synthetic CDISC data, and then users from each developer or tester company would take the code modules back to their own restricted systems to test out using real patient data. The learnings from testing would be shared openly, without sharing any patient information.
* For co-developed packages, development should be done in a shared development area to ensure a consistent environment. This could be a through the use of renv, or a Docker container based upon a custom-built Docker image running an agreed R version. 
* There should be no specific tie to any company-specific statistical computing environment or internal validation/qualification process. Packages in pharmaverse are intended to be suitable for any company's environment or process. If binding tightly to company process or standards, the package scope may be too broad. 

For other best practices, we encourage you to follow guidance from both [R Packages](https://r-pkgs.org/) and [rOpenSci](https://devguide.ropensci.org/building.html).
  
The responsibilities of package co-leads (both for new or existing packages) include:
* Deciding the strategy for the package, such as scope, contribution model, testing, governance, maintenance and communication planning - for each of these points 
there exists high level guidance and pharmaverse recommendations within our charter.

For new package collaborations, beyond our charter we also offer the following to help you get started:
* A [collaboration contract template](https://github.com/pharmaverse/pharmaverse/blob/main/content/contribute/Pharmaverse%20Collaborative%20Agreement%20(template).docx) - 
as you see there our recommendation is to target permissive licensing (such as [MIT](https://opensource.org/licenses/MIT) or 
[Apache 2.0](https://opensource.org/licenses/Apache-2.0)), but this is only a template and all decisions need to be considered with the respective legal groups of the 
companies involved.
* A [GitHub template](https://github.com/pharmaverse/admiraltemplate) focused on the {admiral} family of packages and their conventions, but could be useful as an
example of possible approaches to use, such as Issue and Pull Request templates.
* [Developer utilities](https://pharmaverse.github.io/admiraldev/) and [CI/CD workflows](https://pharmaverse.github.io/admiralci/) again focused on the {admiral} family of packages, but could be useful to re-use.
* Example [contribution model](https://pharmaverse.github.io/admiral/articles/contribution_model.html) - this is what is used for the {admiral} package and includes 
vignettes around programming strategy, unit testing guidance and git usage. This model will evolve over time as the admiral team learn from the experience, but could 
serve as an example to consider if you will open your package for contributions, which we would recommend.
* Recommended [support model](https://pharmaverse.org/support/) - this is important to give users a consistent experience across pharmaverse packages, and if packages 
are not kept well maintained and supported then they are likely to be removed from the pharmaverse package list.
* R package validation strategy - we currently are connecting with several companies and industry working groups to assess whether there could be an industry 
recommended approach to R package validation utilising open source packages. Until we have this, we'd be happy to share our learnings and current strategies in this area.
* Option to include a pharmaverse [hosted shield/badge](https://pharmaverse.org/contribute/badges/) for your package which shows users you are part of pharmaverse 
thus adding an extra level of credibility.
