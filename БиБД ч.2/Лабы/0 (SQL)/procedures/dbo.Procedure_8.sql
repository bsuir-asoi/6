CREATE PROCEDURE [dbo].[Procedure9]
	
AS
	SELECT Factory from Firms join Sclad on Firms.Id = Sclad.Id where price =(Select min(price) from Sclad)
RETURN 0
