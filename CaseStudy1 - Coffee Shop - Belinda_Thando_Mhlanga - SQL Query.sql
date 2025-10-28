-- To check all the columns names in my data 
-- To chek the data types in my data 
SELECT*
FROM casestudy.project.coffee_shop
LIMIT 10;

-------Exploratory Data Analysis------------- 

--check the different columns 
--check the categorrical columns, what values they have 
SELECT DISTINCT store_location
FROM casestudy.project.coffee_shop;


-- check the different product category
-- number of the product category
SELECT DISTINCT product_category
FROM casestudy.project.coffee_shop;


-- number of the product type
SELECT DISTINCT product_type
FROM casestudy.project.coffee_shop;

----------Date and Time Functions-----------

--check the earliest transaxtion date
--Use MIN to check when the shop started/ WHEN opened
SELECT MIN(transaction_date) AS first_operating_date
FROM casestudy.project.coffee_shop;

-- last operating day
--checking the latest transaxtion date 
SELECT MAX(transaction_date) AS last_operating_date
FROM casestudy.project.coffee_shop;

--opening time 
--checking the earliest time 
SELECT MIN(transaction_time) AS opening_hour
FROM casestudy.project.coffee_shop;

--closing time
--checking the latest transaction time 
SELECT MAX(transaction_time) AS opening_hour
FROM casestudy.project.coffee_shop;

----------------------------------------------------------------------

---Big Query

SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name,
       CASE
           WHEN DAYNAME(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
           ELSE 'Weekday'
       END AS day_classification,
       MONTHNAME(transaction_date) AS month_name,

--transaction_time,
    CASE
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN transaction_time >= '17:00:00' THEN 'Evening'
    END AS time_classification,
       
       HOUR(transaction_time) AS hour_of_day,
    
-- categotical data
    Store_location,
    product_category,
    product_detail,
    product_type,
    
    --unit_price,
    --transaction_qty,
-- Revenue calculation
    SUM(transaction_qty * unit_price) AS revenue,
    
-- ID's: How many different transaction do we have in the shop
    COUNT(DISTINCT transaction_id) AS number_of_sales,


FROM casestudy.project.coffee_shop
GROUP BY ALL;

