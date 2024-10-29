# Contributing to Pharmaverse Website

Thank you for considering contributing to the Pharmaverse Website! We truly appreciate your efforts in improving this project. Below are guidelines to help you understand how you can contribute and collaborate with us effectively.

## Table of Contents

1. [Governance](#governance)
2. [Branching and Deployment Strategy](#branching-and-deployment-strategy)
3. [Code of Conduct](#code-of-conduct)
4. [How Can I Contribute](#how-can-i-contribute)
   - [Reporting Bugs](#reporting-bugs)
   - [Suggesting Enhancements](#suggesting-enhancements)
   - [Submitting Pull Requests](#submitting-pull-requests)
5. [Getting Help](#getting-help)

---

## Governance

Access to the repository is restricted to members of the council (GitHub organization admins) and the [website-maintainers team](https://github.com/orgs/pharmaverse/teams/website-maintainers). Any external contributions must be made through pull requests from a forked repository. For further information on access, see the [repo access settings](https://github.com/pharmaverse/pharmaverse/settings/access).

---

## Branching and Deployment Strategy

1. **Default Branch**: The default branch is `develop`. All pull requests (PRs) must go through the `develop` branch before being merged into `main`.
2. **Deployment Pipeline**: The GitHub Actions [pipeline](https://github.com/pharmaverse/pharmaverse/blob/develop/.github/workflows/pipeline.yml) deploys code from the `main` and `develop` branches (to production and a testing space).
3. **Branch Lifecycle**: Once a branch has been deployed to `develop`, it should be deleted.
4. **Issue Tracking**: The [issue templates](https://github.com/pharmaverse/pharmaverse/tree/develop/.github/ISSUE_TEMPLATE) is utilised for reporting bugs and requesting features.

---

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). By participating in this project, you are expected to uphold this code. If you encounter any violations, please report them to [a member of the Pharmaverse council](https://pharmaverse.org/contribute/council/).

---

## How Can I Contribute?

### Reporting Bugs

If you encounter a bug, please report it by opening a new issue in the [GitHub Issues](https://github.com/pharmaverse/pharmaverse/issues) section. Be sure to include the following:

- Steps to reproduce the bug.
- Expected and actual behavior.
- Screenshots (if applicable).
- Your environment (operating system, browser, etc.).

### Suggesting Enhancements

We welcome new feature suggestions! Before creating a new suggestion, please check if your idea has already been proposed. If not, feel free to open a new issue with the following:

- A clear and concise description of the enhancement.
- The problem or use case it addresses.
- Any related features or similar implementations in other projects.

### Submitting Pull Requests

If you're ready to contribute code, please follow these steps:

1. Fork the repository to your GitHub account.
2. Clone the fork to your local machine.
3. Create a new branch from `develop` for your feature or bugfix.
4. Follow our [style guidelines](#style-guides) while making your changes.
5. Test your changes locally.
6. Commit your changes with a clear and descriptive message.
7. Push the changes to your fork.
8. Submit a pull request (PR) from your branch to the `develop` branch of the main repository.

Your pull request will be reviewed by members of the tech-wg team, and you may be asked to make revisions based on the feedback.

---

## Getting Help

If you need any assistance or have questions, feel free to reach out through the following channels:

- GitHub Discussions in this repository.
- [Slack Channel](https://pharmaverse.slack.com/).
- [Pharmaverse Website](https://pharmaverse.org).
