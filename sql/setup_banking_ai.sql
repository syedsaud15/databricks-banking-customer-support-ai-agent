-- ============================================================
-- Banking Customer Support AI Agent
-- Databricks Unity Catalog - Agent Tool Functions
-- ============================================================

-- This project uses Unity Catalog functions as tools for the
-- Databricks Supervisor Agent.

USE CATALOG banking_ai;
USE SCHEMA banking_ai_tools;


-- ============================================================
-- 1. Get Customer Account Balance
-- ============================================================

CREATE OR REPLACE FUNCTION get_customer_balance(
    input_customer_id STRING
)
RETURNS TABLE (
    account_id STRING,
    account_type STRING,
    status STRING,
    balance DOUBLE,
    currency STRING
)
COMMENT 'Returns account balance and account information for a customer.'
RETURN
SELECT
    account_id,
    account_type,
    status,
    balance,
    currency
FROM banking_ai.banking_data.accounts
WHERE customer_id = input_customer_id;


-- ============================================================
-- 2. Get Recent Transactions
-- ============================================================

CREATE OR REPLACE FUNCTION get_recent_transactions(
    input_customer_id STRING
)
RETURNS TABLE (
    transaction_id STRING,
    account_id STRING,
    transaction_type STRING,
    amount DOUBLE,
    transaction_timestamp TIMESTAMP,
    status STRING,
    decline_reason STRING,
    merchant STRING
)
COMMENT 'Returns recent banking transactions for a customer.'
RETURN
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_timestamp,
    status,
    decline_reason,
    merchant
FROM banking_ai.banking_data.transactions
WHERE customer_id = input_customer_id
ORDER BY transaction_timestamp DESC
LIMIT 10;


-- ============================================================
-- 3. Calculate Credit Utilization
-- ============================================================

CREATE OR REPLACE FUNCTION calculate_credit_utilization(
    input_customer_id STRING
)
RETURNS TABLE (
    credit_card_id STRING,
    card_type STRING,
    status STRING,
    credit_limit DOUBLE,
    outstanding_balance DOUBLE,
    available_credit DOUBLE,
    utilization_percentage DOUBLE
)
COMMENT 'Calculates credit card utilization for a customer.'
RETURN
SELECT
    credit_card_id,
    card_type,
    status,
    credit_limit,
    outstanding_balance,
    credit_limit - outstanding_balance AS available_credit,
    ROUND((outstanding_balance / credit_limit) * 100, 2)
        AS utilization_percentage
FROM banking_ai.banking_data.credit_cards
WHERE customer_id = input_customer_id;


-- ============================================================
-- 4. Check Transaction Status
-- ============================================================

CREATE OR REPLACE FUNCTION check_transaction_status(
    input_transaction_id STRING
)
RETURNS TABLE (
    transaction_id STRING,
    account_id STRING,
    transaction_type STRING,
    amount DOUBLE,
    status STRING,
    decline_reason STRING,
    merchant STRING,
    transaction_timestamp TIMESTAMP
)
COMMENT 'Returns the current status and details of a transaction.'
RETURN
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    status,
    decline_reason,
    merchant,
    transaction_timestamp
FROM banking_ai.banking_data.transactions
WHERE transaction_id = input_transaction_id;
