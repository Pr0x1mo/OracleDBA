-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays information on all trace runs.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @trace_runs.sql
-- Last Modified: 06/05/2005
-- -----------------------------------------------------------------------------------
SET LINESIZE 200
SET TRIMOUT ON

COLUMN runid FORMAT 99999

SELECT runid,
       run_date,
       run_owner
FROM   plsql_trace_runs
ORDER BY runid;
