# Telco Customer Churn Analysis – SQL & Power BI

## Project Overview

This project analyses **Telco customer churn data** to identify key drivers of churn and recommend actionable strategies to improve retention rates.

---

## Tools & Technologies Used

- **MySQL Workbench:** Data cleaning, transformation, and feature engineering
- **Power BI Desktop:** Data modelling, DAX measures, interactive dashboard creation

---

## Data Preparation in MySQL Workbench

### Key SQL Queries:

- **Remove missing TotalCharges values:**
  ```sql
  UPDATE telcodata SET TotalCharges = NULL WHERE TRIM(TotalCharges) = '';

  CASE WHEN SeniorCitizen = 1 THEN 'Yes' ELSE 'No' END AS SeniorCitizenCategory

  CASE
  WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
  WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
  WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
  WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
  WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
  ELSE '60+ months'
END AS tenure_group


### Power BI Data Analysis & Visualisation 

#### Key DAX Measures:

**Total Customers** = COUNTROWS(telcodata_cleaned)

**Total Churned** = CALCULATE(COUNTROWS(telcodata_cleaned), telcodata_cleaned[Churn] = "Yes")

**Churn Rate %** = DIVIDE([Total Churned], [Total Customers], 0)

**Average Monthly Charges** = AVERAGE(telcodata_cleaned[MonthlyCharges])

**Total Monthly Revenue** = SUM(telcodata_cleaned[MonthlyCharges])


### Key Dashboard Visuals:

KPI Cards: Total Customers, Total Churned, Churn Rate %, Average Monthly Charges, Total Monthly Revenue

Bar Chart: Customer Count by Contract Type

Column Chart: Customer Count by Tenure Group

Stacked Bar Chart: Customer Churn by Gender

Donut Chart: Gender Distribution

Line Chart: Average Monthly Charges by Tenure Group

Slicers: Gender, Contract Type, Payment Method, Senior Citizen, Internet Service Type

### Business Insights & Recommendations

**Problem** : High churn (~19.2%) affecting revenue stability.

**Findings**:

Month-to-month contracts have the highest churn.

Customers with 0-12 months tenure show greater churn risk.

Gender distribution is balanced, suggesting focus on contract strategies and tenure-based campaigns rather than gender.

**Recommendations:**

Promote annual/two-year contracts with loyalty discounts.

Implement targeted onboarding and retention campaigns for first-year customers.

Enhance billing/payment experiences for better customer satisfaction.

**Project Outcome**

**Explanation**

Situation	Telco faced high customer churn impacting profits.
Task Analyse churn data to identify patterns and recommend strategies.
Action	Cleaned and engineered data in MySQL, created DAX measures in Power BI, built an interactive dashboard with KPIs and visuals.
Result	Delivered insights to reduce churn by focusing on contract strategies and tenure-based engagement, demonstrating end-to-end data analysis capabilities.









  
