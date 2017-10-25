/* Display Item Name with price and Aisle_num */
SELECT item_name, Price, AISLE_NUM
FROM grocery_list
ORDER BY Aisle_num ASC

/*get total price from a grocery list*/
SELECT SUM(Price) AS total
FROM 'grocery_list'
WHERE 1

/*Create trigger to update invantory when an item is removed from an order
  Would be used when an order comes in*/
CREATE TRIGGER 'Update_Invantory'
BEFORE DELETE ON 'Item_Orders'
FOR EACH ROW
	UPDATE items
	SET On_Hand = On_Hand + AMOUNT_Ordered
	WHERE Item_Code = OLD.AMOUNT_Ordered

/*Get total cost for an order assuming 50% profit margin*/
SELECT SUM((SELECT SUM(price) * Amount_Ordered * 0.5)
		FROM items
		WHERE item_orders.Item_Code = items.Item_Code)) AS "Order Total"
FROM item_orders

/*Get size of order*/
SELECT SUM(Amount_Ordered) AS "Order Size"
FROM item_orders

