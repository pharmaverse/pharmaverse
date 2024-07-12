---
title: "Mostly Asked Questions"
description: "this is meta description"
draft: false
_build:
  render: never
  list: never
---

{{< faq "Is there any presentation available to learn more about the pharmaverse?" >}}
Please see our keynote speech at [R/Pharma 2022](https://www.youtube.com/watch?v=APMDOS4v9Hk).
{{</ faq >}}

{{< faq "Who decides what's in and not in the pharmaverse?" >}}
Anyone can raise a request for a package to be included in the pharmaverse, by raising an issue [here](https://github.com/pharmaverse/pharmaverse/issues) and choosing our "New package request" template.
Similarly, anyone could raise an issue requesting for anything to be removed from pharmaverse, with the rationale provided.
Then we leverage our community via our Slack workspace to give the opportunity for anyone to comment on the proposal.
Our website team will then either action the request (if no concerns from our community) or for any contentious decisions our council will be asked to adjudicate.
{{</ faq >}}

{{< faq "How can I get involved?" >}}
Firstly, join our community on Slack using this [link](https://join.slack.com/t/pharmaverse/shared_invite/zt-yv5atkr4-Np2ytJ6W_QKz_4Olo7Jo9A). We are always looking for new collaborators to join us in helping achieve our vision - visit our [Contribute](https://pharmaverse.org/contribute/ic/) section of the site for all options.
{{</ faq >}}

{{< faq "How can I get access to these packages?" >}}
While it's likely in a production use of the packages you will be maintaining your own CRAN-like library within your company, for exploration and development purposes any of the hex logos shown above include a link direct to the GitHub repo of each package. We also host the packages, and their dependencies, in a CRAN-like server on R-universe. Please [follow this link](https://pharmaverse.r-universe.dev/ui#builds) to see how to point add this CRAN-like server to your library list in R. See information at [Get packages](https://pharmaverse.org/library/)
{{</ faq >}}

{{< faq "Is this validated/GxP/regulatory assured?" >}}
No, but we currently are connecting with several companies and industry working groups (see [Other Open Sourcing](https://pharmaverse.org/opensource/)) to assess whether there could be an industry recommended approach to R package validation utilising open source packages. Until we have this, we’d be happy to share our learnings and current strategies in this area from the companies involved in pharmaverse.
{{</ faq >}}
