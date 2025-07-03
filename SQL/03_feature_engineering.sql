-- 03_feature_engineering.sql
-- Author: Bhagyaprasad
-- Project: Telco Customer Churn Analysis
-- Description: Feature engineering for improved insights

USE telco_churn;

-- 1. Create a tenure group column for easier analysis
ALTER TABLE telcodata
ADD COLUMN tenure_group VARCHAR(20);

UPDATE telcodata
SET tenure_group =
  CASE
    WHEN tenure BETWEEN 0 AND 12 THEN '0-12 months'
    WHEN tenure BETWEEN 13 AND 24 THEN '13-24 months'
    WHEN tenure BETWEEN 25 AND 36 THEN '25-36 months'
    WHEN tenure BETWEEN 37 AND 48 THEN '37-48 months'
    WHEN tenure BETWEEN 49 AND 60 THEN '49-60 months'
    ELSE '60+ months'
  END;

-- 2. Create binary flags for key services (example for PhoneService)
ALTER TABLE telcodata
ADD COLUMN has_phone_service TINYINT(1);

UPDATE telcodata
SET has_phone_service = CASE WHEN PhoneService = 'Yes' THEN 1 ELSE 0 END;

-- Repeat binary flags for other services if desired
-- For example: OnlineSecurity, TechSupport, StreamingTV etc.

-- 3. Create a churn flag as binary numeric for modeling ease
ALTER TABLE telcodata
ADD COLUMN churn_flag TINYINT(1);

UPDATE telcodata
SET churn_flag = CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END;
