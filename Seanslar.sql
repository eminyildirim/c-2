USE [sinema]
GO

/****** Object:  StoredProcedure [dbo].[Seanslar]    Script Date: 28.04.2019 13:25:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Seanslar] @FilmID INT
AS
BEGIN
    DECLARE @STable TABLE (REF INT IDENTITY(1,1),Saat Char(5))
	DECLARE @Saat Char(5)='11:00'
	DECLARE @BTime datetime 
	SELECT @BTime=CONVERT(datetime,'11:00',108)
	INSERT INTO @STable (Saat) SELECT @Saat AS Saat FROM dbo.Film WHERE ID = @FilmID
	WHILE @BTime < CONVERT(datetime,'23:01',108)
	BEGIN

	  SELECT @Saat=CONVERT(Char(5), DATEADD(minute, FilmSure + 10, CONVERT(datetime, @Saat)), 108),@BTime=DATEADD(minute, FilmSure + 10,@BTime) FROM dbo.[Film] WHERE ID = @FilmID
	  INSERT INTO @STable (Saat) VALUES (@Saat)	  
	END

	SELECT * FROM @STable
END
GO


