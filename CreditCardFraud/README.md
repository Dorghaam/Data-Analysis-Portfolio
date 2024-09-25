# Credit Card Fraud Analysis

## Overview
This project analyzes credit card fraud data to uncover insights into fraudulent transactions. The data was cleaned and processed to remove null values before running SQL queries to answer specific questions about the distribution of fraud across states, transaction amounts, city populations, and time of day. The findings were then visualized using Tableau and Excel to provide a clear representation of the results.

### Objectives:
- Clean the data by removing null values from the initial dataset.
- Write SQL queries to answer key questions about fraudulent transactions.
- Visualize the results using Tableau and Excel to illustrate fraud patterns and trends.

## Data Cleaning Process
The initial dataset was provided in an Excel file, which contained missing values and inconsistencies. The following steps were performed to clean the data:
- Removed all rows with null values.
- Checked for and corrected any data inconsistencies, ensuring a clean and accurate dataset.
- Removed unnecessary columns

## SQL Query Analysis
Once the data was cleaned, several SQL queries were written to address specific questions about fraud patterns. The key queries answered the following questions:

1. **Statewise Fraud Percentage Analysis**:
   - Identifies which states have the highest percentage of fraudulent transactions.
   
2. **Fraudulent Transactions by Day of the Week**:
   - Analyzes which days of the week have the most fraud occurrences.

3. **Fraud by City Population**:
   - Examines how the population size of cities affects the likelihood of fraud.

4. **Fraud by Purchase Amount**:
   - Breaks down fraudulent transactions by the size of the transaction, revealing whether higher value purchases are more likely to be fraudulent.

5. **Fraud by Time of Day**:
   - Investigates which time of day (morning, afternoon, evening, night) is more prone to fraudulent transactions.

The SQL queries used for this analysis are included in the `credotcardfraudproject1.sql` file.

## Visualizations
To better understand the data and present the findings, visualizations were created using both Tableau and Excel:
- **Tableau**: Used for creating a map and charts.
- **Excel**: Used for additional charts and graphs to visualize the data in a clear, accessible format.

### Key Visuals:
To better understand the data and present the findings, five key visualizations were created using Tableau and Excel. These visuals showcase fraud distribution based on different factors such as state, time of day, city population, transaction amount, and day of the week.

1. **Fraud by State (Choropleth Map)**:
   - This map visualizes the percentage of fraudulent transactions in each state. States with higher fraud rates are colored darker, while those with lower rates are lighter. This helps identify geographical fraud patterns across the United States.

2. **Fraud by Day of the Week (Bar Chart)**:
   - This bar graph displays the percentage of fraud occurrences for each day of the week. It helps identify which days experience the most fraudulent transactions, giving insight into daily fraud trends.

3. **Fraud by Time of Day (Bar Chart)**:
   - A bar chart that displays the percentage of fraud happening during different times of the day (morning, afternoon, evening, night). This provides a clear picture of the time periods where fraudulent activity is most likely to occur.

4. **Fraud by City Population (Bar Chart)**:
   - This bar chart breaks down the fraud occurrences based on city population size, allowing for a comparison between fraud rates in small, medium, and large cities. This helps reveal whether fraud is more prevalent in larger or smaller populations.

5. **Fraud by Transaction Amount (Line Graph)**:
   - A line graph that highlights the relationship between transaction size and the likelihood of fraud. It shows how the number of fraudulent transactions varies across different purchase amounts, helping to determine which transaction sizes are most vulnerable to fraud.

## Conclusion
This project demonstrates the process of cleaning and analyzing a dataset using SQL and visualizing the results with Tableau and Excel. The insights gained can help better understand fraud patterns, leading to more informed decisions and improved fraud detection strategies.

## Contact
For any questions or feedback, feel free to reach out at [dorghaam.416@gmail.com].
