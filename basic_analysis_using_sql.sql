use sales; -- to start using the database
show tables; -- to see all the tables in the database

select table_name, column_name, data_type, is_nullable
from information_schema.columns
where table_schema = database(); -- single query to fetch all the columns of the all the tables in database

-- showing all the tables with data
select * from customers;
select * from date;
select * from markets;
select * from products;
select * from transactions;

select distinct customer_type from customers; -- shows only two types of customer (brick & mortar, e-commerce)
select distinct markets_name from markets; -- shows all the current market cities
select distinct zone from markets; -- south, central, north
select distinct product_type from products; -- own brand, distribution
select distinct currency from transactions; -- shows discrepancy as 'inr', 'usd', 'inr/r'

select m.markets_name as markets_name, round(sum(t.sales_amount)/100000, 2) as total_sales 
from transactions t inner join markets m
on m.markets_code = t.market_code
group by m.markets_name
order by sum(sales_amount) desc; -- markets wise sales amount

-- showing month wise, year wise based on the sales_amount
select d.year, round(sum(t.sales_amount)/100000, 2) as total_sales
from transactions t inner join date d 
on d.date = t.order_date
group by d.year order by total_sales desc;

select d.date_yy_mmm as month_year, round(sum(t.sales_amount)/100000, 2) as total_sales
from transactions t inner join date d 
on d.date = t.order_date
group by month_year order by month_year asc;


