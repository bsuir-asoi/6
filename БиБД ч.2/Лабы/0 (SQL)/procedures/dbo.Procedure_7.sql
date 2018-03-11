CREATE PROCEDURE [dbo].[Procedure8]
	@tovar varchar(50),
	@price int
AS
update Sclad
	set price =@price where tovar = @tovar
RETURN 0
