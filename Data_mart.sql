SELECT *
FROM data_mart.weekly_sales;


SELECT DISTINCT segment
FROM data_mart.weekly_sales
ORDER BY week_date;


SELECT DISTINCT month_number
FROM data_mart.weekly_sales;

--What day of the week is used for each week_date value?
SELECT *, EXTRACT(DAY FROM week_date) AS dotw
FROM data_mart.weekly_sales;

--What range of week numbers are missing from the dataset?
SELECT DISTINCT week_number
FROM data_mart.weekly_sales;

--How many total transactions were there for each year in the dataset?

SELECT calendar_year, SUM(transactions) AS s_transactions
FROM data_mart.weekly_sales
GROUP BY calendar_year
ORDER BY calendar_year;

--What is the total sales for each region for each month?
SELECT month_number, region, SUM(transactions) AS s_transactions
FROM data_mart.weekly_sales
GROUP BY region,month_number
ORDER BY month_number,region;

--What is the total count of transactions for each platform
SELECT platform, COUNT(transactions) AS total_count
FROM data_mart.weekly_sales
GROUP BY platform
ORDER BY platform;

--What is the percentage of sales for Retail vs Shopify for each month

SELECT DISTINCT demographic
FROM data_mart.weekly_sales;

WITH tab_1 AS (
				SELECT month_number, platform, SUM(sales) AS total_sales
				FROM data_mart.weekly_sales
				GROUP BY month_number, platform
)
SELECT month_number, 
		platform,
		total_sales, 
		ROUND((total_sales * 100.0) / SUM(total_sales) OVER (PARTITION BY month_number), 2) AS percentage_sales
FROM tab_1;


--What is the percentage of sales by demographic for each year in the dataset?

WITH yearly_sales AS (
    SELECT 
        calendar_year, 
        demographic, 
        SUM(sales) AS total_sales 
    FROM data_mart.weekly_sales
    GROUP BY calendar_year, demographic
),
total_yearly_sales AS (
    SELECT 
        calendar_year,
        SUM(total_sales) AS yearly_total
    FROM yearly_sales
    GROUP BY calendar_year
)
SELECT 
    ys.calendar_year,
    ys.demographic,
    ys.total_sales,
    ROUND((ys.total_sales::NUMERIC / tys.yearly_total) * 100, 2) AS percentage_sales
FROM yearly_sales ys
JOIN total_yearly_sales tys
ON ys.calendar_year = tys.calendar_year  
ORDER BY ys.calendar_year, ys.demographic;


--Which age_band and demographic values contribute the most to Retail sales?

SELECT platform, demographic, age_band, SUM(sales) AS highest_contributor_in_sales
FROM data_mart.weekly_sales
GROUP BY platform, age_band,demographic
ORDER BY platform, highest_contributor_in_sales
LIMIT 1


--Can the avg_transaction column to find the average transaction size for each year for Retail vs Shopify? 
   --If not - how would you calculate it instead?
--ANSWER Simply taking the average of avg_transaction could lead to misleading results due to double-averaging i.e., averaging already-averaged values   

--to calculate it

SELECT 
    calendar_year,
    platform,
    SUM(sales) / NULLIF(SUM(transactions), 0) AS avg_transaction_size
FROM data_mart.weekly_sales
GROUP BY calendar_year, platform
ORDER BY calendar_year, platform;


