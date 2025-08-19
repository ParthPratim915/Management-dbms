This vehicle company database is designed to efficiently manage comprehensive operations including manufacturing, inventory, sales, service, and parts management. At its core, the database models real-world entities and their relationships, enabling seamless tracking of vehicles from production to sale and after-sales servicing.

The database begins with the manufacturers table, which stores vehicle maker information such as name and country of origin. Each manufacturer can produce multiple models, which are cataloged in the models table with attributes like model name, year, and type (sedan, SUV, hatchback, etc.). Models have a foreign key linking them to their respective manufacturers.

The vehicles table holds detailed inventory information for each car available or sold. Each vehicle reference points to a model and includes unique Vehicle Identification Numbers (VIN), color, price, and current status (available, sold, or reserved). This enables the company to manage stock and identify specific vehicles precisely.

Customer information is maintained in the customers table, capturing essential contact details for buyers, enabling the system to associate every sale and service record with a valid customer. Similarly, the employees table records staff who handle sales, service, and other roles, supporting internal accountability and service tracking.

The core transactional data is recorded in the sales table, which logs every vehicle sale with references to the involved vehicle, customer, and employee, including the sale date and price. This facilitates accurate sales reporting and revenue tracking.

For after-sales operations, the service_records table tracks all maintenance activities performed on vehicles, including service dates, descriptions, costs, and the responsible service employee. This helps maintain service histories and schedule follow-ups or warranty claims effectively.

The parts table catalogs spare parts available for vehicle maintenance and repair, linked back to manufacturers for supply chain context. It includes stock levels and pricing information crucial for inventory and procurement management.

The database enforces data integrity and consistency through primary and foreign key constraints reflecting real-world dependencies—for example, a vehicle cannot exist without an associated model, and a sale cannot reference a non-existent customer or employee. This relational structure ensures reliable and meaningful data throughout.

----------------------------------------------------------------------------------------------------------------------------------------------------------------
Three stored procedures are provided to simplify common operations. AddVehicle streamlines adding new vehicles into inventory; RecordSale handles sales recording and automatically updates vehicle status to sold, improving operational efficiency; and ShowAvailableVehiclesByManufacturer allows querying inventory availability by manufacturer, supporting sales priorities and stock management:

1. AddVehicle: This procedure inserts a new vehicle into the vehicles table. You provide details such as model ID, VIN, color, price, and status as inputs; when called, it runs an SQL INSERT using those parameters, efficiently adding a new record.

2. RecordSale: This procedure registers a sale by inserting a record into the sales table, then updates the corresponding vehicle's status to 'Sold.' It takes vehicle, customer, employee, sale date, and price as input, combining multiple SQL actions in one call for transaction tracking.

3. ShowAvailableVehiclesByManufacturer: This procedure retrieves vehicles that are currently 'Available,' filtering results by the provided manufacturer ID. It uses a JOIN across vehicles and models to produce the inventory matching ownership and status criteria.
----------------------------------------------------------------------------------------------------------------------------------------------------------------

Overall, the design of this database supports scalability, data accuracy, and operational clarity for a vehicle company managing manufacturing, sales, service, and parts inventory. It offers a structured foundation to expand functionality, such as integrating finance, marketing, or advanced analytics modules, making it a robust solution for modern automotive businesses.
