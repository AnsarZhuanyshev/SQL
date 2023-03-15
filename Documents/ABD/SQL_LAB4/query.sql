--first example to find in which city customer brought item
SELECT city_id,cus_id FROM stores as t_4 
INNER JOIN 	(SELECT cus_id,t_1.store_id FROM orders as t_1
			INNER JOIN stores_and_items as t_2
			ON t_2.item_id = t_1.item_id AND t_1.store_id = t_2.store_id) as t_3
ON t_3.store_id = t_4.store_id

--second example 
SELECT round(AVG(reciept)) as average_reciept_for_person FROM (SELECT cus_id,reciept FROM orders 
						 INNER JOIN  (SELECT item_name,t_1.store_id,t_1.item_id FROM items 
						  			 INNER JOIN stores_and_items as t_1  
									 ON items.item_id = t_1.item_id ) as t_2 
						ON orders.item_id = t_2.item_id AND orders.store_id = t_2.store_id) as t_3

