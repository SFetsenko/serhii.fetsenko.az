IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'@Username')
    EXECUTE ('CREATE LOGIN [' + @Username + '] WITH PASSWORD = ''' + @Password + '''')
    EXECUTE ('CREATE USER [' + @Username + '] FOR LOGIN [' + @Username + '] WITH DEFAULT_SCHEMA=[dbo]')
    EXECUTE ('GRANT SELECT,INSERT,UPDATE,DELETE ON SCHEMA::dbo TO [' + @Username + ']')