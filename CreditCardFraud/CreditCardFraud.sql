/*
Dorghaam Haidar
Dorghaam.416@gmail.com
Credit Card Fraud Queries
*/

-- Statewise Fraud Percentage Analysis



WITH fraud_state AS 
(SELECT COUNT(is_fraud) AS fraud_state_count FROM creditcardfraud
WHERE is_fraud = 1)

SELECT state, 
ROUND(CAST(COUNT(is_fraud)AS FLOAT) / (SELECT fraud_state_count FROM fraud_state) * 100, 2) AS fraud_percentage
FROM creditcardfraud
WHERE is_fraud = 1
GROUP BY state
ORDER BY fraud_percentage desc


-- Fraud Distribution Across Days of the Week



WITH total_fraud AS
( SELECT COUNT(*) AS total_fraud_count FROM creditcardfraud
WHERE is_fraud = 1)

SELECT
DATENAME(WEEKDAY, transaction_time_date),
ROUND(CAST(COUNT(DATENAME(WEEKDAY, transaction_time_date))AS FLOAT) / (SELECT total_fraud_count from total_fraud) * 100, 2)
FROM creditcardfraud
WHERE DATENAME(WEEKDAY, transaction_time_date) IS NOT NULL AND is_fraud = 1
GROUP BY DATENAME(WEEKDAY, transaction_time_date)



-- Fraud Distribution by City Population Size


SELECT
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop < 50000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2 ) AS FLOAT)  AS under50k,
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop > 50000 AND city_pop < 100000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS FLOAT) AS over50under100,
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop > 100000 AND city_pop < 1000000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS FLOAT) AS over100under1mil,
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop > 1000000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS FLOAT) AS over1mil
FROM creditcardfraud
WHERE is_fraud = 1


-- Fraudulent Transactions by Purchase Amount

SELECT
    COUNT(total) AS total_fraud_transactions,
    ROUND(CAST(COUNT(CASE WHEN total < 10 THEN 1 END) AS FLOAT) / COUNT(total) * 100, 2) AS purchases_under10,
    ROUND(CAST(COUNT(CASE WHEN total >= 10 AND total < 50 THEN 1 END) AS FLOAT) / COUNT(total) * 100, 2) AS purchases_under50,
    ROUND(CAST(COUNT(CASE WHEN total >= 50 AND total < 100 THEN 1 END) AS FLOAT) / COUNT(total) * 100, 2) AS purchases_under100,
    ROUND(CAST(COUNT(CASE WHEN total >= 100 AND total < 500 THEN 1 END) AS FLOAT) / COUNT(total) * 100, 2) AS purchases_under500,
    ROUND(CAST(COUNT(CASE WHEN total >= 500 THEN 1 END) AS FLOAT) / COUNT(total) * 100, 2) AS purchases_over500
FROM 
    creditcardfraud
WHERE 
    is_fraud = 1


-- Fraudulent Transactions by Time of Day


SELECT
    ROUND(CAST(COUNT(CASE WHEN DATEPART(HOUR, transaction_time_date) >= 6  AND DATEPART(HOUR, transaction_time_date) < 12 THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS morning_percentage,
    ROUND(CAST(COUNT(CASE WHEN DATEPART(HOUR, transaction_time_date) >= 12  AND DATEPART(HOUR, transaction_time_date) < 18 THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS afternoon_percentage,
    ROUND(CAST(COUNT(CASE WHEN DATEPART(HOUR, transaction_time_date) >= 18  AND DATEPART(HOUR, transaction_time_date) < 22 THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS evening_percentage,
    ROUND(CAST(COUNT(CASE WHEN (DATEPART(HOUR, transaction_time_date) >= 22 OR DATEPART(HOUR, transaction_time_date) < 6) THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS night_percentage
FROM creditcardfraud
WHERE is_fraud = 1
