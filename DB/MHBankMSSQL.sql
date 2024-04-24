-- Create the database 'mhbank'
CREATE DATABASE mhbank;

-- Set the default schema to 'bank' for subsequent table creation
USE mhbank;

-- Create the schema 'bank'
CREATE SCHEMA bank;

GO

-- Table: bank.client
CREATE TABLE bank.client (
  client_id NVARCHAR(255) PRIMARY KEY,
  name NVARCHAR(255),
  surname NVARCHAR(255),
  address NVARCHAR(255),
  city NVARCHAR(255),
  country NVARCHAR(255),
  rc NVARCHAR(255) UNIQUE,
  email NVARCHAR(255) UNIQUE,
  client_type NVARCHAR(255),
  test_data BIT,
  CONSTRAINT chk_unique_client UNIQUE (rc, email) -- Combined unique constraint 
);

GO

-- Table: bank.account
CREATE TABLE bank.account (
  account_id NVARCHAR(255) PRIMARY KEY,
  account_number NVARCHAR(255) UNIQUE,
  amount INT,
  account_type NVARCHAR(255),
  account_owner NVARCHAR(255),
  test_data BIT,
  CONSTRAINT FK_account_owner FOREIGN KEY (account_owner) REFERENCES bank.client(client_id)
);

GO

-- Table: bank.credit_card
CREATE TABLE bank.credit_card (
  credit_card_number NVARCHAR(255) PRIMARY KEY,
  valid_until DATE,
  CVV NVARCHAR(255),
  test_data BIT,
  is_active BIT,
  belong_to_account NVARCHAR(255),
  CONSTRAINT FK_belong_to_account FOREIGN KEY (belong_to_account) REFERENCES bank.account(account_id)
);

GO

-- Table: bank.transactions
CREATE TABLE bank.transactions (
  trx_id NVARCHAR(255) PRIMARY KEY,
  from_account NVARCHAR(255),
  to_account NVARCHAR(255),
  amount MONEY,
  test_data BIT
);

GO
