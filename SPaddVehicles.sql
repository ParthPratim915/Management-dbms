CREATE DEFINER=`root`@`localhost` PROCEDURE `AddVehicle`(
    IN in_model_id INT,
    IN in_VIN VARCHAR(20),
    IN in_color VARCHAR(30),
    IN in_price DECIMAL(12,2),
    IN in_status ENUM('Available','Sold','Reserved')
)
BEGIN
    INSERT INTO vehicles (model_id, VIN, color, price, status)
    VALUES (in_model_id, in_VIN, in_color, in_price, in_status);
END