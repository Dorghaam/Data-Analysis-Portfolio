# Credit Card Fraud Analysis Project

**Author:** Dorghaam Haidar  
**Email:** Dorghaam.416@gmail.com

## Overview
This project investigates credit card fraud by analyzing transactional data across various dimensions, including fraud occurrence by state, day of the week, city population size, transaction amount, and time of day. The analysis was conducted using SQL queries to extract insights, and visualizations were generated using Tableau to display findings clearly.

---

## SQL Queries and Analysis

### 1. Statewise Fraud Percentage Analysis
This query calculates the percentage of fraudulent transactions in each state, allowing us to identify regions with higher fraud activity.

```sql
WITH fraud_state AS 
(SELECT COUNT(is_fraud) AS fraud_state_count FROM creditcardfraud
WHERE is_fraud = 1)

SELECT state, 
ROUND(CAST(COUNT(is_fraud) AS FLOAT) / (SELECT fraud_state_count FROM fraud_state) * 100, 2) AS fraud_percentage
FROM creditcardfraud
WHERE is_fraud = 1
GROUP BY state
ORDER BY fraud_percentage DESC;
```
### Visualization: 
![statexfraud](https://github.com/user-attachments/assets/160c8ac9-bbb3-4360-8a2c-7430e11b9a90)


The map shows that Texas, New York, Pennsylvania, and California have the highest fraud rates, as indicated by the darkest green shading, while other states have lower fraud percentages.

---

### 2. Fraud Distribution Across Days of the Week
This query determines which days of the week are more prone to fraudulent transactions.

```sql
WITH total_fraud AS
(SELECT COUNT(*) AS total_fraud_count FROM creditcardfraud
WHERE is_fraud = 1)

SELECT
DATENAME(WEEKDAY, transaction_time_date),
ROUND(CAST(COUNT(DATENAME(WEEKDAY, transaction_time_date)) AS FLOAT) / (SELECT total_fraud_count FROM total_fraud) * 100, 2)
FROM creditcardfraud
WHERE DATENAME(WEEKDAY, transaction_time_date) IS NOT NULL AND is_fraud = 1
GROUP BY DATENAME(WEEKDAY, transaction_time_date);
```
### Visualization:
![daysxfraud](https://github.com/user-attachments/assets/366156e9-0b7e-4bf2-8b6a-b1eeea36a06c)

This bar chart shows that fraudulent transactions peak on Saturday and Sunday, with both days having the highest percentages of fraud, while Tuesday and Wednesday have the lowest fraud rates during the week.

---

### 3. Fraud Distribution by City Population Size
This query categorizes fraudulent transactions by the size of the city's population.

```sql
SELECT
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop < 50000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2 ) AS FLOAT) AS under50k,
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop > 50000 AND city_pop < 100000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS FLOAT) AS over50under100,
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop > 100000 AND city_pop < 1000000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS FLOAT) AS over100under1mil,
CAST(ROUND(CAST(COUNT(CASE WHEN city_pop > 1000000 THEN 1 END) AS DECIMAL) / COUNT(*) * 100, 2) AS FLOAT) AS over1mil
FROM creditcardfraud
WHERE is_fraud = 1;
```
### Visualization: 

![populationxfraud](https://github.com/user-attachments/assets/22c9f4dc-696b-4cd0-b498-f2f1210d698b)

This chart shows that cities with populations under 50,000 experience the highest percentage of fraudulent transactions, accounting for nearly 80% of fraud, while larger cities have significantly lower fraud rates.

---

### 4. Fraudulent Transactions by Purchase Amount
This query analyzes how fraud rates differ across various transaction sizes.

```sql
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
    is_fraud = 1;
```
### Visualization: 


![transactionxfraud](https://github.com/user-attachments/assets/0566b4ab-1a8d-4cde-8a6c-7179c923f3ca)
This line graph demonstrates that fraud rates rise as transaction amounts increase, with transactions over $500 making up about 50% of all fraudulent transactions. In contrast, transactions under $100 show much lower fraud rates.

---

### 5. Fraudulent Transactions by Time of Day
This query looks at fraudulent transactions by the time of day to understand patterns during morning, afternoon, evening, and night.

```sql
SELECT
    ROUND(CAST(COUNT(CASE WHEN DATEPART(HOUR, transaction_time_date) >= 6  AND DATEPART(HOUR, transaction_time_date) < 12 THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS morning_percentage,
    ROUND(CAST(COUNT(CASE WHEN DATEPART(HOUR, transaction_time_date) >= 12  AND DATEPART(HOUR, transaction_time_date) < 18 THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS afternoon_percentage,
    ROUND(CAST(COUNT(CASE WHEN DATEPART(HOUR, transaction_time_date) >= 18  AND DATEPART(HOUR, transaction_time_date) < 22 THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS evening_percentage,
    ROUND(CAST(COUNT(CASE WHEN (DATEPART(HOUR, transaction_time_date) >= 22 OR DATEPART(HOUR, transaction_time_date) < 6) THEN 1 END) AS FLOAT) * 100.0 / CAST(COUNT(*) AS FLOAT), 2) AS night_percentage
FROM creditcardfraud
WHERE is_fraud = 1;
```
### Visualization: 

![fraudxtimeofday](https://github.com/user-attachments/assets/7d321077-ce82-43b2-a923-5c41513a70e2)

This bar chart shows that the vast majority of fraudulent transactions occur at night, accounting for 86.2% of the total, while fraud during the morning, afternoon, and evening is significantly lower, with each time period representing less than 7% of the total fraud activity.

