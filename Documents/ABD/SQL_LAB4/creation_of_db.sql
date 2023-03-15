CREATE TABLE IF NOT EXISTS cities(
		city_id integer ,
		head_id integer NOT NULL UNIQUE,
		PRIMARY KEY (city_id)
)

CREATE TABLE IF NOT EXISTS stores(
		store_id integer ,
		city_id integer ,
		PRIMARY KEY (store_id),
		FOREIGN KEY (city_id) REFERENCES cities(city_id)
)

CREATE TABLE IF NOT EXISTS items(
		item_id integer,
		item_name varchar(128) NOT NULL UNIQUE,
		item_amount integer,
		PRIMARY KEY (item_id)
)

CREATE TABLE IF NOT EXISTS stores_and_items(
		store_id integer,
		item_id integer,
		CONSTRAINT stores_items PRIMARY KEY (store_id,item_id),
		FOREIGN KEY (store_id) REFERENCES stores(store_id),
		FOREIGN KEY (item_id) REFERENCES items(item_id)
)

CREATE TABLE IF NOT EXISTS orders(
	cus_id integer,
	item_id integer,
	store_id integer,
	reciept integer,
	CONSTRAINT unique_order PRIMARY KEY(cus_id,item_id,store_id)
)
ALTER TABLE IF EXISTS orders
--ADD FOREIGN KEY (store_id,item_id) REFERENCES stores_and_items(store_id,item_id)
ADD FOREIGN KEY (cus_id) REFERENCES customers(cus_id)

CREATE TABLE IF NOT EXISTS customers (
		cus_id integer ,
		cus_name varchar(128) NOT NULL,
		cus_surname character varying(128) NOT NULL
)
ALTER TABLE IF EXISTS customers 
ADD PRIMARY KEY(cus_id)
