SELECT Id,Name,Adress FROM dbo.Plantation;

SELECT Plantation.Id,Plantation.Name,Plantation.Adress, Flower.Name,PlantationFlower.Ammount 
	FROM dbo.Plantation,dbo.Flower,dbo.PlantationFlower
		WHERE Flower.Id = PlantationFlower.FlowerId AND PlantationFlower.PlantationId = Plantation.Id;

SELECT Flower.Id , Flower.Name,(SELECT COUNT(Plantation.Id) 
	FROM Plantation,PlantationFlower 
	WHERE  Flower.Id = PlantationFlower.FlowerId AND PlantationFlower.PlantationId = Plantation.Id ) AS 'Plantation count' FROM Flower;
	
SELECT Flower.Id , Flower.Name,(SELECT COUNT(Plantation.Id) 
	FROM Plantation,PlantationFlower 
	WHERE   PlantationFlower.Ammount > 1000 AND Flower.Id = PlantationFlower.FlowerId AND PlantationFlower.PlantationId = Plantation.Id) AS'Plantation count' FROM Flower; 

SELECT Supply.Id AS 'Supply ID', Plantation.Name AS 'Plantation name',Warehouse.Name AS 'Warehouse name',Supply.ScheduledDate FROM Supply,Plantation,Warehouse
	WHERE Supply.Status LIKE '%Closed%'AND Supply.WarehouseId = Warehouse.Id AND Supply.PlantationId = Plantation.Id AND 
		Supply.ClosedDate BETWEEN CAST(DATEADD(MONTH, -1, GETDATE()) AS DATE)  AND  CAST(GETDATE() AS DATE)
