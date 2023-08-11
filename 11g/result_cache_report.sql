-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays the result cache report.
-- Requirements : Access to the DBMS_RESULT_CACHE package.
-- Call Syntax  : @result_cache_report
-- Last Modified: 07/11/2012
-- -----------------------------------------------------------------------------------

SET SERVEROUTPUT ON
EXEC DBMS_RESULT_CACHE.memory_report(detailed => true);
