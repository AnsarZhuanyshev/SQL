INSERT INTO cities (city_id,head_id)
VALUES (1,001),
	   (2,002),
	   (3,003),
	   (4,004),
	   (5,005),
	   (6,006),
	   (7,007),
	   (8,008)

INSERT INTO customers(cus_id,cus_name,cus_surname)
VALUES (100,'Voin','Drakona'),
	   (101,'Buks','Bunny'),
	   (102,'Duffy','Duck'),
	   (103,'Skrudzh','MacDuck'),
	   (104,'Avatar','Aang'),
	   (105,'Tai','Lung'),
	   (106,'Shifu','Master'),
	   (107,'Gomer','Simpson'),
	   (108,'Piter','Griphen')
	 
INSERT INTO items (item_id,item_name,item_amount)
VALUES (10000,'Gun',100),
	   (10001,'Fireball',200),
	   (10002,'Tank',999),
	   (10003,'Bomb',756),
	   (10004,'knife',340),
	   (10005,'Cocaine',1031),
	   (10006,'Dota2',333),
	   (10007,'CSGO',777),
	   (10008,'GTA',543),
	   (10009,'Human',111)
	   
INSERT INTO stores(store_id,city_id)
VALUES (1000,1),
	   (1001,2),
	   (1002,2),
	   (1003,3),
	   (1004,5),
	   (1005,6),
	   (1006,1),
	   (1007,7),
	   (1008,1),
	   (1009,5)
	   
INSERT INTO stores_and_items (store_id,item_id)
VALUES (1000,10000),
	   (1000,10002),
		(1004,10001),
		(1002,10002),
		(1003,10003),
		(1005,10004),
		(1005,10005),
		(1006,10006),
		(1007,10008),
		(1001,10002),
		(1001,10001),
		(1002,10004),
		(1003,10005),
		(1004,10003),
		(1006,10005),
		(1005,10006),
		(1007,10007)

INSERT INTO orders (cus_id,item_id,store_id,reciept)
VALUES (100,10002,1000,1000000),
	   (101,10003,1003,8575567),
	   (101,10004,1005,6757567),
	   (107,10008,1007,3462143),
	   (100,10005,1003,3625635),
	   (103,10003,1004,2342111),
	   (102,10003,1004,5345321),
	   (104,10006,1005,3453455),
	   (105,10007,1007,1363463),
	   (101,10007,1007,1856767),
	   (104,10003,1004,5153243),
	   (107,10002,1000,2453255),
	   (103,10008,1007,9999999),
	   (104,10001,1004,8888888),
	   (102,10002,1001,1768675)
