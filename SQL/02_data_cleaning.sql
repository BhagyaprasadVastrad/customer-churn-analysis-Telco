-- 02_data_cleaning.sql
-- Author: Bhagyaprasad
-- Project: Telco Customer Churn Analysis
-- Description: Data cleaning queries

USE telco_churn;

-- 1. View data types
DESCRIBE telcodata;

-- 2. Check for NULLs in each column
SELECT
  SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS null_customerID,
  SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS null_gender,
  SUM(CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END) AS null_SeniorCitizen,
  SUM(CASE WHEN Partner IS NULL THEN 1 ELSE 0 END) AS null_Partner,
  SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS null_Dependents,
  SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS null_tenure,
  SUM(CASE WHEN PhoneService IS NULL THEN 1 ELSE 0 END) AS null_PhoneService,
  SUM(CASE WHEN MultipleLines IS NULL THEN 1 ELSE 0 END) AS null_MultipleLines,
  SUM(CASE WHEN InternetService IS NULL THEN 1 ELSE 0 END) AS null_InternetService,
  SUM(CASE WHEN OnlineSecurity IS NULL THEN 1 ELSE 0 END) AS null_OnlineSecurity,
  SUM(CASE WHEN OnlineBackup IS NULL THEN 1 ELSE 0 END) AS null_OnlineBackup,
  SUM(CASE WHEN DeviceProtection IS NULL THEN 1 ELSE 0 END) AS null_DeviceProtection,
  SUM(CASE WHEN TechSupport IS NULL THEN 1 ELSE 0 END) AS null_TechSupport,
  SUM(CASE WHEN StreamingTV IS NULL THEN 1 ELSE 0 END) AS null_StreamingTV,
  SUM(CASE WHEN StreamingMovies IS NULL THEN 1 ELSE 0 END) AS null_StreamingMovies,
  SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS null_Contract,
  SUM(CASE WHEN PaperlessBilling IS NULL THEN 1 ELSE 0 END) AS null_PaperlessBilling,
  SUM(CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END) AS null_PaymentMethod,
  SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS null_MonthlyCharges,
  SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS null_TotalCharges,
  SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS null_Churn
FROM telcodata;

-- 3. Convert TotalCharges to numeric (if imported as VARCHAR)
-- First check sample non-numeric entries
SELECT TotalCharges FROM telcodata WHERE TotalCharges NOT REGEXP '^[0-9]+(\.[0-9]+)?$';

-- Update blank TotalCharges to NULL before conversion
UPDATE telcodata
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

-- Alter column type to FLOAT
ALTER TABLE telcodata
MODIFY COLUMN TotalCharges FLOAT;

-- 4. Remove duplicate customerID entries if any (customerID is primary key, but check)
SELECT customerID, COUNT(*) as cnt
FROM telcodata
GROUP BY customerID
HAVING cnt > 1;

-- 5. Trim any leading/trailing spaces in categorical columns (example shown for PaymentMethod)
UPDATE telcodata
SET PaymentMethod = TRIM(PaymentMethod);

-- Repeat trimming for other categorical columns if needed.

-- 6. Verify cleaning
SELECT * FROM telcodata LIMIT 10;
