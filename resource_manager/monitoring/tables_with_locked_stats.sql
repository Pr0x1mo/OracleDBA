-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays tables with locked stats.
-- Requirements : Access to the DBA views.
-- Call Syntax  : @tables_with_locked_stats.sql
-- Last Modified: 06-DEC-2013
-- -----------------------------------------------------------------------------------

SELECT owner,
       table_name,
       stattype_locked
FROM   dba_tab_statistics
WHERE  stattype_locked IS NOT NULL
ORDER BY owner, table_name;
