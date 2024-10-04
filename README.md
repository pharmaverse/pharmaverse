# Pharmaverse Website

## Overview

The [pharmaverse.org](https://pharmaverse.org/) website is maintained and governed by our website community. For more details on community involvement, please visit our [contribution page](https://pharmaverse.org/contribute/wg/). The community lead serves as the product owner for the website and has the final say on any website-related decisions.

For questions or enhancement suggestions, please create issues in this repository.

## Hosted Sites

The website is available at two locations:

- Production: [pharmaverse.org](https://pharmaverse.org)
- `develop` branch: [pharmaverse-staging-test.netlify.app](https://pharmaverse-staging-test.netlify.app/)

## Development / Git Flow

### Workflow
This section outlines the development workflow that is followed to streamline the process of ensuring efficient collaboration, continuous integration, and smooth deployment.

- Push to `develop` or create a pull request onto `develop`.
- The GitHub Action is then triggered, rendering and deploying the site to the deployment server. For `main` branch, the deployment server is [GitHub Pages](https://pages.github.com/) and for `develop` branch, it is [Netlify](https://www.netlify.com/).
- The `develop` branch is considered the UAT branch for pre-production checks.

**Important notes:**

- The git workflow is designed with the assumption that typically only one person will be actively working on the site at any given time.
- Direct work on the `main` branch is not allowed.
- All changes must come through `develop` via a pull request.

### Pull Request Requirements

- PRs require approval from one other Technology and Templates WG member.
- PRs will be denied if they haven't come through the `develop` branch.

## Data Flows

### Scraped Data

The passive data is collected via [OpenPharma](https://openpharma.github.io/), which is a sister organization that:

- Has a completely un-opinionated approach and a wider remit spanning discovery to access.
- Contains no curated data beyond package names.
- Focuses on collecting and sharing:
  - Open source health data
  - Related metadata (e.g., CRAN status, riskmetric scores)

For detailed information on the collected data, visit: https://openpharma.github.io/#data

### Package Info

Curated package info is stored in the `data/` folder.

- `data/packages/` contains `pharmaverse` packages details
- `data/nonpharma/` contains non-pharma packages details

Each of the packages has a unique `.yaml` file

Example structure:

```yaml
name: admiral
repo: pharmaverse/admiral
repo_source: github.com
docs: https://pharmaverse.github.io/admiral/cran-release/
hex: https://github.com/insightsengineering/hex-stickers/raw/main/PNG/admiral.png
task: ADaM
details: (ADaM In R Asset Library) - Modular framework to generate ADaM via R functions relying on community contributions
splash: include # this controls what is shown on the main page. The plan is to deprecate and put all the hexes up.
```

### Deployment

The `main` branch is deployed to [GitHub Pages](https://pages.github.com/), while the `develop` branch is deployed to [Netlify](https://www.netlify.com/). [Hugo](https://gohugo.io/) creates the static site in the `public` directory in the root of the project. This includes the HTML files, and assets such as images, CSS files, and JavaScript files.

- For the `main` branch, the [secret token](https://github.com/peaceiris/actions-gh-pages/tree/v3/#supported-tokens) is securely stored in the GitHub environemnt.
- For the `develop` branch, the Netlify authorization token and site id are also securely stored in the GitHub environemnt.

### People

- Info on people is in `data/people/`
- Filename should be the GitHub handle

Example structure:

```yaml
name: James Black
pharmaverse_roles: tech
company: Roche
company_logo: roche.png
# Following is more of a nice to have for profile pages [and optional]
linkedin: https://www.linkedin.com/in/epijim/
site: https://epijim.uk
title: People and Product Family Leader for Insights Engineering, Scientific Computing Environment Product Owner
bio: James is currently leading our pan-study codebase for insights
```

## Site Content

The site content is in the `content/` directory. It contains standard markdown files. See [markdown-guide.md](markdown-guide.md) for more information.

### Calling Package Info in the Site

To reference packages in the site content, use the following shortcodes:

- For pharmaverse packages (located in `data/packages/`):

```r
{{< pharmaverse pkg="rtables" >}}
```

- For non-pharmaverse packages (located in `data/nonpharma/`):

```r
{{< otherpackages pkg="gt" >}}
```

These shortcodes will automatically pull and display the relevant package information from the corresponding YAML files.

## Council Minutes of Meeting

- From 2023 onwards, monthly council meeting minutes are published in `static/council meeting minutes/`
- Other static files (e.g., images) are stored in the `static/` directory

## Contributing

We welcome contributions from the community! To ensure a smooth process, please review our [CONTRIBUTING.md](.github/CONTRIBUTING.md) guide for detailed instructions on how to get involved.
