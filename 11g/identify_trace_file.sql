-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays the name of the trace file associated with the current session.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @identify_trace_file
-- Last Modified: 23/08/2008
-- -----------------------------------------------------------------------------------
SET LINESIZE 100
COLUMN value FORMAT A60

SELECT value
FROM   v$diag_info
WHERE  name = 'Default Trace File';
