---
title: "Package governance"
date: 2026-11-18T09:00:00+00:00
weight: 6
draft: false
---

<!-- Keep table cells from breaking words mid-word on this page; on small screens, tables scroll sideways instead. -->
<style>
.content table th, .content table td, .content table td * { word-break: normal; overflow-wrap: normal; }
@media (max-width: 767px) { .content table { display: block; overflow-x: auto; } }
</style>

The pharmaverse Package Governance Working Model sets out how packages enter pharmaverse, how their endorsement is maintained, and how the council manages packages that no longer meet the standards the community depends on.

- **Status:** Approved by the pharmaverse council in June 2026
- **Version:** 1.2
- **Review cycle:** Twice a year
- **Applies to:** All packages seeking or holding pharmaverse endorsement

Lifecycle tags and quality badges will appear on package pages after the first semiannual review under this model.
The quality badges described here are not the same as the [pharmaverse member shields](/contribute/badges/) that packages can show in their READMEs.

Changes to this model follow the same RFC-and-vote process used for package proposals (see [section 2.3](#rfc-process)).
To propose a change, contact the council at [pharmaverse.council@phuse.global](mailto:pharmaverse.council@phuse.global).

### 1. Purpose and Design Principles

This document defines the pharmaverse Package Governance Working Model — a framework that governs how packages enter the pharmaverse ecosystem, how their endorsement is maintained, and how the council manages packages that are no longer meeting the standards the community depends on.

The model is designed around three core tensions that any governance framework for an open-source ecosystem must resolve:

- Openness vs. credibility — pharmaverse must be welcoming to new contributors while maintaining standards that make its endorsement meaningful to regulators and sponsors.
- Community ownership vs. council accountability — packages are built by the community, but pharmaverse's name is on them. The council is accountable for what it endorses.
- Engagement vs. quality — the system must never make teams feel punished for contributing, while being honest about quality and fit.

#### Design principles

- Signal without shaming. Tags and assessments frame quality as a journey, not a verdict.
- Teams are partners, not subjects. The council stewards packages alongside teams, not above them.
- Default is stability. Tags and endorsement status only change when there is documented reason.
- Burden of proof flows both ways. The council must justify removing endorsement; teams must justify retaining it at renewal.
- Semiannual cadence is the ceiling, not the floor. Reviews happen twice a year at most — healthy packages require minimal discussion.

### 2. Entry Gate — Proposing a New Package

Any individual, team, or organization may propose a package for pharmaverse endorsement. The entry process is designed to be rigorous enough to protect the ecosystem's credibility, while transparent and community-informed enough to keep contributors engaged.

#### 2.1 The Value Proposition Requirement

Every proposal must address two questions before it reaches the council. Failure to address either will return the proposal to the submitter for revision.

| # | Question | What the proposal must demonstrate |
| :---: | --- | --- |
| **1** | **Does a gap exist?** | Evidence that no existing pharmaverse or widely-adopted CRAN package adequately solves this problem for the target use case. |
| **2** | **Does this package fill it better?** | A clear articulation of what the package does that existing solutions do not — and why that difference matters for pharma workflows. |

**Note:** The package must be available on CRAN or Bioconductor (or have a credible plan to submit within 3 months of pharmaverse entry).

#### 2.2 The Saturation Problem

Pharmaverse will not endorse packages in already-saturated domains unless the proposal demonstrates substantial differentiation. Saturation is defined as three or more existing solutions already addressing the same core use case within the pharmaverse or adjacent ecosystem.

> ⚠ **Saturation example**
>
> TLF generation currently has multiple solutions in the ecosystem. A new TLF package would face a high bar — it must offer a materially different approach, not an incremental improvement. The RFC process (section 2.3) is where the community makes this case.

The saturation threshold is qualitative, not a hard count. The council judges "substantial differentiation" based on RFC community input and its own assessment. Existing package maintainers in the same domain are explicitly invited to participate in the RFC.

#### 2.3 The RFC Process {#rfc-process}

All new package proposals go through an open Request for Comments (RFC) period before any council vote. This is the primary mechanism for community involvement.

1. **Proposal Submission**
   - Proposer submits a structured proposal to the pharmaverse council covering: package purpose, gap analysis, overlap assessment, maintainer team and organizational backing, and initial quality plan.
2. **RFC Publication**
   - Council publishes the proposal to the pharmaverse community for a minimum 4-week open comment period.
   - Maintainers of overlapping packages are directly notified and invited to respond.
   - Community members may raise support, concerns, or evidence of duplication.
3. **Council Review**
   - Council reviews RFC feedback and meets to assess the proposal (3 possible outcomes):
     - Approved — Package enters as Maturing. Maintainer Covenant signed. Initial tags assigned.
     - Returned for Revision — Proposal has merit but requires clarification or minor improvements. Proposer revises and re-enters RFC without waiting period. Maximum two revision cycles before requiring full re-submission.
     - Declined — Proposal does not meet pharmaverse standards at this time.
   - All decisions are documented with rationale and published to the community.
4. **Entry as Maturing**
   - Approved packages enter the ecosystem with status Maturing.
   - Submission-Suitability badge is not assessed at this stage.
   - Maintainer Covenant (section 3) is signed upon entry.

> ℹ **Council vote is the decision — community is advisory**
>
> The RFC process gives the community a formal voice and creates a documented record. The final decision rests with the council. This protects the council's accountability for what pharmaverse endorses.

> **Any declined package may be re-submitted 6 months after the decline date**, provided the proposal addresses the council's stated reasons for decline. Re-submissions that do not meaningfully address prior feedback may be rejected without full RFC review at council discretion.

### 3. The Maintainer Covenant

Pharmaverse endorsement is not a one-time award. It is an ongoing relationship between the council and the package maintainer team. The Maintainer Covenant formalizes what pharmaverse expects from every endorsed package, and what pharmaverse commits to in return.

#### 3.1 Maintainer Obligations {#maintainer-obligations}

| Obligation | Standard |
| --- | --- |
| **Responsiveness** | Critical issues acknowledged within 30 days. Non-critical issues triaged within 90 days. |
| **Release cadence** | At least one release per 18-month endorsement term. Absence of releases triggers endorsement renewal review. |
| **Breaking changes** | Major breaking changes are communicated to the community with a minimum 2-quarter deprecation notice. |
| **Documentation** | Package documentation is kept current with each release. Vignettes reflect actual usage patterns. |
| **Handover** | If the maintainer team is unable to continue, the council must be notified with a minimum 60-day lead time to enable transition planning. |
| **Renewal engagement** | Maintainer team actively participates in the renewal assessment process (section 5). |
| **Quality** | Maturing packages^: Must achieve Quality Reviewed status within 12 months.<br>Stable packages^: Must continue to meet the criteria for Quality Reviewed status\*.<br>Sustained decline in quality — such as test coverage dropping significantly, accumulation of unresolved critical issues, documentation falling out of sync with releases, or failing R CMD check — may trigger Watch status and require quality re-review. Temporary fluctuations during active development are expected and acceptable if addressed promptly. |

^ see [Section 4.1 Status tags](#status-tags), \* [Section 4.2 Quality Badges](#quality-badges)

> ★ **License consideration**
>
> Maintainers acknowledge that pharma organizations often have license restrictions. Packages using strong copyleft licenses such as AGPL, may face limited adoption in corporate environments. Maintainers are encouraged to choose permissive licenses (MIT, Apache-2.0) when possible, but this is not mandatory for endorsement.

#### 3.2 Council Obligations

The covenant is bilateral. The council commits to the following in return for a maintainer team's engagement:

- Proactive stewardship — the council will not simply observe decline. It will reach out to maintainer teams showing early signs of reduced activity before placing a package on Watch.
- Steward assignment — for packages at risk of losing their maintainer, the council will proactively seek a steward from member organizations before the package degrades.
- Transparent decisions — all Watch, At Risk, and Archived decisions are documented with rationale and communicated directly to the maintainer team before public announcement.
- Appeal window — maintainer teams have 30 days to appeal any Watch or At-Risk designation with supporting evidence.
- Remediation support — the council will assist teams in identifying resources and community support during a remediation period.

> ★ **The credibility principle**
>
> Endorsing a package and failing to steward it is a reputational risk for pharmaverse. The council is accountable not just for what it admits, but for what it continues to endorse. The covenant and the renewal process are the mechanisms that make this accountability real.

### 4. Package Tagging System

Every endorsed package carries a two-layer tag set that communicates its lifecycle position and quality status to both end users and the council. Tags are reviewed semiannually. The default at each review is no change — tags move only when there is documented evidence to support a change.

#### 4.1 Layer 1 — Status Tags {#status-tags}

Each package holds exactly one Status tag at all times.

| Tag | Meaning | User signal |
| --- | --- | --- |
| **Stable** | Actively maintained, API settled. Quality badges fully active. | Safe to adopt |
| **Maturing** | Under active development. Filling a genuine gap. Quality badges not yet assessed. | Assess fit carefully |
| **Watch** | Concerns raised by the council. Quality badges under scrutiny. | Use with caution |
| **At Risk** | Failing to meet pharmaverse standards. Remediation plan required within one quarter. | Avoid for new work |
| **Archived** | Endorsement withdrawn. Package retained for reference only. No quality badges displayed. | Do not use |

**Sunset path:** Watch → At Risk → Archived. Moving to Watch requires one council member raising a documented concern. Moving to At Risk requires a majority vote. Moving to Archived is automatic if no approved remediation plan is in place by the next semiannual review.

#### 4.2 Layer 2 — Quality Badges {#quality-badges}

Quality badges are independent boolean assessments across three dimensions. A package may hold any combination. Badges are only actively assessed for Stable packages. For Maturing packages, Submission-Suitability is not assessed; other badges reflect current observable state.

| Dimension | Badge | Meaning |
| --- | --- | --- |
| **Submission Readiness** | Submission-Suitable\* | Package design and documentation reduce sponsor-side validation burden for regulatory submissions. Includes: (1) **comprehensive validation artifacts** (test coverage, requirements traceability, risk assessment), (2) **CDISC compliance** where relevant, (3) **stability and versioning practices** that support reproducibility, (4) **regulatory context awareness** (package acknowledges GxP requirements in documentation). **This badge indicates lower validation overhead for sponsors — it does not substitute for sponsor-required validation.** |
| | Submission-Caution | Gaps exist that require user-side mitigation. May be unvalidated, have upstream dependency risks, or cover regulatory grey areas. |
| **Maintenance Health** | Actively Maintained | Issues addressed promptly, regular releases, responsive maintainer team. |
| | Low Maintenance | Infrequent updates, slow issue response. May signal approaching abandonment. |
| **Technical Quality** | Quality Reviewed | Formal quality review completed. Package meets pharmaverse quality standards: (0) passes R CMD check with no errors or warnings (1) test coverage ≥70% for core functionality, (2) vignettes demonstrating pharma use case, (3) code maintainability and clear documentation. |
| | Review Pending | Formal review not yet completed or currently in progress. For Maturing packages, this is expected. For Stable packages with long-standing Review Pending status without engagement, this becomes a renewal concern. |

> ℹ \* **Submission-Suitable badge** does not constitute:
>
> - Regulatory approval or endorsement by any regulatory authority
> - Pre-validation or certification for submission use
> - A guarantee of regulatory acceptance in any jurisdiction
> - A substitute for sponsor-required validation per their quality systems
>
> Sponsors using pharmaverse packages in regulatory submissions remain fully responsible for validating software according to their own SOPs and applicable regional regulatory requirements (FDA, EMA, PMDA, etc.).

> **Review Pending is not a criticism**
>
> The Technical Quality dimension is framed as a process state, not a verdict. Saying a package is Review Pending means the system has not yet completed its assessment — not that the package has problems. This framing is deliberate: it keeps teams engaged and shifts responsibility to the governance process.

### 5. Endorsement Term and Renewal

Pharmaverse endorsement is not permanent. Every endorsed package operates under a term, after which it must demonstrate that its endorsement remains warranted. This is the primary mechanism through which the council exercises its accountability for the quality of the ecosystem.

#### 5.1 Endorsement Term

| Trigger | Detail |
| --- | --- |
| **18-month calendar limit** | All packages are reviewed for renewal no later than 18 months after their last endorsement date, regardless of release activity. |
| **Major version release** | A major version release (breaking API change) automatically triggers an expedited renewal review. The package must demonstrate continued fit before the release is covered by the endorsement. |
| **Council-initiated review** | The council may initiate an out-of-cycle renewal review at any point if credible concerns are raised. This is distinct from the Watch process and is used when an expedited assessment is needed. |

#### 5.2 Renewal Assessment Criteria

The renewal assessment covers four dimensions. The maintainer team provides evidence; the council assesses and decides.

| # | Criterion | What is assessed |
| :---: | --- | --- |
| **1** | **Value proposition still holds** | Does the package still address a real gap? Has the landscape changed — new CRAN packages, updated standards, or shifting community needs — such that the gap no longer exists or is now better served elsewhere? |
| **2** | **Maintenance covenant met** | Has the maintainer team honored the obligations in [section 3.1](#maintainer-obligations)? Issue responsiveness, release cadence, communication of breaking changes, and documentation currency are all assessed. |
| **3** | **Quality badges status** | Have quality badges improved or deteriorated since the last endorsement? A package that remains on Review Pending across multiple terms without engagement is a renewal concern. |
| **4** | **User adoption evidence\*** | Assessed relative to the gap the package was endorsed to fill. Evidence includes: active community engagement (issues, PRs, discussions), organizational endorsements, and adoption trends relative to alternatives if they exist. |

\* Low adoption is a concern of renewal primarily in saturated domains where multiple alternatives exist and this package shows declining engagement. For niche packages serving specialized needs, evidence of continued use within the target community is sufficient. Raw download counts are considered in context — a package with stable downloads but no active engagement may signal legacy inertia rather than ongoing value.

#### 5.3 Renewal Outcomes

| Outcome | What happens |
| --- | --- |
| **Renewed** | Endorsement renewed for a new 18-month term. Tags updated to reflect current assessment. Covenant re-confirmed. |
| **Renewed with conditions** | Endorsement renewed, but specific conditions must be met within the next quarter (e.g., quality review must be completed, documentation updated). Failure to meet conditions moves the package to Watch. |
| **Grace period granted** | Endorsement is not renewed. Package placed on Watch. Maintainer team has one quarter to submit and execute a remediation plan. See section 5.4. |
| **Endorsement withdrawn** | Used when a package clearly no longer has a place in the ecosystem and grace period would serve no purpose. Package moves directly to Archived. Requires council supermajority (two-thirds). |

#### 5.4 The Remediation Plan

A remediation plan is required whenever a package enters a grace period following a failed renewal or an At-Risk designation. The plan is authored by the maintainer team and approved by the council. Its purpose is to make the team the author of their own recovery — not a passive subject of a council decision.

A valid remediation plan must include:

- A clear statement of which renewal criteria were not met and why.
- Specific, measurable actions the team commits to within the grace period.
- Named individuals responsible for each action.
- A timeline with milestones at the midpoint and end of the grace period.
- A request for any council or community support needed.

The council reviews progress at the midpoint. If the plan is on track, the council provides a public statement of confidence. If the plan has stalled, the council may move the package to At Risk early rather than waiting for the grace period to expire.

> ★ **Shared accountability**
>
> When the council approves a remediation plan, pharmaverse is invested in its success — not merely observing. This shared accountability is what distinguishes stewardship from surveillance.

### 6. Semiannual Review Process

The semiannual review is the operational heartbeat of the governance model. It is designed to be lightweight for healthy packages and substantive only where action is genuinely needed.

#### 6.1 Review Agenda Structure

| Time | Agenda item | Detail |
| --- | --- | --- |
| 5 min | **Consent agenda** | All packages with no proposed tag changes are ratified as-is by consent. No discussion required. |
| Varies | **Proposed tag changes** | Each proposed change is presented with documented evidence. Discussion and vote as needed. |
| Varies | **Renewal assessments** | Packages due for renewal are assessed against the four criteria. Outcomes recorded. |
| Varies | **Remediation plan reviews** | Mid-period and end-of-period remediation plan check-ins. |
| 10 min | **Pipeline** | Brief update on packages in the RFC process. No decisions required. |
| 5 min | **Stewardship concerns** | Council members flag early-warning signals not yet requiring Watch status. Proactive outreach assigned. |

#### 6.2 Decision Rules

| Decision | Threshold | Who initiates |
| --- | --- | --- |
| Place package on Watch | **Majority vote** | Any council member |
| Remove Watch status | **Majority vote** | Council member or maintainer team |
| Move to At Risk | **Majority vote** | Council, following at least one Watch quarter |
| Approve remediation plan | **Majority vote** | Maintainer team submits; council approves |
| Move to Archived (from At Risk) | **Automatic** | Triggered if no approved plan by review date |
| Move to Archived (direct) | **Two-thirds vote** | Council, for egregious cases only |
| Renew endorsement | **Majority vote** | Triggered by renewal timeline or major release |
| Approve new package (After RFC period) | **Majority vote** | Proposer submits; council votes |

Quorum is defined as a minimum of 60% present for vote to proceed. Majority is determined based on the number of council members present. The same applies to a two-thirds vote.

### 7. Illustrative Examples

The following examples show how the full governance model applies to realistic scenarios, including edge cases.

These examples are illustrative only. They are not actual assessments of any package.

| Package | Status | Quality badges | Governance narrative |
| --- | --- | --- | --- |
| **admiral** | Stable | Submission-Suitable<br>Actively Maintained<br>Quality Reviewed | Gold standard. Wide adoption, CDISC-aligned, strong maintainer team backed by multiple organizations. Renewals are straightforward. |
| **pkg.estimands** | Stable | Submission-Caution<br>Actively Maintained<br>Quality Reviewed | Technically excellent but covers a regulatory grey area. Council renewed with a note that users must provide additional submission justification. Caution badge is a user signal, not a quality concern. |
| **new.biomarker** | Maturing | Actively Maintained<br>Review Pending | Entered via RFC 3 months ago. Fills a genuine gap in biomarker endpoints. Team is responsive. Submission-Suitability not yet assessed. Quality review scheduled this quarter. |
| **legacy.tfl** | Watch | Submission-Caution<br>Low Maintenance | Original maintainer moved on. Two quarters of low maintenance signals. Council placed on Watch and reached out proactively. No response yet. At Risk vote scheduled for next review if no remediation plan submitted. |
| **niche.endpoints** | Watch | Submission-Suitable<br>Actively Maintained<br>Quality Reviewed | Edge case. Technically excellent package on Watch because renewal assessment raised questions about ongoing value proposition given very narrow user base and a newer alternative emerging. Council is assessing fit — not quality. |
| **oldformat.utils** | At Risk | Submission-Caution<br>Low Maintenance<br>Review Pending | Failed renewal. Remediation plan approved last quarter. Midpoint check showed limited progress. Council issued public statement of concern. Final review next quarter — no approved plan means automatic Archived. |
| **defunct.sdtm** | Archived | — (no badges) | Superseded by a better-maintained package. Direct Archived vote passed by supermajority after maintainer team confirmed they would not submit a remediation plan. Retained for reference to support legacy submissions. |

### 8. Rollout Plan

1. **Community communication**
   - Publish a plain-language summary of the governance model to the pharmaverse community.
   - Open a 2-week community comment period. All feedback logged; substantive points addressed in a published FAQ.
2. **Pilot — 5 packages (initial semiannual review)**
   - Select 5 packages spanning different status and quality states.
   - Apply the tagging system and run the first semiannual review under the new model.
   - Document what worked and what required adjustment.
3. **Full rollout**
   - Apply the tagging system to all endorsed packages.
   - Publish the full tag set publicly on the pharmaverse website.
   - Formalize the governance model in the pharmaverse documentation.
4. **Annual retrospective**
   - Review the governance model itself annually.
   - Assess whether the tagging dimensions remain fit for purpose.
   - Collect maintainer team feedback on the covenant and renewal process.

> ℹ **This model is itself subject to governance**
>
> The working model should be version-controlled and publicly accessible. Changes to the model follow the same RFC-and-vote process used for package proposals.
