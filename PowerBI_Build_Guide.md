# Power BI Dashboard Build Guide

## Data sources
Import `data/customers.csv`, `data/accounts.csv`, and `data/transactions.csv` into Power BI Desktop. Alternatively, use Excel's sample workbook.

## Model relationships
- Customers[customer_id] (1) -> Accounts[customer_id] (*)
- Accounts[account_id] (1) -> Transactions[account_id] (*)

Use single-direction filtering from Customers to Accounts to Transactions unless you have a reason to change the model.

## Measures
Copy measures from `powerbi/Measures.dax` into Power BI Desktop. Ensure table names and column names match the imported data.

## Recommended report pages
1. **Executive Overview:** customers, accounts, successful transaction count/value, average successful transaction.
2. **Transaction Trends:** successful transaction value by month and transaction count by month.
3. **Channel Analysis:** transaction value by channel and average amount by channel.
4. **Customer Segmentation:** customer segment, city, age bands, account type.
5. **Transaction Controls:** status distribution and flagged transactions for review.

## Recommended visuals
- KPI cards for customers, accounts, successful transactions, and successful value.
- Line chart for monthly successful transaction value.
- Bar chart for transaction value by channel.
- Donut or bar chart for transaction status.
- Matrix for customer segment and transaction metrics.
- Table for flagged transactions, with transaction ID, date, account, amount, channel, and merchant category.

## Important
The included project contains DAX measures and this build guide, but not a finished `.pbix` file. Create and save the report in Power BI Desktop. Flagged transactions are only candidates for review, not proof of fraud.
