SELECT Supply.Id AS 'Supply ID', Plantation.Name AS 'Plantation name',Warehouse.Name AS 'Warehouse name',Supply.ClosedDate FROM Supply,Plantation,Warehouse
	WHERE Supply.Status LIKE '%Closed%'AND Supply.WarehouseId = Warehouse.Id AND Supply.PlantationId = Plantation.Id AND 
		Supply.ClosedDate BETWEEN CAST(DATEADD(MONTH, -1, GETDATE()) AS DATE)  AND  CAST(GETDATE() AS DATE)
