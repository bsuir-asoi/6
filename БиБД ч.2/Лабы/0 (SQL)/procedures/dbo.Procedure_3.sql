CREATE PROCEDURE [dbo].[Procedure4]
	@param1 int = 0,
	@param2 int
AS
	SELECT tovar from Sclad where price=(Select max(price) from Sclad)
RETURN 0
