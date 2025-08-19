CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowAvailableVehiclesByManufacturer`(
  IN in_manufacturer_id INT
)
BEGIN
  SELECT v.vehicle_id, v.VIN, v.color, v.price, m.model_name
  FROM vehicles v
  JOIN models m ON v.model_id = m.model_id
  WHERE v.status = 'Available' AND m.manufacturer_id = in_manufacturer_id;
END