# Banking Customer & Transaction Analysis

## 1. Project Overview

The **Banking Customer & Transaction Analysis** project is a data analytics project developed using SQL, Python, Excel, and Power BI. It analyzes banking customer information, account details, transaction activity, banking channels, and transaction statuses to generate meaningful business insights.

The project includes synthetic sample datasets, SQL database scripts, Python analysis code, Power BI DAX measures, a dashboard setup guide, and an Excel workbook.

This project demonstrates practical skills in data analysis, database management, data validation, reporting, and business intelligence.

## 2. Project Objectives

- Analyze customer demographics and customer segments.
- Understand account types and account status distribution.
- Analyze transaction counts and transaction values.
- Compare transaction activity across banking channels.
- Monitor successful, failed, pending, and reversed transactions.
- Identify transactions flagged for additional review.
- Analyze monthly transaction trends.
- Use SQL to perform banking data analysis.
- Automate data validation and reporting using Python.
- Create an interactive Power BI dashboard.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| SQL | Database queries and transaction analysis |
| SQLite | Relational database storage |
| Python | Data validation and analysis |
| Pandas | Data manipulation |
| Matplotlib | Data visualization |
| Microsoft Excel | Sample data workbook |
| Power BI | Interactive dashboard |
| DAX | KPI calculations |
| CSV | Dataset storage |
| GitHub | Version control and portfolio sharing |

## 4. Project Features

- Customer demographic analysis.
- Customer segment analysis.
- Account type and account status analysis.
- Transaction trend analysis.
- Channel-wise transaction analysis.
- Average transaction amount calculation.
- Transaction status monitoring.
- Flagged transaction review.
- SQL joins and aggregate queries.
- Python data validation.
- SQLite database creation.
- Automated report generation.
- Power BI dashboard measures.
- Excel workbook containing sample datasets.

## 5. Dataset Description

The project uses synthetic banking data created for educational and portfolio purposes. The data does not represent real customers, bank accounts, or financial transactions.

| Dataset | Number of Records | Description |
|---|---:|---|
| Customers | 500 | Customer demographics and segments |
| Accounts | 700 | Account details and statuses |
| Transactions | 6,000 | Transaction amounts, dates, channels, and statuses |

The sample transaction period covers calendar year 2025. All monetary values are represented in INR.

### Dataset files

- `data/customers.csv`
- `data/accounts.csv`
- `data/transactions.csv`

The datasets are also included in `Banking_Analysis_Sample_Data.xlsx`.

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

The SQLite database and report files are generated locally when the Python script is executed.

## 7. Database Schema

The project contains three main relational tables.

### 7.1 Customers

Stores customer information, including:

- `customer_id`
- `age`
- `gender`
- `city`
- `customer_segment`
- `account_type`
- `account_open_date`
- `risk_category`

### 7.2 Accounts

Stores account-level information, including:

- `account_id`
- `customer_id`
- `account_type`
- `branch_code`
- `account_status`
- `opening_balance`
- `currency`

### 7.3 Transactions

Stores transaction information, including:

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

### Relationships

- `customers.customer_id` connects to `accounts.customer_id`.
- `accounts.account_id` connects to `transactions.account_id`.

The database definitions are provided in `sql/schema.sql`.

## 8. SQL Analysis

The file `sql/analysis_queries.sql` contains SQL queries for analyzing banking activity.

The queries cover:

1. Monthly successful transaction counts and values.
2. Transaction performance by banking channel.
3. Customer activity by segment.
4. Transaction status distribution.
5. Flagged transactions for review.
6. Average transaction amounts by transaction type.
7. Account status by customer segment.

These queries demonstrate filtering, grouping, aggregate functions, conditional aggregation, and relational joins.

The SQL files are designed for SQLite. Other database platforms may require minor syntax adjustments.

## 9. Python Data Analysis

The main Python script is:

`banking_analysis.py`

The script performs the following operations:

- Loads customer, account, and transaction datasets.
- Checks for duplicate identifiers.
- Validates non-negative amounts and opening balances.
- Checks account-to-customer references.
- Checks transaction-to-account references.
- Creates a local SQLite database.
- Calculates monthly successful transaction summaries.
- Analyzes transaction performance by channel.
- Summarizes transaction statuses.
- Generates CSV, Markdown, and chart outputs.

## 10. Installation and Setup

### Prerequisites

- Python 3.10 or later.
- Visual Studio Code or another Python editor.
- Power BI Desktop for dashboard development.
- Git for version control, if desired.

### Step 1: Clone the repository

```bash
git clone https://github.com/Balu200512/banking-customer-transaction-analysis.git
```

Navigate to the project folder:

```bash
cd banking-customer-transaction-analysis
```

Alternatively, download and extract the project ZIP file.

### Step 2: Create a virtual environment

```bash
python -m venv venv
```

On Windows Command Prompt, activate it using:

```bat
venv\Scripts\activate
```

### Step 3: Install dependencies

```bash
python -m pip install -r requirements.txt
```

## 11. How to Run the Project

After installing the required dependencies, run:

```bash
python banking_analysis.py
```

The program validates the datasets, creates the SQLite database, and generates analytical reports.

Expected dataset counts:

- Customers: 500
- Accounts: 700
- Transactions: 6,000

The script prints a completion message and the locations of the generated database and reports.

## 12. Generated Reports

After running the Python script, the following outputs are created:

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

- `monthly_transaction_summary.csv` — monthly successful transaction counts and values.
- `monthly_transaction_summary.md` — readable monthly transaction summary.
- `channel_analysis.csv` — successful transaction performance by channel.
- `transaction_status_summary.csv` — transaction counts and amounts by status.
- `monthly_transaction_value.png` — monthly successful transaction value chart.
- `banking_analysis.db` — local SQLite database.

These files are generated by the Python program and do not need to be created manually.

## 13. Power BI Dashboard

The project includes DAX measures and a dashboard guide to help build an interactive report in Power BI Desktop.

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
2. Line chart showing monthly successful transaction value.
3. Bar chart comparing transaction value by banking channel.
4. Chart showing transaction status distribution.
5. Customer segment analysis.
6. Account status analysis.
7. Table listing flagged transactions for review.

### Power BI report note

A completed `.pbix` file is not included. Create and save the dashboard in Power BI Desktop using the supplied sample datasets, DAX measures, and setup guide.

## 14. Key Business Metrics

### Total Transactions

Counts transaction records in the selected reporting context.

### Successful Transaction Value

Calculates the total value of transactions whose status is `Successful`.

### Average Successful Transaction

Calculated using:

```text
Average Successful Transaction =
Successful Transaction Value / Successful Transactions
```

### Channel Performance

Compares transaction counts, total values, and average amounts across UPI, ATM, Mobile Banking, Internet Banking, Branch, and Card channels.

### Transaction Status

Tracks successful, failed, pending, and reversed transactions to help understand transaction processing outcomes.

### Flagged Transactions

Transactions marked with `is_suspicious_flag = Yes` are highlighted for further review.

**Important:** A flagged transaction is not proof of fraud. The sample flags are synthetic and are intended only to demonstrate a review workflow.

## 15. Business Questions Answered

This project helps answer questions such as:

1. How many customers and accounts are represented in the dataset?
2. What is the monthly successful transaction value?
3. Which banking channel processes the highest successful transaction value?
4. What is the average successful transaction amount?
5. How many transactions failed, remain pending, or were reversed?
6. How does transaction activity vary by customer segment?
7. What is the distribution of account statuses?
8. Which transactions have been flagged for review?
9. How can transaction trends be displayed in an interactive dashboard?

## 16. Skills Demonstrated

- SQL querying and relational database design.
- Python programming.
- Pandas data analysis.
- Data validation and cleaning.
- Exploratory data analysis.
- Banking transaction analysis.
- Customer segmentation.
- Data visualization.
- Power BI dashboard design.
- DAX measures.
- Excel data handling.
- Git and GitHub.

## 17. Data Privacy and Limitations

- All sample records are synthetic.
- The project is intended for educational and portfolio purposes.
- Flagged transactions are not confirmed fraudulent transactions.
- The sample risk categories are illustrative, not a validated risk model.
- The Power BI dashboard must be created separately.
- The project is not a production banking system.
- Results depend on the supplied data and the definitions used in the queries.

Do not use this sample project to make real credit, fraud, financial, or compliance decisions.

## 18. Future Enhancements

Possible improvements include:

- Daily and hourly transaction trend analysis.
- Customer retention and engagement analysis.
- Transaction anomaly detection.
- Integration with PostgreSQL or SQL Server.
- A Streamlit analytics dashboard.
- Automated data-quality testing.
- Scheduled report generation.
- Power BI row-level security.
- A completed Power BI `.pbix` dashboard.

## 19. Author

**Balaji Mudugal**

GitHub: [Balu200512](https://github.com/Balu200512)

## 20. License

This project is provided for educational, portfolio, and demonstration purposes. Add a formal open-source license file if you intend to distribute the project under specific reuse terms.

---

⭐ If you find this project useful, consider starring the repository on GitHub.
