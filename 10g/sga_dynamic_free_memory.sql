-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Provides information about free memory in the SGA.
-- Requirements : Access to the v$ views.
-- Call Syntax  : @sga_dynamic_free_memory
-- Last Modified: 23/08/2008
-- -----------------------------------------------------------------------------------

SELECT *
FROM   v$sga_dynamic_free_memory;
