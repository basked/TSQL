/*********************************************
**************Aggregate functions ************
*********************************************/
select sum(qty)
from orders
-- сумма по проданным продуктам
select productId
,      sum(qty)
from orders
group by productId
having sum(qty)>10
-- мин мах  проданным продуктам 
select productId
,      min(qty)
,      max(qty) 
from orders
group by productId
--среднее по проданным продуктам -- это не действительное среднее
select productId
,      avg(qty) -- это не действительное среднее
from orders
group by productId
-- перепишем запрос с действительным средним значением
select productId
,      SUM(qty*price)/SUM(qty) -- это не действительное среднее
from orders
group by productId

--COUNT 
SELECT count(*) from orders  --5

SELECT count(date) from orders  --4 NULL не учитывает

SELECT count(DISTINCT productID) from orders -- 4 два оинаковых id

SELECT city, count(city) from orders  group by city

-- вывести статистику по товарам: в скольких заказаз, в каком кол-ве, 
-- на какую сумму, по какой мин, макс цене, средн¤¤ цена
SELECT ProductID,
COUNT(Id), 
SUM(Qty) Total_Qty,
SUM(Price*Qty) Total_Sum,
MIN(Price) MIN_Price, 
MAX(Price) MAX_Price,
SUM(Price*Qty)/SUM(Qty) AVG_Price
FROM Orders
WHERE City IS NOT NULL
GROUP BY ProductID

-- вывести статистику по продажам: средн¤¤ сумма заказа из каждого города
SELECT City,
AVG(Qty * Price) AVG_Sale
FROM Orders
GROUP BY City


