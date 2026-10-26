-- 1. Monthly successful transaction volume and value
SELECT substr(transaction_date,1,7) AS txn_month,
       COUNT(*) AS successful_transactions,
       SUM(amount) AS successful_transaction_value
FROM transactions
WHERE transaction_status='Successful'
GROUP BY txn_month
ORDER BY txn_month;

-- 2. Transaction analysis by channel
SELECT channel, COUNT(*) AS transaction_count,
       SUM(amount) AS transaction_value,
       AVG(amount) AS average_transaction_value
FROM transactions
WHERE transaction_status='Successful'
GROUP BY channel
ORDER BY transaction_value DESC;

-- 3. Customer activity by segment
SELECT c.customer_segment, COUNT(DISTINCT c.customer_id) AS customers,
       COUNT(t.transaction_id) AS successful_transactions,
       SUM(CASE WHEN t.transaction_status='Successful' THEN t.amount ELSE 0 END) AS successful_value
FROM customers c
JOIN accounts a ON a.customer_id=c.customer_id
LEFT JOIN transactions t ON t.account_id=a.account_id
GROUP BY c.customer_segment
ORDER BY successful_value DESC;

-- 4. Transaction status monitoring
SELECT transaction_status, COUNT(*) AS transaction_count,
       SUM(amount) AS total_value
FROM transactions
GROUP BY transaction_status
ORDER BY transaction_count DESC;

-- 5. Potentially suspicious transactions for review (not a fraud determination)
SELECT transaction_id, transaction_date, account_id, amount, channel, merchant_category
FROM transactions
WHERE is_suspicious_flag='Yes'
ORDER BY amount DESC;

-- 6. Average transaction amount by transaction type
SELECT transaction_type, COUNT(*) AS transaction_count,
       AVG(amount) AS average_amount, SUM(amount) AS total_amount
FROM transactions
WHERE transaction_status='Successful'
GROUP BY transaction_type
ORDER BY total_amount DESC;

-- 7. Account status by customer segment
SELECT c.customer_segment, a.account_status, COUNT(*) AS account_count
FROM accounts a
JOIN customers c ON c.customer_id=a.customer_id
GROUP BY c.customer_segment, a.account_status
ORDER BY c.customer_segment, a.account_status;
