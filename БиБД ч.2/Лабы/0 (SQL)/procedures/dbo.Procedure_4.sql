CREATE PROCEDURE [dbo].[Procedure5]
	
AS
	SELECT tovar,IIF(price>10000, price *0.20, price*0.13) as nalog from Sclad
RETURN 0
