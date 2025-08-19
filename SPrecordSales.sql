CREATE DEFINER=`root`@`localhost` PROCEDURE `RecordSale`(
  IN in_vehicle_id INT,
  IN in_customer_id INT,
  IN in_employee_id INT,
  IN in_sale_date DATETIME,
  IN in_sale_price DECIMAL(12,2)
)
BEGIN
  INSERT INTO sales (vehicle_id, customer_id, employee_id, sale_date, sale_price)
  VALUES (in_vehicle_id, in_customer_id, in_employee_id, in_sale_date, in_sale_price);
  
  UPDATE vehicles
  SET status = 'Sold'
  WHERE vehicle_id = in_vehicle_id;
END