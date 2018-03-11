CREATE PROCEDURE [dbo].[Procedure2]
	@price int,
	@amount int OUTPUT
AS
BEGIN
	SELECT  count(amount) from Sclad where price <= @price
END
RETURN 0

