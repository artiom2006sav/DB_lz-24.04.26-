GO
CREATE TRIGGER CheckOrderID
ON Shipments
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        LEFT JOIN [SalesDB].[dbo].[Orders] o ON i.OrderID = o.OrderID
        WHERE o.OrderID IS NULL
    )
    BEGIN;
        THROW 50001, 'Ошибка: один или несколько OrderID не найдены в базе SalesDB.', 1
        ROLLBACK TRANSACTION
    END
END
GO
