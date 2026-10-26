PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS customers (
    customer_id TEXT PRIMARY KEY,
    age INTEGER NOT NULL CHECK (age >= 18),
    gender TEXT,
    city TEXT,
    customer_segment TEXT,
    account_type TEXT,
    account_open_date TEXT,
    risk_category TEXT
);

CREATE TABLE IF NOT EXISTS accounts (
    account_id TEXT PRIMARY KEY,
    customer_id TEXT NOT NULL,
    account_type TEXT NOT NULL,
    branch_code TEXT,
    account_status TEXT,
    opening_balance REAL NOT NULL CHECK (opening_balance >= 0),
    currency TEXT NOT NULL DEFAULT 'INR',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id TEXT PRIMARY KEY,
    transaction_date TEXT NOT NULL,
    account_id TEXT NOT NULL,
    transaction_type TEXT NOT NULL,
    amount REAL NOT NULL CHECK (amount >= 0),
    currency TEXT NOT NULL DEFAULT 'INR',
    channel TEXT,
    merchant_category TEXT,
    transaction_status TEXT NOT NULL,
    is_suspicious_flag TEXT NOT NULL DEFAULT 'No',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE INDEX IF NOT EXISTS idx_txn_date ON transactions(transaction_date);
CREATE INDEX IF NOT EXISTS idx_txn_account ON transactions(account_id);
CREATE INDEX IF NOT EXISTS idx_txn_status ON transactions(transaction_status);
