# Bank Transactions SQL Analysis Project

## Project Overview
This project involves analyzing 500+ banking transactions to extract insights on customer behavior, branch performance, and transaction trends. Using PostgreSQL, queries were designed to aggregate, filter, and analyze the dataset, demonstrating practical SQL skills including window functions, aggregation, and filtering. The project simulates real-world banking data analysis and helps understand how financial institutions track transactions and customer activity.

## Dataset Details
- **Number of rows:** 500 transactions  
- **Columns:**  
  - Transaction_ID  
  - Customer_ID  
  - Transaction_Date  
  - Transaction_Type (Deposit / Withdrawal)  
  - Amount  
  - Account_Balance_After_Transaction  
  - Branch_Name  
- **Format:** CSV / Excel, imported into PostgreSQL for analysis  

## Objectives
- Clean and organize raw transaction data in SQL  
- Analyze customer and branch-level transaction patterns  
- Calculate totals, averages, and running balances  
- Identify high-value transactions and top-performing customers  
- Summarize insights in a clear and structured format suitable for portfolio showcase  

## Key Questions / Analysis Performed
1. Select all transactions from the table  
2. Select only Transaction_ID, Customer_ID, Amount, and Transaction_Date  
3. Retrieve all Withdrawal transactions  
4. Retrieve all transactions within a specific date range  
5. Count the total number of transactions  
6. Calculate the total and average transaction amount  
7. Find the highest and lowest transaction amounts  
8. Count the number of transactions for each transaction type  
9. Find the total transaction amount per branch  
10. Calculate total transactions and amount per Customer_ID  
11. Generate a monthly transaction summary  
12. Find the highest transaction per branch  
13. Calculate a running balance per customer using window functions  
14. List top 5 customers by total transaction amount  
15. Count transactions per Transaction_Type per branch  
16. Identify transactions above a certain threshold (e.g., suspiciously large transactions)  
17. Calculate the percentage of credit vs debit transactions  
18. Find customers who have only deposit transactions  
19. List all branches where total amount of transactions is greater than ₹1,00,000  
20. List transaction types where average amount is more than ₹10,000  

## Key Insights
- Mumbai branch recorded the highest total transactions amount  
- Top 5 customers contributed approximately 18% of total transaction value  
- The largest transaction in the dataset was ₹48,750  
- Average transaction amount across all customers was ₹12,450  
- Deposits represented 56% of transactions, withdrawals 44%  
- Peak monthly transaction activity occurred in July and September  
- 23 customers made only deposit transactions, showing saving patterns  
- High-value transactions (>₹45,000) were identified for risk or monitoring purposes  
- Branches with total transactions above ₹1,00,000: Mumbai, Pune, Delhi  
- Deposit transactions had the highest average amounts, above ₹10,000  

## Tools and Skills Demonstrated
- PostgreSQL / pgAdmin for database creation, queries, and analysis  
- SQL skills: SELECT, WHERE, GROUP BY, HAVING, window functions, aggregation  
- Data handling: Importing CSV/Excel files into SQL and analyzing structured data  

## Files Included
- `transactions.sql` → Contains all SQL queries used  
- `Bank_Transactions_Dataset.xlsx` → Raw dataset used for analysis  

## How to Run
1. Clone or download the repository  
2. Import `Bank_Transactions_Dataset.xlsx` into PostgreSQL  
3. Open `transactions.sql` in pgAdmin  
4. Execute the queries to view results and insights  
