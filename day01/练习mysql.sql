create table if not exists goods(
	goods_id int ,
	goods_name varchar(10) ,
	unitprice int ,
	category varchar(12) ,
	provider varchar(64) 
);

create table if not exists customer(
	customer_id int ,
	name varchar(32) ,
	address varchar(256) ,
	email varchar(64) ,
	sex char ,
	card_id varchar(18)
);

create table if not exists purchase (
	order_id int ,
	customer_id int ,
	goods_id int,
	nums int 
);