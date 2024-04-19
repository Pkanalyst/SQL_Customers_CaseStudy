'Created Database' 

Create Database Customers;

'Activate Database'

Use Customers;

'Table Selection'

select * from Customer;
Select * from items;

'Added a column name NewOD and convereted the Order_date To NewO_D using Str_todate function '

alter table items
add column NewO_D date;

update items
set newo_d =str_to_date(order_date,"%d-%c-%Y");

'Note -->'

'Items Table = items_ordered Table'

															'Task 1 (Comparison Operators)'

'1.	From the items_ordered table, select a list of all items purchased for customerid 10449. Display the customerid, item, and price for this customer.'

select customerid,item,price from items
where customerid ="10449";

'2.	Select all columns from the items_ordered table for whoever purchased a Tent.'

select * from items 
where item= "tent";

'3.	Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter "S".'

select Customerid,item,order_date,price from items
where item like "s%";

'4.	Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.'

select distinct(item) from items;


															'Task  2 (Aggregate Functions)'


'1.	Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.'

select max(price) from items;

'2.	Select the average price of all of the items ordered that were purchased in the month of Dec.'

select avg(price) from items
where month(newo_d)=12;

'3.	What are the total number of rows in the items_ordered table?'

select count(*) as Total_Rows from items;

'4.	For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? Hint: Your query should return the price' 
'only.'

select min(price) from items
where item="tent";

															'Task  3 (Group By clause)'


'1.	How many people are in each unique state in the customers table? Select the state and display the number of people in each. Hint: count is used '
'to count rows in a column, sum works on numeric data only.'

select State,count(*) as Total_Customers from customer
group by state;

'2.	From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Hint: The items will need to' 
'be broken up into separate groups.'

select Item,max(price) as Maximum_Price,min(price) as Minimum_Price from items
group by Item;

'3.	How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their '
'orders. '

select Customerid,count(*) Total_Orders from items
group by Customerid;

															'Task  4 (HAVING clause)'


'1.	How many people are in each unique state in the customers table that have more than one person in the state? Select the state and display the '
'number of how many people are in each if it's 'greater than 1.'

select state,count(*) as Total_Cust from customer
group by state
having Total_Cust >1;

'2.	From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table. Only display the results '
'if the maximum price for one of the items is greater than 190.00.'

select Item,max(price) as Maximum_Price,min(price) as Minimum_Price from items
group by Item
having maximum_price >190;

'3.	How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their'
' orders if they purchased more than 1 item.'

select Customerid,count(*) as Total_Orders from items
group by Customerid
having Total_orders>1;

														'Task  5 (ORDER BY clause)'


'1.	Select the lastname, firstname, and city for all customers in the customers table. Display the results in Ascending Order based on the lastname.'

select lastname,firstname,city from customer
order by (lastname) asc;

'2.	Same thing as exercise #1, but display the results in Descending order.'

select lastname,firstname,city from customer
order by (lastname) desc;

'3.	Select the item and price for all of the items in the items_ordered table that the price is greater than 10.00. Display the results in '
'Ascending order based on the price.'

select item,price from items
where price>10
order by (price) asc;

select item,price from items
having price>10
order by (price) asc;

											 'Task  6 (Combining Conditions & Boolean Operators).'


'1.	Select the customerid, order_date, and item from the items_ordered table for all items unless they are 'Snow Shoes' or if they are 'Ear Muffs'. 
'\'Display the rows as long as they are not either of these two items.\''

select customerid,Newo_d,item from items
where item not in ("Snow shoes","Ear muffs");

'\'2.	Select the item and price of all items that start with the letters 'S', 'P', or 'F'.\''

select item ,price from items
where item like "s%" or item like "p%" or item like "f%" ;

'Task  7 (IN & Between)'


'1.	Select the date, item, and price from the items_ordered table for all of the rows that have a price value ranging from 10.00 to 80.00.'

select NewO_d,item,price from items
where price between 10 and 80;

'2.	Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, '
'Oklahoma, Colorado, or Hawaii.'

select Firstname,city,state from customer
where state in ("Arizona", "Washington", "Oklahoma", "Colorado","Hawaii");

														'Task  8 (Mathematical Functions)'


'1. Select the item and per unit price for each item in the items_ordered table. Hint: Divide the price by the quantity.'

select item ,(price/quantity) as Per_Unit_Price from items;


                                                         'Task  9 (Table Joins)'


'\'1.	Write a query using a join to determine which items were ordered by each of the customers in the customers table. Select the customerid,\''
'\' firstname, lastname, order_date, item, and price for everything each customer purchased in the items_ordered table.\''

select C.Customerid,C.firstname,c.lastname,I.Newo_d,I.item,I.price from Customer as C inner join Items as I
ON c.customerid=I.customerid;



'\'2.	Repeat exercise #1, however display the results sorted by state in descending order.\''

select C.Customerid,C.firstname,c.lastname,I.Newo_d,I.item,I.price from Customer as C inner join Items as I
ON c.customerid=I.customerid
order by (C.state) desc;
