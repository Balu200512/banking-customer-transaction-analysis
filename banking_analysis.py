\
"""Validate synthetic banking data, load SQLite, and generate summary reports."""
from pathlib import Path
import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parent
DATA = ROOT / "data"
REPORTS = ROOT / "reports"
DB = ROOT / "banking_analysis.db"

def main():
    REPORTS.mkdir(exist_ok=True)
    customers = pd.read_csv(DATA / "customers.csv")
    accounts = pd.read_csv(DATA / "accounts.csv")
    transactions = pd.read_csv(DATA / "transactions.csv", parse_dates=["transaction_date"])

    if customers["customer_id"].duplicated().any():
        raise ValueError("Duplicate customer_id values found")
    if accounts["account_id"].duplicated().any():
        raise ValueError("Duplicate account_id values found")
    if transactions["transaction_id"].duplicated().any():
        raise ValueError("Duplicate transaction_id values found")
    if (transactions["amount"] < 0).any() or (accounts["opening_balance"] < 0).any():
        raise ValueError("Amounts and balances must be non-negative")
    if not set(accounts["customer_id"]).issubset(set(customers["customer_id"])):
        raise ValueError("Account refers to an unknown customer")
    if not set(transactions["account_id"]).issubset(set(accounts["account_id"])):
        raise ValueError("Transaction refers to an unknown account")

    with sqlite3.connect(DB) as con:
        con.executescript((ROOT / "sql" / "schema.sql").read_text(encoding="utf-8"))
        customers.to_sql("customers", con, if_exists="replace", index=False)
        accounts.to_sql("accounts", con, if_exists="replace", index=False)
        transactions.to_sql("transactions", con, if_exists="replace", index=False)

        monthly = pd.read_sql_query("""
            SELECT substr(transaction_date,1,7) AS txn_month,
                   COUNT(*) AS successful_transactions,
                   SUM(amount) AS successful_transaction_value
            FROM transactions
            WHERE transaction_status='Successful'
            GROUP BY txn_month ORDER BY txn_month
        """, con)
        channel = pd.read_sql_query("""
            SELECT channel, COUNT(*) AS transaction_count,
                   SUM(amount) AS transaction_value,
                   AVG(amount) AS average_transaction_value
            FROM transactions
            WHERE transaction_status='Successful'
            GROUP BY channel ORDER BY transaction_value DESC
        """, con)
        status = pd.read_sql_query("""
            SELECT transaction_status, COUNT(*) AS transaction_count,
                   SUM(amount) AS total_value
            FROM transactions GROUP BY transaction_status
            ORDER BY transaction_count DESC
        """, con)

    monthly.to_csv(REPORTS / "monthly_transaction_summary.csv", index=False)
    channel.to_csv(REPORTS / "channel_analysis.csv", index=False)
    status.to_csv(REPORTS / "transaction_status_summary.csv", index=False)
    monthly.to_markdown(REPORTS / "monthly_transaction_summary.md", index=False)

    if not monthly.empty:
        ax = monthly.plot(x="txn_month", y="successful_transaction_value",
                          marker="o", figsize=(10, 5), legend=False)
        ax.set_title("Monthly Successful Transaction Value")
        ax.set_xlabel("Month")
        ax.set_ylabel("Transaction Value (INR)")
        ax.tick_params(axis="x", rotation=45)
        ax.figure.tight_layout()
        ax.figure.savefig(REPORTS / "monthly_transaction_value.png", dpi=150)
        plt.close(ax.figure)

    print("Banking Customer & Transaction Analysis completed successfully.")
    print(f"Customers: {len(customers):,}")
    print(f"Accounts: {len(accounts):,}")
    print(f"Transactions: {len(transactions):,}")
    print(f"SQLite database: {DB}")
    print(f"Reports folder: {REPORTS}")

if __name__ == "__main__":
    main()
