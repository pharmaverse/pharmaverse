# Contributing to Pharmaverse Website

First off, thank you for considering contributing to the Pharmaverse Website! We appreciate your time and effort in improving this project. The following is a set of guidelines for contributing to the repository.

## Table of Contents

1. [Governance](#governance)
1. [Branching and deployment strategy](#branching-and-deployment-strategy)
1. [Code of Conduct](#code-of-conduct)
1. [How can I contribute](#how-can-i-contribute)

## Governance

[Access](https://github.com/pharmaverse/pharmaverse/settings/access) to the repo is limited to the council (who are GH organisation admins), and 
members of the Github Team [website-maintainers](https://github.com/orgs/pharmaverse/teams/website-maintainers). Any other contributions must be made
as a pull request from a fork.

## Branching and deployment strategy

1. The default branch is `develop`, and all PRs should go through `develop` before being merged to `main`.
1. Our GH Action [pipeline](https://github.com/pharmaverse/pharmaverse/blob/develop/.github/workflows/pipeline.yml) deploys from `main` and `develop` (to prod and a testing space)
1. Branches should be deleted once they are deployed to `develop`
1. We use [issue templates](https://github.com/pharmaverse/pharmaverse/tree/develop/.github/ISSUE_TEMPLATE)

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). 
By participating, you are expected to uphold this code. Please report any unacceptable behavior to [a member of the pharmaverse council](https://pharmaverse.org/contribute/council/).

## How Can I Contribute?

### Reporting Bugs

If you encounter any bugs, please report them by creating a new issue in the [GitHub Issues](https://github.com/pharmaverse/pharmaverse/issues) section. Include as much detail as possible:

- Steps to reproduce the bug
- Expected and actual behavior
- Screenshots, if applicable
- Your environment (OS, browser, etc.)

### Suggesting Enhancements

We welcome suggestions for new features or improvements! Please check the existing issues first to see if your idea has already been suggested. If not, feel free to create a new issue with the following details:

- A clear and concise description of the enhancement
- The problem or use case it addresses
- Any related or similar features in other projects

### Submitting Pull Requests

If you're ready to contribute code, follow these steps:

1. Fork the repository to your GitHub account.
2. Clone your fork to your local machine.
3. Create a new branch from `develop` for your feature or bugfix.
4. Make your changes following the [style guides](#style-guides).
5. Test your changes locally.
6. Commit your changes with a descriptive commit message.
7. Push your branch to GitHub.
8. Create a Pull Request (PR) from your branch to the `develop` branch of the original repository.

Your PR will be reviewed by members of the tech-wg team. Please be prepared to make revisions based on feedback.

## Getting Help

If you need help, you can reach out to the tech-wg team through the following channels:

- GitHub Discussions in the repository
- [Slack Channel](https://pharmaverse.slack.com/)
- [pharmaverse.org](https://pharmaverse.org)
