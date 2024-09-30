# Electronic Store Sales Analysis (September 2023 - September 2024)

### By: Dorghaam Haidar
You can download the excel file here: https://www.kaggle.com/datasets/cameronseamons/electronic-sales-sep2023-sep2024


## Overview
This project analyzes electronic sales data from September 2023 to September 2024. The main goals of the analysis include identifying high revenue months, understanding customer demographics (age, gender), and comparing spending behaviors of loyalty vs non-loyalty members.

## Objectives:
1. **Best Sales Months**: Which months generated the highest revenue in 2023 and 2024?
2. **Customer Demographics**: Which age group and gender contribute most to total sales?
3. **Product Preferences for Elderly (65+)**: What product types are most purchased by elderly customers?
4. **Loyalty Program Analysis**: Do loyalty members spend more on average than non-members?

## Steps and Analysis

### 1. Data Loading and Initial Cleanup
- The dataset was loaded, and missing values were handled. The **Add-ons Purchased** column was cleaned by replacing `NaN` values with `None` and missing values in **Add-on Total** with `0`.

### 2. Date Parsing and Month/Year Extraction
- The 'Purchase Date' column was converted to a datetime format.
- I extracted the **Month** and **Year** from the purchase date to analyze sales trends over time.

### 3. Identifying Best Sales Months
- I calculated the total revenue for each month in both 2023 and 2024.
- **January 2024** was the highest revenue month for 2024, while **October 2023** was the best month in 2023.

### 4. Customer Demographics: Age and Gender
- I segmented customers by **age groups** and **gender** to identify which groups contributed the most to total sales.
- The **65+ age group** (both males and females) generated the highest sales revenue.

### 5. Product Preferences for Elderly (65+)
- I analyzed the purchasing behavior of elderly customers and found that **Smartphones** had the highest sales for this group, contributing significantly to overall revenue.

### 6. Loyalty Members vs Non-Members Spending Analysis
- I compared the average spending between **loyalty members** and **non-members**.
- Surprisingly, non-members spent more on average than loyalty members, especially on high-ticket items like **Smartphones**.

## Visualizations
- **Bar Plots**: Created to show total sales by month for 2023 and 2024.
- **Bar Plot for Age Group and Gender**: Showcased the total revenue by different age groups and genders.
- **Pie Chart for Product Preferences**: Displayed the percentage of sales for each product type among elderly customers.
- **Bar Plot for Loyalty vs Non-Members**: Compared product sales between loyalty members and non-members.

## How to Run the Project
1. Download the dataset and place it in the project folder.
2. Install required Python libraries:
   ```bash
   pip install pandas numpy matplotlib seaborn
