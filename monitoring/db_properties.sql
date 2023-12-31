-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays all database property values.
-- Call Syntax  : @db_properties
-- Last Modified: 15/09/2006
-- -----------------------------------------------------------------------------------
COLUMN property_value FORMAT A50

SELECT property_name,
       property_value
FROM   database_properties
ORDER BY property_name;
