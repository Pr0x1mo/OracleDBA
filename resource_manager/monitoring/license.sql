-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays session usage for licensing purposes.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @license
-- Last Modified: 15/07/2000
-- -----------------------------------------------------------------------------------
SELECT *
FROM   v$license;
