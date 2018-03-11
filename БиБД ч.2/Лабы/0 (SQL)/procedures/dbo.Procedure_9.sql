CREATE PROCEDURE [dbo].[Procedure10]
AS
declare @n int
declare @total int 
declare @profit int
set @profit = 0
set @total = 0
declare cur cursor 
scroll
for
	SELECT (price* amount) as profit from Sclad 
	For read only
	Open cur
	set @n=0
	while (@n<@@CURSOR_ROWS)
	BEGIN
	set @n=@n+1
	fetch NEXT from cur into @profit
	set @total = @total+@profit
	end

	close cur
	deallocate cur
RETURN @total
