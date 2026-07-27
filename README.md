# Lead Operations Intelligence Dashboard

> A Power BI sales-operations dashboard designed to track outbound outreach, monitor follow-up discipline, analyse pipeline health, and identify high-potential prospecting segments.

<img width="1063" height="596" alt="page-1-executive-overview png" src="https://github.com/user-attachments/assets/513b82b7-3aa7-4a53-a5bc-e2283806f3a1" />


## Business Problem

Growing B2B sales teams and service agencies can lose opportunities when follow-ups are inconsistent, pipeline stages are unclear, and prospecting decisions are based on intuition rather than evidence.

Without a structured reporting layer, leadership and sales representatives may struggle to answer key questions:

- Which niches and suburbs produce the strongest engagement?
- Where do prospects stall in the sales funnel?
- Which leads require immediate follow-up?
- Which activities are most associated with meetings and proposals?
- How can the team prioritise outreach more effectively?

## Solution

A four-page interactive Power BI dashboard built on a structured star-schema model. The solution combines outreach tracking, follow-up monitoring, pipeline analysis, and geographic/ideal-customer-profile insights to create a single operational view of lead-generation performance.

The dashboard is designed for both management reporting and daily sales execution.

## My Role

### BI Developer and Data Analyst

- Designed the relational data model using a star-schema approach.
- Cleaned and structured lead and activity data using Power Query.
- Created DAX measures for lead volume, outreach activity, conversion tracking, pipeline health, and follow-up monitoring.
- Designed the dashboard UI using consistent visual hierarchy, KPI cards, filters, drill-down analysis, and decision-focused reporting.
- Documented data assumptions, privacy controls, and recommended operational actions.

### Data Preparation and Modelling

- Standardised lead stages, niches, locations, outreach activities, and follow-up statuses.
- Structured dimensions and fact tables to support clean filtering and scalable analysis.
- Prepared anonymised or synthetic portfolio data to protect business and contact information.
- Designed geographic fields for suburb-level analysis in South Africa.

## Technology Stack

- **Business Intelligence:** Microsoft Power BI Desktop
- **Data Transformation:** Power Query
- **Data Modelling:** Star Schema Relational Modelling
- **Analytics Language:** DAX (Data Analysis Expressions)
- **Data Source:** Google Sheets / Excel-based lead-operation data
- **Visual Analytics:** Funnel charts, KPI cards, matrices, maps, decomposition trees, and key-influencer analysis

## Key Features

### Page 1: Executive Overview

A leadership-focused view of overall lead operations, including:

- Total leads
- Active leads
- Pipeline-stage distribution
- Lead-to-client conversion rate
- Meetings booked
- Pipeline value
- Overdue follow-ups
- Monthly lead and activity trends

### Page 2: Outreach Performance

An activity and follow-up performance view, including:

- Calls, WhatsApp messages, emails, Loom videos, and discovery calls
- Outreach activity trends by week and month
- Activity outcomes by channel
- Meetings booked by niche
- Follow-up actions due
- Leads requiring contact or escalation

### Page 3: Pipeline Health and Conversion

A decision-support page focused on bottlenecks and pipeline movement, including:

- Funnel-stage analysis
- Conversion rates between key stages
- Average time in pipeline stage
- Stalled opportunities requiring follow-up
- Pipeline value by service, niche, and location
- Decomposition analysis of won or potential value

### Page 4: Geographic and ICP Insights

A prospecting-intelligence page designed to improve targeting, including:

- Lead distribution by suburb and city
- Lead and meeting performance by niche
- Digital-presence indicators such as website and Google Business Profile availability
- Review-band and qualification-score analysis
- Segment-level insights for ideal-customer-profile targeting
- Suburb-level opportunity mapping

## Architecture and Data Model

The project uses a standard star schema to support clean filtering, consistent metrics, and scalable reporting.

### Fact Tables

- `Fact_Activities` — individual outreach activities, calls, WhatsApp messages, follow-ups, and outcomes
- `Fact_Pipeline_History` — lead movement through pipeline stages and time spent in each stage
- `Fact_Opportunities` — proposal, estimated value, and closed-outcome information where applicable

### Dimension Tables

- `Dim_Lead` — anonymised company attributes, niche, suburb, qualification indicators, and current pipeline status
- `Dim_Date` — calendar dimension for month, quarter, week, and time-intelligence analysis
- `Dim_Pipeline_Stage` — ordered pipeline stages and stage groups

### Data Model Principles

- Single-direction relationships from dimensions to fact tables
- Standardised stage names and stage order
- Anonymised lead and business records
- Separate activity, pipeline-history, and opportunity data for accurate analysis
- Date table marked as the official date dimension in Power BI

## Custom DAX Highlights

### High-Priority Target Percentage

```DAX
High-Priority Target % =
DIVIDE(
    CALCULATE(
        DISTINCTCOUNT(Dim_Lead[Lead ID]),
        Dim_Lead[Priority Level] = "HIGH"
    ),
    DISTINCTCOUNT(Dim_Lead[Lead ID]),
    0
)
```

### Total Leads

```DAX
Total Leads =
DISTINCTCOUNT(Dim_Lead[Lead ID])
```

### Meetings Booked

```DAX
Meetings Booked =
CALCULATE(
    COUNTROWS(Fact_Activities),
    Fact_Activities[Outcome] = "Meeting Booked"
)
```

### Lead-to-Client Conversion Rate

```DAX
Lead-to-Client Conversion % =
DIVIDE(
    [Won Clients],
    [Total Leads],
    0
)
```

### Geospatial Location Field

```DAX
Full Location =
Dim_Lead[Suburb] & ", South Africa"
```

## Screenshots

### Page 1: Executive Overview

<img width="1063" height="596" alt="page-1-executive-overview png" src="https://github.com/user-attachments/assets/35bc20a3-9a8b-4809-a164-00be374a3623" />


### Page 2: Outreach Performance

<img width="1063" height="594" alt="page-2-outreach-performance" src="https://github.com/user-attachments/assets/49cf78ee-81d5-461a-b439-2381407edfd7" />


### Page 3: Pipeline Health and Conversion

<img width="1064" height="593" alt="page-3-pipeline-health" src="https://github.com/user-attachments/assets/38d05e7e-60fb-4ae9-8684-a54d94a01783" />


### Page 4: Geographic and ICP Insights

<img width="1062" height="598" alt="page-4-geographic-icp" src="https://github.com/user-attachments/assets/7e7a9017-c578-4351-be93-15475fa42c04" />


## Key Insights and Operational Value

This dashboard is designed to help a sales team:

- Identify funnel bottlenecks between initial contact, engaged lead, discovery call, proposal, and closed outcome.
- Surface overdue follow-ups so sales representatives can prioritise warm or stalled opportunities.
- Compare prospecting performance by niche, suburb, and qualification criteria.
- Monitor outreach volume and outcomes across calls, WhatsApp, email, and other channels.
- Improve ideal-customer-profile targeting using observable business attributes and engagement patterns.
- Create a more disciplined, measurable follow-up process.

> **Note:** Insights shown in the public portfolio version are based on anonymised and/or synthetic demonstration data. The dashboard framework is designed to support real operational decision-making when connected to approved business data.

## Privacy and Security

- All public records are anonymised, aggregated, synthetic, or permission-approved.
- No client phone numbers, emails, contact names, raw notes, private URLs, or confidential business information are published.
- No live Google Sheets links, API credentials, webhook URLs, or authentication tokens are included.
- Any production deployment should apply appropriate access control and row-level security based on team role, territory, or ownership requirements.

## Project Status

This project is currently being developed as a portfolio-grade business intelligence case study using anonymised lead-operation data and structured demonstration scenarios.

## Planned Enhancements

- Add a Power BI Service publishing workflow using approved anonymised data.
- Implement row-level security for sales-representative or territory-based access.
- Add a lead-scoring model using qualification indicators and engagement activity.
- Add automated refresh from a sanitised Google Sheets or CRM dataset.
- Add call-to-meeting and proposal-to-client conversion monitoring.
- Connect lead-recovery data from the AI receptionist system for closed-loop reporting.

## Repository Structure

```text
lead-operations-intelligence-dashboard/
├── README.md
├── assets/
│   └── images/
│       ├── project-preview.png
│       ├── page-1-executive-overview.png
│       ├── page-2-outreach-performance.png
│       ├── page-3-pipeline-health.png
│       └── page-4-geographic-icp.png
├── docs/
│   ├── business-problem.md
│   ├── data-model.md
│   ├── dax-measures.md
│   ├── insights-and-recommendations.md
│   └── privacy-and-data-handling.md
└── data/
    └── sample/
        └── README.md
```

## Contact

**GitHub:** [github.com/clementmathye](https://github.com/clementmathye)  
**LinkedIn:** www.linkedin.com/in/clement-mathye



