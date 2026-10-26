# Banking Customer & Transaction Analysis

## 1. Project Overview

The **Banking Customer & Transaction Analysis** project uses synthetic banking data to explore customer segments, account information, transaction activity, channel performance, and transaction status. It demonstrates practical analytics skills using **SQL, Python, Excel, and Power BI**.

The project includes sample CSV datasets, a relational database schema, analytical SQL queries, a Python analysis script, Power BI DAX measures, a dashboard build guide, and an Excel workbook.

All records are synthetic and created for educational and portfolio purposes. They do not represent real customers, accounts, or bank transactions.

## 2. Project Objectives

- Analyze customer demographics and customer segments.
- Understand account distribution and account status.
- Measure transaction counts and transaction values.
- Compare transaction activity across banking channels.
- Track successful, failed, pending, and reversed transactions.
- Identify transactions flagged for additional review.
- Analyze monthly transaction trends.
- Build a structured relational database using SQL.
- Automate validation and report generation with Python.
- Create an interactive Power BI dashboard.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| SQL | Data model and analytical queries |
| SQLite | Local relational database |
| Python | Data validation and analysis |
| Pandas | Data manipulation |
| Matplotlib | Chart generation |
| Excel | Sample data workbook |
| Power BI | Interactive dashboard |
| DAX | KPI calculations |
| CSV | Portable datasets |
| GitHub | Version control and portfolio sharing |

## 4. Project Features

- Customer demographic and segment analysis.
- Account type and account status analysis.
- Transaction trend analysis.
- Channel-wise transaction performance.
- Average transaction amount calculations.
- Transaction status monitoring.
- Flagged transaction review list.
- SQL joins and aggregation queries.
- Python data validation.
- SQLite database creation.
- CSV and Markdown report generation.
- Power BI measures and dashboard instructions.
- Excel workbook containing sample data.

## 5. Sample Dataset

The project contains three synthetic datasets.

| Dataset | Records | Description |
|---|---:|---|
| Customers | 500 | Customer demographics and segments |
| Accounts | 700 | Customer-linked bank accounts |
| Transactions | 6,000 | Transaction dates, amounts, channels, and statuses |

The sample transaction period is calendar year 2025. All transaction values and opening balances are denominated in INR.

### Dataset files

- `data/customers.csv`
- `data/accounts.csv`
- `data/transactions.csv`

The same datasets are included in `Banking_Analysis_Sample_Data.xlsx`.

## 6. Repository Structure

```text
banking-customer-transaction-analysis/
│
├── data/
│   ├── customers.csv
│   ├── accounts.csv
│   └── transactions.csv
│
├── sql/
│   ├── schema.sql
│   └── analysis_queries.sql
│
├── powerbi/
│   └── Measures.dax
│
├── docs/
│   └── PowerBI_Build_Guide.md
│
├── reports/
│   └── Generated reports and charts
│
├── Banking_Analysis_Sample_Data.xlsx
├── banking_analysis.py
├── requirements.txt
├── .gitignore
└── README.md
```

The SQLite database and report outputs are generated locally when the Python script is run.

## 7. Database Schema

The project uses three main tables.

### 7.1 Customers

Contains customer-level information such as:

- `customer_id`
- `age`
- `gender`
- `city`
- `customer_segment`
- `account_type`
- `account_open_date`
- `risk_category`

### 7.2 Accounts

Contains account-level information such as:

- `account_id`
- `customer_id`
- `account_type`
- `branch_code`
- `account_status`
- `opening_balance`
- `currency`

### 7.3 Transactions

Contains transaction-level information such as:

- `transaction_id`
- `transaction_date`
- `account_id`
- `transaction_type`
- `amount`
- `currency`
- `channel`
- `merchant_category`
- `transaction_status`
- `is_suspicious_flag`

### Table relationships

- `customers.customer_id` → `accounts.customer_id`
- `accounts.account_id` → `transactions.account_id`

The schema is defined in `sql/schema.sql`.

## 8. SQL Analysis

The `sql/analysis_queries.sql` file includes queries for:

1. Monthly successful transaction counts and values.
2. Transaction count and value by channel.
3. Customer activity by segment.
4. Transaction status monitoring.
5. Flagged transactions for review.
6. Average transaction amount by transaction type.
7. Account status by customer segment.

The queries demonstrate filtering, grouping, aggregate functions, joins, and subqueries/conditional aggregation.

The schema and queries are SQLite-oriented. Other database platforms may require small syntax adjustments.

## 9. Python Analysis

The main Python program is:

`banking_analysis.py`

The script:

- Loads the customer, account, and transaction datasets.
- Checks duplicate IDs.
- Checks for negative amounts and balances.
- Validates account-to-customer references.
- Validates transaction-to-account references.
- Creates a SQLite database.
- Calculates monthly successful transaction summaries.
- Analyzes transaction performance by channel.
- Summarizes transaction statuses.
- Exports reports and a monthly trend chart.

## 10. Installation and Setup

### Prerequisites

- Python 3.10 or later.
- Visual Studio Code or another Python editor.
- Power BI Desktop for interactive dashboards.
- Git, if you want to clone and manage the repository from the terminal.

### Step 1: Clone the repository

```bash
git clone https://github.com/Balu200512/banking-customer-transaction-analysis.git
```

Move into the project directory:

```bash
cd banking-customer-transaction-analysis
```

Alternatively, download and extract the ZIP file.

### Step 2: Create a virtual environment

```bash
python -m venv venv
```

On Windows Command Prompt:

```bat
venv\Scripts\activate
```

### Step 3: Install dependencies

```bash
python -m pip install -r requirements.txt
```

## 11. How to Run the Project

Execute the Python script from the project root:

```bash
python banking_analysis.py
```

The script validates the source datasets, creates `banking_analysis.db`, and generates summary reports in the `reports` directory.

Expected confirmation includes:

- 500 customer records.
- 700 account records.
- 6,000 transaction records.
- Database creation.
- Report generation.

## 12. Generated Reports

After running the script, the following outputs are created:

```text
banking_analysis.db

reports/
├── monthly_transaction_summary.csv
├── monthly_transaction_summary.md
├── channel_analysis.csv
├── transaction_status_summary.csv
└── monthly_transaction_value.png
```

### Report descriptions

- `monthly_transaction_summary.csv` – monthly successful transaction counts and values.
- `monthly_transaction_summary.md` – readable monthly summary.
- `channel_analysis.csv` – successful transaction metrics by channel.
- `transaction_status_summary.csv` – transaction counts and total values by status.
- `monthly_transaction_value.png` – chart of monthly successful transaction value.
- `banking_analysis.db` – local SQLite database.

Generated files do not need to be created manually.

## 13. Power BI Dashboard

The project provides DAX measures and dashboard instructions to help build an interactive report in Power BI Desktop.

Included files:

- `powerbi/Measures.dax`
- `docs/PowerBI_Build_Guide.md`
- `Banking_Analysis_Sample_Data.xlsx`

### Recommended dashboard KPIs

- Total Customers
- Total Accounts
- Total Transactions
- Successful Transactions
- Successful Transaction Value
- Average Successful Transaction
- Failed Transactions
- Pending Transactions
- Reversed Transactions
- Flagged Transactions

### Recommended visualizations

1. KPI cards for customers, accounts, successful transactions, and transaction value.
2. Line chart showing successful transaction value by month.
3. Bar chart comparing transaction values by channel.
4. Chart showing transaction status distribution.
5. Customer segment analysis.
6. Account status analysis.
7. Table listing flagged transactions for review.

### Power BI file note

A completed `.pbix` file is not included. Build and save the report in Power BI Desktop using the supplied datasets, measures, and guide.

## 14. Key Metrics

### Total Transactions

Counts all transaction records in the selected filter context.

### Successful Transaction Value

Sums the amount for transactions whose status is `Successful`.

### Average Successful Transaction

Calculated as:

```text
Average Successful Transaction =
Successful Transaction Value / Successful Transactions
```

### Channel Performance

Compares successful transaction counts, total values, and average amounts across channels such as UPI, ATM, Mobile Banking, Internet Banking, Branch, and Card.

### Transaction Status

Tracks successful, failed, pending, and reversed transactions to help understand transaction processing outcomes.

### Flagged Transactions

Records with `is_suspicious_flag = Yes` are highlighted for further review. A flag is not proof of fraud and should not be treated as a definitive risk assessment.

## 15. Business Questions Answered

This project helps explore questions such as:

1. How many customers and accounts are represented in the dataset?
2. What is the monthly successful transaction value?
3. Which banking channel processes the highest successful transaction value?
4. What is the average successful transaction amount?
5. How many transactions failed, remain pending, or were reversed?
6. How do customer segments differ in transaction activity?
7. What is the distribution of account statuses?
8. Which transactions have been flagged for review?
9. How can transaction trends be presented in a dashboard?

## 16. Skills Demonstrated

- SQL querying and relational database design.
- Python programming.
- Pandas data analysis.
- Data validation and cleaning.
- Exploratory data analysis.
- Transaction and channel analysis.
- Customer segmentation.
- Data visualization.
- Power BI dashboard design.
- DAX measures.
- Excel data handling.
- GitHub project organization.

## 17. Data Privacy and Limitations

- All records are synthetic and not real banking data.
- The project is intended for educational and portfolio use.
- Flagged transactions are candidates for review, not confirmed fraudulent activity.
- The sample risk category is illustrative and is not a validated credit or fraud model.
- The dashboard requires a separate build step in Power BI Desktop.
- The project is not a production banking system and should not be used to make real financial or compliance decisions.

## 18. Future Enhancements

Possible improvements include:

- Adding daily and hourly transaction trends.
- Adding customer retention and engagement analysis.
- Building a transaction anomaly detection model.
- Adding credit-risk analysis using a suitable validated dataset.
- Integrating with PostgreSQL or SQL Server.
- Creating a Streamlit analytics dashboard.
- Adding automated data-quality tests.
- Scheduling report generation.
- Adding row-level security in Power BI.
- Building a completed `.pbix` report.

## 19. Author

**Balaji Mudugal**

GitHub: [Balu200512](https://github.com/Balu200512)

## 20. License

This project is provided for educational, portfolio, and demonstration purposes. Add a formal open-source license file if you intend to distribute it under specific reuse terms.

---

⭐ If you find this project useful, consider starring the repository on GitHub.
