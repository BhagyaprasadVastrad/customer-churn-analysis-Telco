-- 01_data_exploration.sql
-- Author: Bhagyaprasad
-- Project: Telco Customer Churn Analysis
-- Description: Data exploration queries to understand customer churn patterns

USE telco_churn;

-- 1. View sample data
SELECT * FROM telcodata LIMIT 10;

-- 2. Total number of customers
SELECT COUNT(*) AS total_customers FROM telcodata;

-- 3. Number of churned vs retained customers
SELECT Churn, COUNT(*) AS count
FROM telcodata
GROUP BY Churn;

-- 4. Churn rate (%)
SELECT
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate_percentage
FROM telcodata;

-- 5. Gender distribution
SELECT gender, COUNT(*) AS count
FROM telcodata
GROUP BY gender;

-- 6. Churn rate by gender
SELECT gender,
       ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate_percentage
FROM telcodata
GROUP BY gender;

-- 7. Average monthly charges by churn status
SELECT Churn, AVG(MonthlyCharges) AS avg_monthly_charges
FROM telcodata
GROUP BY Churn;

-- 8. Churn count by contract type
SELECT Contract, COUNT(*) AS customer_count,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_count
FROM telcodata
GROUP BY Contract;

-- 9. Tenure distribution (bucketed)
SELECT
  CASE
    WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
    WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
    WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
    WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
    WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
    ELSE '60+ months'
  END AS tenure_group,
  COUNT(*) AS customer_count
FROM telcodata
GROUP BY tenure_group
ORDER BY tenure_group;

-- 10. Churn rate by tenure group
SELECT
  CASE
    WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
    WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
    WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
    WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
    WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
    ELSE '60+ months'
  END AS tenure_group,
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate_percentage
FROM telcodata
GROUP BY tenure_group
ORDER BY tenure_group;
