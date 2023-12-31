-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays the status of the result cache.
-- Requirements : Access to the DBMS_RESULT_CACHE package.
-- Call Syntax  : @result_cache_status
-- Last Modified: 07/11/2012
-- -----------------------------------------------------------------------------------

SELECT DBMS_RESULT_CACHE.status FROM dual;
