
CREATE PROC spCloseSupply
	
	@SupplyId int,
	@Amount int
AS
		BEGIN TRANSACTION
				UPDATE dbo.Supply SET
					Supply.[Status] = 'Closed',
					Supply.[ClosedDate] = CAST(GETDATE() AS DATE)
					WHERE Supply.[Id] = @SupplyId;

				IF (@@error <> 0)
					ROLLBACK

				DECLARE @PlantationId INT;
				DECLARE @WarehouseId INT;
				SET @PlantationId = (SELECT PlantationId FROM dbo.Supply WHERE Id = @SupplyId);
				SET @WarehouseId = (SELECT WarehouseId FROM dbo.Supply WHERE Id = @SupplyId);

					UPDATE dbo.PlantationFlower SET
						Amount = Amount - @Amount WHERE PlantationId = @PlantationId;

						IF (@@error <> 0)
							ROLLBACK

		
					UPDATE dbo.WarehouseFlower SET
						Amount = Amount + @Amount WHERE WarehouseId = @WarehouseId;

						IF (@@error <> 0)
							ROLLBACK
		COMMIT
GO

