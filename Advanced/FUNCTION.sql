
CREATE FUNCTION fnIsPossibleSupply(@FlowerId INT, @PlantationId INT, @Amount INT)
	RETURNS BIT
AS
	BEGIN
		DECLARE @AmountFlowerOnPlantation INT;
		DECLARE @RESULT BIT;
		SET @AmountFlowerOnPlantation = (SELECT PlantationFlower.Ammount FROM PlantationFlower 
			WHERE   @PlantationId = PlantationFlower.PlantationId AND  PlantationFlower.FlowerId = @FlowerId);
			IF (@AmountFlowerOnPlantation > @Amount)
				SET @RESULT = 0;
			ELSE
				SET @RESULT = 1;
		RETURN @RESULT;
				
	END
GO