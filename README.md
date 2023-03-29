
# pharmaverse website

[pharmaverse.org](https://pharmaverse.org/)

This website is maintained and governed by the pharmaverse Technology and Templates Working Group. 
Further details of this WG are available [here](https://pharmaverse.org/contribute/wg/), and all WG members are shown on our homepage.
The WG lead is considered the product owner for the website and has final say on any decisions related to the website.

For any questions or enhancements for the site, please make issues at this repo.

## Hosted sites:

This website is available at 2 locations:

- production: [pharmaverse.org](https://pharmaverse.org)
- `develop` branch: [openpharma.s3-website.us-east-2.amazonaws.com/develop/](http://openpharma.s3-website.us-east-2.amazonaws.com/develop/)

## Development / git flow

When you push to  `develop` OR make a pull request onto `develop` a github action will run which will render the site, and deploy 
it to the test server. But the test server is different depending on which route you took.

The code on `develop` is hosted to: http://openpharma.s3-website.us-east-2.amazonaws.com/develop/

The intended workflows expects that `develop` is the UAT branch where you check things pre-prod. 
While the 'build from PR` allows you to work on something very experimental and check results, before pushing it do develop.

This git flow is predicated on it being unlikely to have more than one person actively working on the site at any one time. 

**You cannot work directly on `main` branch**. The only way to push in is via a PR. And it will be denied if 
you have not come through `develop`. Any PR requires approval from one other Technology and Templates WG member.

## Data flows

### 'Scraped' data

Passive data is collected via openpharma.github.io, a sister org that is completely un-opinionated and has  
a wider remit spanning discovery to access. 
This site contains no curated data beyond names - and is instead focused on 
collecting and sharing data on open source health and related metadata (e.g. CRAN status and riskmetric scores).  
Information on the data collected is here: https://openpharma.github.io/#data. 

Data is stored in a pharmaverse AWS account.

### Package info

Curated package info is stored in the folder `data/`. `pharmaverse` packages are in the folder `data/packages`. Non-pharma packages that get a special 
mention are in `data/nonpharma`. Each package is a unique `.yaml` file. 

The general structure is:

```yaml
name: admiral
repo: pharmaverse/admiral
repo_source: github.com
docs: https://pharmaverse.github.io/admiral/cran-release/
hex: https://github.com/insightsengineering/hex-stickers/raw/main/PNG/admiral.png
task: ADaM
details: (ADaM In R Asset Library) - Modular framework to generate ADaM via R functions relying on community contributions
splash: include # this controls what is shown on the main page. Plan is to deprecate and put all hex's up
```

It should be self explanatory. Please use the categories in the site for `task:`.

### People

Info on people is in `data/people`. The `yaml` should be something like below, with the filename being the github handle.

```yaml 
name: James Black
pharmaverse_roles: tech
company: Roche
company_logo: roche.png
# Following is more a nice to have for profile pages [and optional]
linkedin: https://www.linkedin.com/in/epijim/
site: https://epijim.uk
title: People and Product Family Leader for Insights Engineering, Scientific Computing Environment Product Owner
bio: James is currently leading our pan-study codebase for insights
```

### General content of the site

Site content is in `content`. It's normal markdown files. See [markdown-guide.md](markdown-guide.md). 

### Calling package info in the site

To call a package, we have two shortcuts. `pharmaverse` means it's 'pharmaverse' - e.g. in the folder 
`data/packages`. `otherpackages` is for non-pharmaverse packages, in `data/nonpharma`.

```r
{{< pharmaverse pkg="rtables" >}}

{{< otherpackages pkg="gt" >}}
```

### Council meeting minutes

From 2023 onwards, our monthly council meeting minutes will be published in `static/council meeting minutes`.
Other static files such as images are stored in `static` also.
