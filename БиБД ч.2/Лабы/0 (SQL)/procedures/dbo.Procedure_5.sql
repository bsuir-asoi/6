CREATE PROCEDURE [dbo].[Procedure6]
	@price int
	
AS
	SELECT tovar from Sclad where price > @price
RETURN 0
