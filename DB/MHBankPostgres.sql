CREATE DATABASE mhbank;

create schema if not exists bank;

CREATE TABLE if not exists bank.client(
  client_id VARCHAR(255) UNIQUE,	
  name VARCHAR(255),
  surname VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255),
  rc VARCHAR(255) UNIQUE,
  email VARCHAR(255) UNIQUE,
  client_type VARCHAR(255),
  test_data BOOL,
  PRIMARY KEY (client_id)
 );

CREATE TABLE if not exists bank.account(
  account_id VARCHAR(255) UNIQUE,	
  account_number VARCHAR(255) UNIQUE,	
  amount INT,
  account_type VARCHAR(255),
  account_owner VARCHAR(255),
  test_data BOOL,
  PRIMARY KEY (account_id),
  FOREIGN KEY(account_owner) 
  REFERENCES bank.client(client_id)
);

CREATE TABLE if not exists bank.credit_card(
  credit_card_number VARCHAR(255) UNIQUE,
  valid_until VARCHAR(255),
  CVV VARCHAR(255),
  test_data BOOL,
  is_active BOOL, 
  belong_to_account VARCHAR(255),
  PRIMARY KEY (credit_card_number),
  FOREIGN KEY(belong_to_account) 
  REFERENCES bank.account(account_id)
);

CREATE TABLE if not exists bank.transactions(
  trx_id VARCHAR(255),
  from_account VARCHAR(255),
  to_account VARCHAR(255),
  ammount INT,
  test_data BOOL,
  PRIMARY KEY (trx_id)
);

/*
drop table if exists bank.transactions;
drop table if exists bank.credit_card;
drop table if exists bank.account;
drop table if exists bank.client;
*/

/*
 delete from bank.account;
 delete from bank.transactions;
 delete from bank.credit_card;
 delete from bank.client;
 */

select * from bank.client;
select * from bank.account;
select * from bank.credit_card;
select * from bank.transactions;

select count(*) from bank.transactions;

select *
from bank.account 
left join bank.credit_card on account.account_id = credit_card.belong_to_account;


--========================================================
--Data
--========================================================
INSERT INTO bank.client (client_id,"name",surname,address,city,country,rc,email,client_type,test_data) VALUES
	 ('1','Michal','Fraser','Leskova 5','Bratislava','Slovakia','900320-0001','example01@gmail.com','bronze',true),
	 ('2','Tomas','Kennedy','Tr. SNP 20','Kosice','Slovakia','900320-0002','example02@gmail.com','bronze',true),
	 ('3','Dusan','Phillis','Tr. SNP 30','Kosice','Slovakia','900320-0003','example03@gmail.com','gold',true),
	 ('4','Jan','Faggetter','Hlavna 5','Gelnica','Slovakia','900320-0004','example04@gmail.com','bronze',true),
	 ('5','Peter','Geokowske','Perlova 10','Gelnica','Slovakia','900320-0005','example05@gmail.com','bronze',true),
	 ('6','Milan','Chippindale','Hlavna 5','Tornala','Slovakia','900320-0006','example06@gmail.com','bronze',true),
	 ('7','Abraham','Hasilwood','Leskova 5','Bratislava','Slovakia','900320-0007','example07@gmail.com','bronze',true),
	 ('8','Bozena','Skyrme','Dunajska 900','Nitra','Slovakia','900320-0008','example08@gmail.com','silver',true),
	 ('9','Zuzana','Balsom','Kapitulska 100','Banska Bystrica','Slovakia','900320-0009','example09@gmail.com','silver',true),
	 ('10','Vratislava','Blindell','Bajkalska 100','Bratislava','Slovakia','900320-0010','example10@gmail.com','bronze',true);