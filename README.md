📊 Data Mart Sales Analysis

📌 About the Dataset
This project is based on Case Study #5: Data Mart from the 8-Week SQL Challenge. The dataset belongs to Data Mart, a large international supermarket chain specializing in premium, organic grocery products. The company wants to analyze its customer sales performance across different market segments.

🗂 Dataset Overview
The dataset consists of weekly sales data categorized by:

Calendar Year
Region (Geographic location of sales)
Customer Demographics (e.g., Age Band, Gender)
Sales Channel (Retail vs. Shopify)
Transaction & Sales Metrics
The dataset provides insights into how customer behavior, market trends, and different demographics contribute to sales performance.

🎯 Project Goals
This project aims to analyze customer sales trends by segmenting sales based on various factors such as age bands, demographics, and sales channels. The insights derived from this analysis will help Data Mart understand:
✔ How different demographics contribute to sales performance
✔ The effectiveness of sales channels (Retail vs. Shopify)
✔ Annual sales trends across different regions
✔ Average transaction size and percentage contribution of each segment

🛠 Tech Stack Used
SQL (PostgreSQL) – Data analysis and aggregation



📌 Key Analysis Performed
✅ Total and Percentage of Sales by Demographics
✅ Average Transaction Size for Each Year & Sales Channel
✅ Regional Contribution to Total Sales
✅ Top-Contributing Age Band & Demographic for Retail Sales
✅ Year-over-Year Sales Trends

📂 Data Source
The dataset and problem statements are sourced from Case Study #5: Data Mart, part of the 8-Week SQL Challenge.

🚀 How to execute this Data
1️⃣ 
Install PostgreSQL on your system.
Execute Data_mart.sql to create the database and tables.
Run Data_mart_2.sql to perform analysis.
In other to help Danny solve this problem using data, there are questions that needed to be addressed but before then data has to be clean.


These are the Data cleansing steps, The cleansing steps is contained in the database creation  'Data_mart_2.sql':

The week_date was converted to a DATE format

A column was added and this contained the week_number for each week_date value, for example values from the 1st of January to 7th of January is stored as 1, 8th to 14th will be 2 etc

A month_number with the calendar month for each week_date value was added as the second column

A calendar_year column containing either 2018, 2019 or 2020 values extracted from the week_date column was added as the 3rd column

A new column called 'age_band' after the original segment column a mapping on the number inside the segment value was added using the below assignment:

segment 	age_band
1	         Young Adults
2	        Middle Aged
3 or 4	     Retirees

A demographic column using the following mapping below for the first letter in the segment values was added:

segment 	demographic
C	         Couples
F	        Families

All null string values were assigned an "unknown" string value in the original segment column as well as the new age_band and demographic columns

A new  column "avg_transaction" as the sales value divided by transactions rounded to 2 decimal places for each record was generated to the original data

Data Exploration Questions
What day of the week is used for each week_date value?
What range of week numbers are missing from the dataset?
How many total transactions were there for each year in the dataset?
What is the total sales for each region for each month?
What is the total count of transactions for each platform
What is the percentage of sales for Retail vs Shopify for each month?
What is the percentage of sales by demographic for each year in the dataset?
Which age_band and demographic values contribute the most to Retail sales?
Can we use the avg_transaction column to find the average transaction size for each year for Retail vs Shopify? If not - how would you calculate it instead?


📢 Acknowledgment
Thanks to Danny Ma for curating the SQL Challenge.