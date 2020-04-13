
CREATE FUNCTION fnIsPossibleSupply(@FlowerId INT, @PlantationId INT, @Amount INT)
	RETURNS NVARCHAR
AS
	BEGIN
		DECLARE @AmountFlowerOnPlantation INT;
		DECLARE @RESULT NVARCHAR(5);
		SET @AmountFlowerOnPlantation = (SELECT PlantationFlower.Ammount FROM PlantationFlower 
			WHERE   @PlantationId = PlantationFlower.PlantationId AND  PlantationFlower.FlowerId = @FlowerId);
			IF (@AmountFlowerOnPlantation > @Amount)
				SET @RESULT = 'false';
			ELSE
				SET @RESULT = 'true';
		RETURN @RESULT;
				
	END
GO