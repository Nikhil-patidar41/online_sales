DROP TABLE IF EXISTS dbo.online_Sale;
select * from online_sales

sp_help'online_sales'

SELECT SUM(ISNULL(total_revenue, 0)) AS total_revenue_cleaned
FROM online_sales;

--total_revenue_cleaned is 80567.8495330811


SELECT REGION, SUM(total_revenue) AS revenue
FROM online_sales
WHERE total_revenue IS NOT NULL
GROUP BY REGION
HAVING SUM(total_revenue) > 30000;

--North America	36844.3396911621


select region ,sum(total_revenue) from online_sales
group by region

--Asia	22455.4499397278
--Europe	21268.0599021912
--North America	36844.3396911621

select product_category ,sum(units_sold) as most_sold
from online_sales
group by product_category
order by most_sold desc;

/*Clothing	145
Books	114
Sports	88
Electronics	66
Home Appliances	59
Beauty Products	46*/

select top(5) product_name , sum(units_sold) as most_sold
from online_sales
group by product_name
order by most_sold desc;
 /* Hanes ComfortSoft T-Shirt	10
The Catcher in the Rye by J.D. Salinger	7
Gap Essential Crewneck T-Shirt	6
Nike Air Force 1	6
Spalding NBA Street Basketball	6   */

select product_category ,count(payment_method) as pyment_method
from online_sales 
group by product_category
order by pyment_method desc;

/*Beauty Products	40
Books	40
Clothing	40
Electronics	40
Home Appliances	40
Sports	40*/

SELECT TOP 3 
    FORMAT(date, 'yyyy-MM') AS month,
    SUM(total_revenue) AS total_profit
FROM online_sales
GROUP BY FORMAT(date, 'yyyy-MM')
ORDER BY total_profit DESC;
/*2024-01	14548.3198757172
2024-03	12849.2398948669
2024-04	12451.6899147034*/

SELECT 
    product_category,
    YEAR(date) AS year,
    MONTH(date) AS month,
    AVG(total_revenue) AS avg_monthly_revenue
FROM online_sales
GROUP BY  product_category, YEAR(date), MONTH(date)
order by avg_monthly_revenue desc;



select transaction_id 
from online_sales
group by transaction_id 
having count(distinct transaction_id )>1

-- there no transaction_id greater then 1 no id is repeated



SELECT 
    transaction_id,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM online_sales;

/*10103	3899.98999023438	1
10086	2599.97998046875	2
10007	2499.98999023438	3
10217	2399	4
10001	1999.97998046875	5*/

select payment_method , sum(total_revenue) as total
from online_sales
group by payment_method
order by total

/*Debit Card	8128.93005371094
PayPal	21268.0599021912
Credit Card	51170.859577179*/










