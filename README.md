# Lead Operations Intelligence Dashboard
> An executive-grade business intelligence command center engineered to track outbound SDR outreach performance, enforce SLA follow-up compliance, analyze pipeline velocity, and uncover geographic ICP prospecting opportunities.

![Project preview](assets/images/project-preview.png)

## Business Problem
Growing B2B sales teams and service agencies suffer from lead leakage and operational blind spots. Sales reps fail to follow up with engaged prospects within defined SLA windows, marketing teams lack visibility into which specific suburbs and business niches convert to booked audits, and leadership cannot pinpoint where potential revenue is stalling inside the sales funnel.

## Solution
A comprehensive, 4-page interactive Power BI application built on a structured star schema model. The dashboard combines real-time outreach tracking, dynamic SLA rescue tables, AI-driven root-cause analysis, and geospatial mapping to give C-suite leadership and daily sales representatives a single source of truth for revenue operations.

## My Role
* **BI Developer & Data Analyst:** Designed the relational data model (star schema), engineered custom DAX measures for pipeline velocity and conversion tracking, and developed the interactive UI/UX following strict visual hierarchy standards.
* **ETL & Data Modeling:** Cleaned and structured raw activity logs and dimension tables using Power Query, enforcing proper data categorization and geocoding parameters.

## Technology Stack
* **Business Intelligence:** Microsoft Power BI (Desktop & Service)
* **Data Modeling & Languages:** DAX (Data Analysis Expressions), Power Query (M Code), Star Schema Relational Modeling
* **Geospatial & AI Analytics:** Azure Maps, Power BI AI Key Influencers, Decomposition Trees

## Key Features
* **Page 1: Executive Overview:** High-level leadership command center tracking Active Leads, Total Pipeline Value, Lead-to-Client Conversion %, and monthly revenue trajectory.
* **Page 2: Outreach Performance:** Granular SDR activity tracking measuring call volumes, WhatsApp messages sent, and proposal generation, paired with an interactive *Outreach Actions Due This Week* operational dialer table.
* **Page 3: Pipeline Health & Conversion:** Funnel conversion analysis isolating drop-off bottlenecks, a branching *Won Value Decomposition Tree* for interactive C-suite exploration, and a dedicated *Stalled Opportunities* rescue table highlighting SLA follow-up breaches.
* **Page 4: Geographic & ICP Insights:** Geospatial density mapping across target suburbs, niche digital presence matrix evaluations, and an AI *Key Influencers* visual identifying the precise demographic traits that drive booked meetings.

## Architecture / Data Model
The project is built on a standard **Star Schema** to ensure optimal DAX query performance and clean filter propagation:
* **Fact Table:** `Fact_Activities` (Logs individual outreach actions, calls, WhatsApp sends, and timestamps).
* **Dimension Tables:** `Dim_Lead` (Company attributes, niches, suburbs, review scores, digital presence), `Dim_Pipeline_Stage` (Stage order, stage grouping), and `Dim_Date` (Standard calendar dimension for time-intelligence reporting).

## Custom DAX Highlights
* **High-Priority Target Percentage:**
  ```dax
  High-Priority Target % = 
  DIVIDE(
      CALCULATE(DISTINCTCOUNT(Dim_Lead[Lead ID]), Dim_Lead[Priority Level] = "HIGH"),
      DISTINCTCOUNT(Dim_Lead[Lead ID]),
      0
  )
  ```
* **Geospatial String Concatenation (Azure Maps Geocoding):**
  ```dax
  Full Location = Dim_Lead[Suburb] & ", South Africa"
  ```

## Screenshots
*(High-resolution screenshots of all 4 dashboard tabs will be added here: `assets/screenshots/`)*

## Key Insights or Outcomes
* **Visualizing Funnel Bottlenecks:** Isolated a critical conversion drop-off between *Lead Magnet Sent* and *Booked Meeting*, enabling targeted sales script improvements.
* **SLA Breach Mitigation:** The operational follow-up tables allow reps to instantly identify and call stalled accounts, directly rescuing at-risk pipeline revenue.
* **ICP Targeting Clarity:** AI analysis revealed that businesses with missing websites but high Google Business Profile review counts convert to booked audits at a significantly higher rate than saturated competitors.

## Privacy and Security
* All data model records are generated synthetically for demonstration purposes.
* Row-Level Security (RLS) roles are mapped within the backend architecture to demonstrate how access can be restricted by individual sales rep territory in a live enterprise deployment.

## Contact
* **GitHub:** [https://github.com/clementmathye](https://github.com/clementmathye)
