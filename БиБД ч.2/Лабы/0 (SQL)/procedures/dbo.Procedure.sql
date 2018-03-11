CREATE PROCEDURE [dbo].[Procedure1]
	@tovar varchar(50),
	@price int OUTPUT
	
AS
BEGIN
	SELECT @price=price from Sclad where tovar = @tovar
RETURN 0
END
Execute Procedure1 "Ink",@price OUTPUT
Print @price