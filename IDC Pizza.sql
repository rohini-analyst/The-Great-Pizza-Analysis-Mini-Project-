use idc_pizza;


-- 1. Create the pizza_types table (No Foreign Keys)
CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY, 
    name VARCHAR(100),                     
    category VARCHAR(50),                  
    ingredients TEXT                       
);

-- 2. Create the pizzas table (FK to pizza_types)
CREATE TABLE pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,   
    pizza_type_id VARCHAR(50) REFERENCES pizza_types(pizza_type_id),
    size VARCHAR(10),                   
    price NUMERIC(5, 2)                 
);

-- 3. Create the orders table (No Foreign Keys)

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE,
    time TIME 
);

-- 4. Create the order_details table (FK to orders and pizzas)
CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    pizza_id VARCHAR(50) REFERENCES pizzas(pizza_id),
    quantity INT
);



show tables;
select * from order_details limit 5;
select * from orders limit 5;
select * from pizzas limit 5;
select * from pizza_types limit 5;
select sum(quantity) from order_details;


select distinct  category from pizza_types;


-- 2. List all unique pizza categories (DISTINCT).
select distinct category 
from pizza_types;

-- 3. Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
select pizza_type_id, name, coalesce(ingredients,"Missing Data") as ingredient
from pizza_types
limit 5;


-- 4. Check for pizzas missing a price (IS NULL).
select pizza_id,price
from pizzas
where price is null;

-- 5. Orders placed on '2015-01-01' (SELECT + WHERE).
select * 
from orders 
where 
	date ='2015-01-01';


-- 6. List pizzas with price descending.
select * 
from pizzas
order by price desc;

-- 7. Pizzas sold in sizes 'L' or 'XL'.
select * 
from pizzas
where size = 'L' or size='XL';

-- 8. Pizzas priced between $15.00 and $17.00.
select * 
from pizzas
where price between 15.00 and 17.00;

-- 9.Pizzas with "Chicken" in the name.
select name 
from pizza_types
where name like '%Chicken%';

-- 10. Orders on '2015-02-15' or placed after 8 PM.
select *
from orders 
where date = '2015-02-15' or time > '20:00:00';

-- 11. Total quantity of pizzas sold (SUM).
select sum(quantity) as total_qty_of_pizzas_sold 
from order_details;

-- 12. Average pizza price
select avg(price) as avg_price_of_pizza
from pizzas;


select * from order_details limit 5; 
select * from pizzas limit 5;

-- 13. Total order value per order 
select od.order_id, sum(od.quantity*p.price) as Total_order_value
from order_details od
inner join pizzas p
on od.pizza_id = p.pizza_id
group by od.order_id;

-- 14. Total quantity sold per pizza category (JOIN, GROUP BY).
select pt.category, sum(od.quantity) as sold_qty
from  order_details od
inner join pizzas p
on od.pizza_id  = p.pizza_id
inner join pizza_types pt
on  p.pizza_type_id  = pt.pizza_type_id
group by pt.category;

-- 15. Categories with more than 5,000 pizzas sold (HAVING).
select pt.category, sum(od.quantity) as sold_qty
from  order_details od
inner join pizzas p
on od.pizza_id  = p.pizza_id
inner join pizza_types pt
on  p.pizza_type_id  = pt.pizza_type_id
group by pt.category
having sold_qty >  5000 ;

-- 16. Pizzas never ordered (LEFT/RIGHT JOIN).


select p.pizza_id
from pizzas p
left join order_details od
on p.pizza_id=od.pizza_id
where od.pizza_id is null
group by  p.pizza_id ;

-- 17. Price differences between different sizes of the same pizza (SELF JOIN).

select
p1.pizza_type_id, 
	p1.size as size_1,
    p2.size as size_2,
	p1.price as price_1,
    p2.price as price_2,
    (p2.price - p1.price) as price_Diff
from pizzas p1
join pizzas p2
on p1.pizza_type_id =p2.pizza_type_id
and 
FIELD(p1.size,'S','M','L','XL','XXL')
       <
FIELD(p2.size,'S','M','L','XL','XXL')
order by p1.pizza_type_id;
