# WMT Digital Capstone: College Athletics Meta Ads Performance

<img src="StanfordData.png" alt="WMT Digital logo" width="220">

A semester-long Notre Dame MSBA sports analytics capstone with WMT Digital, a digital advertising company that works with college athletic departments. The team analyzed Meta (Facebook and Instagram) ad performance by school, sport, audience and placement, and built interactive Shiny dashboards for exploring ROI and demographics.

## Context / partner

**WMT Digital**, which runs digital campaigns for college athletic departments. The team worked with Meta Ads exports (campaign insights, demographic breakdowns and placement breakdowns) for several partner schools, including Stanford, Miami, South Carolina, Clemson, George Mason, Florida Atlantic, Utah and Playfly-managed accounts. The source data is not in this repository.

## The question

- Which audiences (age and gender), sports, platforms and devices drive impressions, reach, link clicks and click-through rate for each school?
- How do campaign spend and attributed revenue compare, as ROI over 1-, 7- and 28-day click and view attribution windows?
- How can WMT and its school partners explore these results themselves without writing code?

## Approach

1. **Cleaning and preparation.** Standardized each school's exports and assigned a sport (football, basketball, baseball, softball, volleyball, soccer, gymnastics, water polo, miscellaneous) to every campaign by parsing campaign names. Joined the insights, placement and demographic tables, then computed link CTR and ROI, defined as (attributed revenue minus spend) divided by spend, for each attribution window.
2. **Per-school demographic visualization.** Impressions, link clicks, reach, CTR and spend by age group and gender, faceted by year and by sport, plus time series of impressions.
3. **Placement analysis and regression (Stanford).** Compared publisher platform and device combinations on CTR and link CTR, and fit linear models of impressions and CTR on clicks, device and platform, with VIF checks for multicollinearity.
4. **Shiny dashboards.** Built several Shiny apps: a University Sports ROI Explorer (filter by university, sport and campaign; summary table; average ROI, ROI distribution, and spend-versus-impressions views), a Meta Ads Insights demographics dashboard with tabs for each school, and an early data-synthesizer prototype.

## Key findings / deliverables

- The Stanford placement notebook reports that, in its impressions regression, link clicks and mobile-app delivery are positively associated with impressions and CTR is negatively associated. VIF checks showed minimal multicollinearity.
- The same notebook recommends putting more spend into the Facebook mobile app, improving Instagram engagement (especially on mobile web), revisiting Messenger placements (which drew no clicks), and using Audience Network on desktop for efficient niche targeting.
- **Deliverables:** demographic visualization notebooks for each school, a cross-school ROI Shiny app, a multi-school demographics Shiny app, and a step-by-step annotated version of the final apps for non-technical users.

## Tools

R, dplyr / tidyverse, ggplot2, plotly, Shiny, DT, car (VIF).

## Repository contents

### Cleaning and setup
| File | Description |
|---|---|
| [CleaningDoc](CleaningDoc) | Template that joins insights, placement and demographic data and computes LCTR and ROI by attribution window (R Markdown with no file extension) |
| [Sport split template.R](Sport%20split%20template.R) | Assigns campaigns to sports by campaign name |
| [Capstone1.Rmd](Capstone1.Rmd) | Shared team starter notebook: data loading for each team member and first age/gender groupings |

### Exploration: per-school demographic visualizations
| File | Description |
|---|---|
| [Miami](Miami%20Demo%20Viz.Rmd), [South Carolina](South%20Carolina%20Demo%20Viz.Rmd), [George Mason](George%20Mason%20Demo%20Viz.Rmd), [FAU](FAU%20Demo%20Viz.Rmd), [Clemson](Clemson%20Demo%20Viz.Rmd), [Utah](Utah%20Demo%20Viz.Rmd) Demo Viz | Same template for each school: age and gender breakdowns by year and sport, plus time series |
| [PlayFly Breakout.Rmd](PlayFly%20Breakout.Rmd) | Splits the Playfly account data into individual schools |

### Placement analysis and modeling
| File | Description |
|---|---|
| [Adam-StanfordPlacementInsights.Rmd](Adam-StanfordPlacementInsights.Rmd) | Stanford placement analysis: platform/device CTR, impressions regression, recommendations, results by campaign and sport |
| [StanfordDocs_Cherf.Rmd](StanfordDocs_Cherf.Rmd) | Earlier version with CTR regressions |

### Shiny dashboards
| File | Description |
|---|---|
| [Final Capstone.Rmd](Final%20Capstone.Rmd) | Final University Sports ROI Explorer, annotated step by step |
| [Final Capstone-Demographics.Rmd](Final%20Capstone-Demographics.Rmd) | Final demographics dashboard with one tab per school, annotated step by step |
| [Shiny Sigma.Rmd](Shiny%20Sigma.Rmd) | Meta Ads Insights dashboard with time-series and summary views by metric, sport and facet |
| [Shiny Epsilon Final](Shiny%20Epsilon%20Final) | Merged ROI explorer app (R Markdown with no file extension) |
| [Stef's Shiny Code.Rmd](Stef's%20Shiny%20Code.Rmd) | Earlier Meta Ads Insights dashboard |
| [shiny_attempt.Rmd](shiny_attempt.Rmd) | Iterative prototypes of the ROI explorer and a data-synthesizer app |

### Assets
| File | Description |
|---|---|
| [StanfordData.png](StanfordData.png) | WMT Digital logo (the file name does not describe the contents) |

## Notes

- The notebooks read the Meta Ads exports from each team member's local paths, and the CSVs are not in the repository, so the code will not run as checked in.
- Team members: Elizabeth Cherf, Stefan Lechmanik, Adam El-Kadi, Ryan Steffe, Mitchell Marinos and Collin Travasos.
