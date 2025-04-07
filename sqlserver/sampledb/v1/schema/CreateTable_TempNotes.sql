USE dms_sample;
GO

-- [Deprecated Feature]
-- TEXT is a legacy type; use VARCHAR(MAX) instead
CREATE TABLE dbo.TempNotes (
  NoteID   INT          PRIMARY KEY,
  NoteText TEXT         -- deprecated data type
);
GO

-- [Deprecated Setting]
-- CONCAT_NULL_YIELDS_NULL OFF is no longer supported in SQL 2016+
SET CONCAT_NULL_YIELDS_NULL OFF;  
GO

-- [Breaking Change & Behavior Change]
--  1) Old-style outer join (*=) is gone in SQL 2022/Azure SQL
--  2) GETDATE() has lower precision than SYSDATETIME()
SELECT 
    m.mlb_name,
    GETDATE() AS LoadedAt  -- behavior change: prefer SYSDATETIME()
FROM dbo.mlb_data AS m
     , dbo.player

GO
