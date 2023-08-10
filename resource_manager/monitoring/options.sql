-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays information about all database options.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @options
-- Last Modified: 12/04/2013
-- -----------------------------------------------------------------------------------

COLUMN value FORMAT A20

SELECT *
FROM   v$option
ORDER BY parameter;
