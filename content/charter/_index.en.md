---
title: "Our Charter"
date: 2021-09-09T11:02:05+06:00
icon: "fas fa-book" # fontawesome icon : https://fontawesome.com/icons
description: "Pharmaverse charter covering our high level objective and scope, along with recommendations for new pharmaverse collaborations."
weight: 1
# type dont remove or customize
type : "docs"
---

### Objective

The objective of pharmaverse is to bring together a collection of pharmaceutical industry representatives to agree on a curated and opinionated subset of open-source software packages and codebases, which would be based on the R language and those that we believe are the most suitable for the industry to adopt in order to deliver the clinical data pipeline. If suitable tools do not already exist within the open-source ecosystem, these gaps can be identified. Then via collective collaboration (around development and testing), new solutions may be developed with the aim to reduce duplication of efforts and gain increased harmonization to the way we work across the industry.

There would be no commercial interest from contributors to any of these efforts, as all code will be targeted for open-source release under a permissive license.

The benefits would be as follows:
*	Industry collaboration leading to more robust and well-thought-out solutions with shared development and maintenance efforts, thus distributing the cost and burden across multiple organizations
*	Greater potential to bring unified solutions to regulators demonstrating collaboration between industry and standards organization to form workable solutions
*	Better enablement of our medicines to reach patients and society faster through the pooling of skills and talents and accelerating how the industry generates insights from patients’ data - and to do this in a more sustainable way
*	Attraction of the next generation of great software developers and data scientists to Pharma and providing increased transparency of our industry 

### Scope

The initial focus of pharmaverse is on the journey from CRF through to submission for clinical trial analysis reporting via R packages. We intend to provide a pathway to share efforts to build open-source codebases, to identify and rectify gaps in available tools, and then collaboratively build and maintain any additional codebases that complete this end-to-end workflow. This could include, for example, solutions covering SDTM mapping, ADaM derivations, TLG production, and enabling eSub for both today's expectations and potentially through interactive tools in the future. It also could include utility packages that may help this dataflow in any way, such as diffdf, which performs data frame comparisons in a way similar to PROC COMPARE is SAS®. 

The R packages recommended under pharmaverse will fall under one of the following:
| Category    | Description | Examples    | 
| ----------- | ----------- | ----------- |
| External to pharma      | Transcends specifically pharma needs       | tidyverse, diffdf |
| Pharma-specific independent of pharmaverse   | Created for use in pharma, but not necessarily following the pharmaverse charter and recommendations  | rtables, xportr |
| Pharma-specific under pharmaverse   | Created for use in pharma, following the pharmaverse charter and recommendations   | admiral |

The aim will not be to agree on cross-industry implementations of CDISC standards, as each company may have their own repositories of chosen implementation rules and specifications. Any open-source package or codebase would knowingly act as a starting point for code re-use, yet will never be able to cover all eventualities. By following this principle, we would allow the framework to take on a level of standard agnosticism, which improves the likelihood of remaining future-proof.

The pharmaverse environment should be easily locatable and accessible via a single site. Some packages will already exist on CRAN or GitHub, whereas others are either in ongoing development or brand-new packages that will come from future pharmaverse collaborations. For the already open-source released packages, we could collate and explain clear use cases for clinical trial reporting. Some may cover similar purposes (e.g. there are numerous offerings for TLGs) so we should attempt to share the differences and unique merits to help a company or user choose which packages or tools they might adopt.

### Contributions

There are different levels of commitment companies and individuals can make towards pharmaverse, as detailed below:

| Commitment Level    | Description |  
| ----------- | ----------- |  
| Council representative	| Strategy and decision-making body across pharmaverse, e.g. to highlight gaps, initiate collaborations, and to select pharmaverse preferred packages |
| Package co-lead	| Strategy lead and maintainer for a specific pharmaverse package or codebase |
| Individual contributor | Development contributor to any pharmaverse package or codebase |

For the pharmaverse council, we will enact this with members from a collection of representatives from across Pharma industry companies (not limited to sponsor companies). There will be a limit to the number of members from each single company, to ensure a fair and representative voice is given across the industry. The founding organisation representatives will define the exact structure and responsibilities of the council. There will be clear minimum expectations set of each council representatives, so we protect against unequal contributions. 

The added benefits of contributing to pharmaverse range from an individual having the opportunity to share their code wider and make new connections across the industry, through to a company getting early awareness and access to prototyping and influencing future solutions.

### Development

Contributing to pharmaverse is open to all organizations working within the clinical trial analysis pipeline, creating relevant code. An inclusive model will be used to help identify gaps and, from this endorsement, active participation on individual codebase gaps (like the admiral project) are on an opt-in basis, i.e. just because a company contributes to certain pharmaverse projects it doesn’t mean you have to contribute to all. 

The pharmaverse recommendation is for all our new code collaborations to be hosted under github.com/pharmaverse. This forms a neutral home for all open-source repos falling under our scope. The admins of this org would include pharmaverse council members.

The preferred model of development of new pharmaverse offerings would be to initiate projects as open-source from the start of development or as soon as a stable first draft is available. This is coupled with an expectation of engagement of other companies in ongoing testing and possibly via supporting development efforts with pull requests/issues/feedback. This way we result in more robust code for which many companies have already engaged with during the development process, and it has a higher chance of successful embedding. In addition, the open and transparent development reduces the chance of others creating duplicative parallel packages.

The development team should agree on a similar style of programming for which the pharmaverse site will offer non-binding recommendations (e.g. lintr compatible and with a common vocabulary for pharma-specific standards like CDISC object naming), so as to achieve a consistent look and feel across modules. Note whilst this would be advantageous for new code from the point of launching pharmaverse onwards, it would be unrealistic to expect any existing packages to rework their code base to accommodate this.

Where relevant, development efforts would use synthetic CDISC data, and then users from each developer or tester company would take the code modules back to their own restricted systems to test out using real patient data. The learnings from testing would be shared openly, without sharing any patient information.

For co-developed packages, development should be done in a shared development area to ensure a consistent environment, e.g. a Docker container based upon a custom-built Docker image running an agreed R version. The development team should also consider compatibility with different operating systems, such as Linux or Windows.   

There should be no specific tie to any company-specific statistical computing environment or internal validation/qualification process. The Github repos will have CI/CD (e.g. GitHub actions) to run unit tests and test package builds against an open-source container with the pharmaverse endorsed environment layered (e.g. versioned rocker + pharmaverse). The default branch (e.g. master or main) will be protected against merges that fail CI/CD checks. Individual companies are welcomed to layer additional private CI/CD jobs if needed to meet their internal requirements as long as that is done without adding code specific to one company to the public repo. 

Dependency packages to install will be determined by the team and will be clearly documented. When using these, no source code should be copied and other packages shouldn’t be bundled into releases, as we prefer all pharmaverse packages to target permissive licensing (preferably MIT). 

### Risks & Testing

Each respective company should decide whether legal contracts are required, if a decision is made to not initiate development open source and in the public domain. Any company involved should be free to decide to withdraw from any pharmaverse collaboration at any stage.

Testing of any code has to be a key consideration and the pharmaverse council will define guidelines around ideal documentation and unit testing strategy to give sufficient reliability. Packages initiated to fill gaps in the pharmaverse will need to meet the required standards. It will also be necessary to make available any evidence generated on the reliability and methods executed, as this transparency would in turn encourage wider engagement and adoption of the package. 

Liability for the reliability of the pharmaverse environment remains with the users, but to help limit risk, package dependencies should be intentionally limited to the most necessary, such as selected tidyverse packages.  

For any co-development effort, there should be no need to access any other company’s systems and no individual company patient-level data should be shared. 

### Governance & Maintenance

The pharmaverse recommendation is for the control of the master branch of any package repo to be limited to a small number of “Package co-leads”, preferably from different companies, that have a shared need to invest in a common solution. Each respective development team is ultimately responsible for planning the ongoing maintenance strategy, but representatives to support this could come in from other companies, such as those involved in testing. Feedback or pull requests could come from any “Individual contributor”.

If you imagine the case of a codebase (as opposed to a single package), then a similar model to Wikipedia could be imagined, where numerous representatives from across companies each take responsibility to “garden” a domain and ensure any user contributions are appropriate to be accepted into the codebase.

### Communications 

Each development team will agree a cadence for their own releases and specific targeted communications. The steering committee should then supplement this with an aligned method of regularly communicating iterations of the pharmaverse environment out to the industry, as well as the wider community of Open Pharma aligned projects.

### Timing

The timing of starting to initiate the pharmaverse should happen as early as possible after agreeing to the charter, as there are already components out there in open-source releases that could benefit from being collated as part of this. We already start to see a proliferation of different packages solving very similar problems, so the earlier we can promote this spirit of early collaboration, the more effort we can save. We can then subsequently use new releases, such as admiral planned for the end of 2021, to help further raise awareness of the pharmaverse and to start to embed this into the psyche of all industry programmers - which will require many years of reinforcement.

_Why is 2021 the right time for this?_ The industry has never been more conducive to cross-company collaboration (considering efforts like PHUSE, TransCelerate, Accumulus, and more). Nowhere was this witnessed more than in how the industry and regulators partnered to develop guidance with urgency around how to manage the impact of the COVID-19 pandemic. Furthermore, in the field of clinical reporting, we stand at a possible unique point in time where many companies are starting to embrace alternatives to what has been their programming language of choice for 30+ years, by integrating open-source languages such as R. At this juncture, we have the opportunity not to all take separate routes on this journey, as may have been done before. The pharmaverse offers a chance to come together collectively as an industry at a magnitude that’s never been seen before in clinical study programming. Our patients are waiting and expecting.

