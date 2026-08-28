# Superstore Sales Analysis — Power BI

An end-to-end Power BI project built on the Superstore retail dataset, covering data cleaning 
(Power Query/M), enterprise-style data modeling (Star Schema), and interactive visualization.

## Overview

| | |
|---|---|
| **Dataset** | [Superstore Sales Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) (Kaggle) |
| **Size** | 9,994 rows — US retail order data, 2014–2017 |
| **Tools** | Power BI Desktop, Power Query (M), DAX |
| **Status** | 🔄 In Progress — Phase 1 & 2 complete, Phase 3 (DAX) next |

## Project Phases

### Phase 1 — ETL (Power Query)

- Corrected data types: Order Date / Ship Date (Text → Date, with locale handling for US format), 
  Postal Code (Number → Text, to preserve leading zeros on US ZIP codes).

- Removed redundant columns (Row ID) and trimmed whitespace across text fields.

- Built a custom Date dimension table from scratch using `List.Dates()` in M.

### Phase 2 — Data Modeling (Star Schema)

- Modeled a Star Schema with **FactSales** at the center and four supporting dimensions: 
  **DimDate**, **DimCustomer**, **DimProduct**, **DimLocation**.

- Solved a Many-to-Many relationship issue on Region/City by introducing a **composite key** 
  (`LocationKey = State & "-" & City`), since city names alone weren't unique across states 
  (e.g., Redmond, WA vs. Redmond, OR).

- Implemented a **role-playing dimension**: Order Date is the active relationship to DimDate; 
  Ship Date is kept inactive, to be activated selectively via `USERELATIONSHIP` in DAX.

- Every Fact-to-Dimension relationship uses Many-to-One cardinality with single cross-filter 
  direction — no ambiguous filter paths.

### Phase 3 — DAX *(Coming Soon)*
Measures for time intelligence, profitability analysis, and customer/product segmentation.

### Phase 4 — Dashboard UI/UX *(Coming Soon)*
Polished, recruiter-facing dashboard with KPI cards and data storytelling.

## Data Model

![Model View](Screenshots/Relationships_Model_View.jpeg)
*Star Schema — one Fact table, four Dimension tables, all Many-to-One relationships.*

## Report Preview

![Report Overview](Screenshots/Report_Overview.jpeg)

![Report with Slicer](Screenshots/Report_Visualization_With_Slicer.jpeg)
*Year slicer cross-filtering both the Sales-by-Year table and Sales-by-Segment-and-Category chart.*

## Key Takeaways

- Real-world "clean-looking" data can hide serious issues (silent parsing errors, corrupted date fields) that only surface through systematic validation — always check row counts before and after transformation.

- A single-column key isn't always unique; composite keys are a practical, common fix when no natural unique identifier exists.

- Role-playing dimensions let one date table serve multiple purposes (Order Date, Ship Date) without duplicating the whole table.

---
*Part of my [Data Analytics Portfolio](../../).*