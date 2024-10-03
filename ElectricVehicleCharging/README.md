# EV Charging Patterns Analysis

## Project Overview
This project analyzes electric vehicle (EV) charging patterns using a dataset that includes details about charging sessions, such as start and end times, charging rates, state of charge (SoC), and more. The analysis aims to uncover key insights into user behavior, peak charging hours, seasonal trends, and the relationship between charging duration and cost.

## Key Findings

1. **Peak Charging Hours**:
   - The busiest charging hours are between **4pm and 8pm**, likely reflecting after work charging behavior.

2. **Charging Rate by Charger Type**:
   - Contrary to expectations, **Level 2 chargers** show a higher average charging rate than **DC Fast Chargers**, which could indicate data quality issues or unique charging circumstances.

3. **State of Charge (SoC) Change**:
   - Over 50% of users let their cars charge up to about **15-20%** before ending the session, indicating that most users perform shorter, partial charges rather than full charges.

4. **Driver Type and SoC Change**:
   - **Casual drivers** have the highest average SoC change (~29%), while **long-distance travelers** have the lowest (~23.5%), suggesting different charging habits between the two groups.

## Analysis Breakdown

- **Peak Charging Hours**: We extracted the start and end hours of charging sessions to determine the busiest periods.
- **Seasonal Patterns**: Charging data was analyzed by month to uncover any seasonal trends in user behavior.
- **Charging Duration vs. Cost**: A scatter plot was used to visualize any correlation between the duration of charging and the cost incurred by the user.
- **Charger Type and Charging Rate**: We grouped the data by charger type to examine the average charging rate for each type.
- **State of Charge (SoC) Change**: We calculated the difference between the start and end SoC to understand how much users charged their vehicles during a session.

