--CREATE TABLE dbo.DDLEvents
--(
--    EventDate    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--    EventType    NVARCHAR(64),
--    EventDDL     NVARCHAR(MAX),
--    EventXML     XML,
--    DatabaseName NVARCHAR(255),
--    SchemaName   NVARCHAR(255),
--    ObjectName   NVARCHAR(255),
--    HostName     VARCHAR(64),
--    IPAddress    VARCHAR(32),
--    ProgramName  NVARCHAR(255),
--    LoginName    NVARCHAR(255)
--);
--INSERT DDLEvents
--(
--    EventType,
--    EventDDL,
--    DatabaseName,
--    SchemaName,
--    ObjectName,
--    LoginName
--)
--SELECT
--    'CREATE_PROCEDURE',
--    OBJECT_DEFINITION([object_id]),
--    DB_NAME(),
--    OBJECT_SCHEMA_NAME([object_id]),
--    OBJECT_NAME([object_id]),
--    'my name'
--FROM
--    sys.procedures;
    
--TRUNCATE TABLE DDLEvents    

/*
ALTER TRIGGER DDLTrigger_Sample
    ON DATABASE
    FOR CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE, RENAME
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE
        @EventData XML = EVENTDATA();
 
    DECLARE 
        @ip VARCHAR(32) =
        (
            SELECT client_net_address
                FROM sys.dm_exec_connections
                WHERE session_id = @@SPID
        );
 
    INSERT DDLEvents
    (
        EventType,
        EventDDL,
        EventXML,
        DatabaseName,
        SchemaName,
        ObjectName,
        HostName,
        IPAddress,
        ProgramName,
        LoginName
    )
    SELECT
        @EventData.value('(/EVENT_INSTANCE/EventType)[1]',   'NVARCHAR(100)'), 
        @EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(MAX)'),
        @EventData,
        DB_NAME(),
        @EventData.value('(/EVENT_INSTANCE/SchemaName)[1]',  'NVARCHAR(255)'), 
        @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]',  'NVARCHAR(255)'),
        HOST_NAME(),
        @ip,
        PROGRAM_NAME(),
        SUSER_SNAME();
END
GO
*/

--DISABLE TRIGGER [DDLTrigger_Sample] ON DATABASE;
--ENABLE TRIGGER [DDLTrigger_Sample] ON DATABASE;
--SELECT * FROM DDLEvents


WITH [Events] AS
(
    SELECT
        EventDate,
        DatabaseName,
        SchemaName,
        ObjectName,
        EventDDL,
        rnLatest = ROW_NUMBER() OVER 
        (
            PARTITION BY DatabaseName, SchemaName, ObjectName
            ORDER BY     EventDate DESC
        ),
        rnEarliest = ROW_NUMBER() OVER
        (
            PARTITION BY DatabaseName, SchemaName, ObjectName
            ORDER BY     EventDate
        )        
    FROM
        DDLEvents
)
SELECT
    Original.DatabaseName,
    Original.SchemaName,
    Original.ObjectName,
    OriginalCode = Original.EventDDL,
    NewestCode   = COALESCE(Newest.EventDDL, ''),
    LastModified = COALESCE(Newest.EventDate, Original.EventDate)
FROM
    [Events] AS Original
LEFT OUTER JOIN
    [Events] AS Newest
    ON  Original.DatabaseName = Newest.DatabaseName
    AND Original.SchemaName   = Newest.SchemaName
    AND Original.ObjectName   = Newest.ObjectName
    AND Newest.rnEarliest = Original.rnLatest
    AND Newest.rnLatest = Original.rnEarliest
    AND Newest.rnEarliest > 1
WHERE
    Original.rnEarliest = 1;