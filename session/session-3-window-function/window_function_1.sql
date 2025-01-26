-- start with identify one address exist more than one
SELECT suburb, address, count(1)
FROM melbourne_housing
GROUP BY 1, 2 ORDER BY 3 DESC;

-- here is one of the example house that been sold twice -> good to use as window function example
SELECT * 
FROM melbourne_housing
WHERE suburb = 'Middle Park' 
AND address = '81 Carter St'

-- Window function example
-- Description: show the change of price over time, from 2016 to 2017
SELECT suburb, address, price, sellerG, date, ROW_NUMBER () OVER (PARTITION BY suburb, address ORDER BY date desc) rn
FROM melbourne_housing 
WHERE suburb = 'Middle Park' 
AND address = '81 Carter St'