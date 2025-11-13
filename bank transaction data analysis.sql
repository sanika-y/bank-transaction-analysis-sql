create table transactions(
Transaction_ID serial primary key,
Customer_ID int Not null,
Transaction_Date date not null,
Transaction_Type varchar(20),
Amount numeric(12,2) not null,
Account_Balance_After_Transaction numeric(12,2) not null,
Branch_Name varchar(100)
);
ALTER TABLE transactions
ALTER COLUMN Transaction_ID TYPE VARCHAR(20);
ALTER TABLE transactions
ALTER COLUMN Customer_ID TYPE VARCHAR(20);

select * from transactions;

COPY transactions(Transaction_ID, Customer_ID, Transaction_Date, Transaction_Type, Amount, Account_Balance_After_Transaction, Branch_Name)
FROM 'C:\clg project\Bank_Transactions_Dataset.csv'
DELIMITER ','
CSV HEADER;
--1)Select all transactions from the table.**
select * from transactions;

--2)Select only Transaction_ID, Customer_ID, Amount, and Transaction_Date.
select Transaction_ID,Customer_ID, Amount, Transaction_Date from transactions;

--3)Retrieve all Withdrawal transactions.
select *from transactions where transaction_type = 'Withdrawal';

--4)Retrieve all transactions within a specific date range.
select * from transactions where transaction_date between '2025-06-11' and '2025-10-14';

--5)Count the total number of transactions.
select count(*) as total_transactions from transactions;

--6)Calculate the total and average transaction amount.
select sum(Amount) as total_amount from transactions;
select avg(Amount) as average_amount from transactions;

--7)Find the highest and lowest transaction amounts.
select min(Amount)  as lowest_transaction from transactions;
select max(Amount)  as highest_transaction from transactions;

--8)Count the number of transactions for each transaction type (.
select transaction_type ,count(*) as _no_of_transactions from transactions group by transaction_type;

--9)Find the total transaction amount per branch..
select branch_name,
sum(amount) as total_amount,
COUNT(*) AS total_transactions
from transactions group by branch_name;

--10)Calculate total transactions and amount per Customer_ID.
select customer_ID ,
sum(amount) as amount_per_cust,
count(*) as total_transactions
from transactions group by customer_ID order by  amount_per_cust DESC;

--11)Generate a monthly transaction summary.
select date_trunc('month',transaction_date) as month,
sum(amount) as amount_per_cust,
count(*) as total_transactions
from transactions group by month order by month;

--12)Find the highest transaction per branch.
select branch_name ,max(Amount) as highest_transaction from transactions group by branch_name;
-- Calculate running balance per customer
SELECT 
    Customer_ID,
    Transaction_ID,
    Transaction_Date,
    Amount,
    SUM(Amount) OVER (
        PARTITION BY Customer_ID
        ORDER BY Transaction_Date
    ) AS running_balance
FROM transactions
ORDER BY Customer_ID, Transaction_Date;

--13)Calculate a running balance per customer using window functions.
-- Calculate running balance per customer
select  customer_id, transaction_id,transaction_date,amount,
sum(amount) over (  partition by customer_id order by transaction_date ) as running_balance
from transactions
order by customer_id, transaction_date;

--14)List top 5 customers by total transaction amount.
select customer_ID , count(*) as total_transaction_amount,
sum (amount) as total_transactions_amount from transactions
group by customer_ID
order by total_transactions_amount desc limit 5;

--15)Count transactions per Transaction_Type per branch.
select branch_name ,transaction_type,
count(*) as transaction_t  from transactions
group by branch_name,transaction_type
order by branch_name asc;

--16)Identify transactions above a certain threshold (e.g., suspiciously large transactions).
select * from transactions where amount > 45000;

--17)Calculate the percentage of credit vs debit transactions.
select Transaction_Type,
count(*) * 100.0/(select count(*) from transactions)as percentage
from transactions
group by Transaction_Type;

--18)Find customers who have only deposit transactions.
select Customer_ID,transaction_type from transactions where transaction_type='Deposit';

--19)List all branches where total amount of transactions is greater than 1,00,000.
select  branch_name,
sum(amount) as total_amount
from transactions
group by branch_name
having sum(amount) > 100000;

--20)List transaction types where average amount is more than 10,000.

select transaction_type,
avg(amount) as avg_amount
from transactions
group by transaction_type
having avg(amount) > 10000;

