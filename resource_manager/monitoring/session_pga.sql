-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays information about PGA usage for each session.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @session_pga
-- Last Modified: 21-FEB-2005
-- -----------------------------------------------------------------------------------
SET LINESIZE 500
SET PAGESIZE 1000

COLUMN username FORMAT A30
COLUMN osuser FORMAT A20
COLUMN spid FORMAT A10
COLUMN service_name FORMAT A15
COLUMN module FORMAT A45
COLUMN machine FORMAT A30
COLUMN logon_time FORMAT A20
COLUMN pga_used_mem_mb FORMAT 99990.00
COLUMN pga_alloc_mem_mb FORMAT 99990.00
COLUMN pga_freeable_mem_mb FORMAT 99990.00
COLUMN pga_max_mem_mb FORMAT 99990.00

SELECT NVL(s.username, '(oracle)') AS username,
       s.osuser,
       s.sid,
       s.serial#,
       p.spid,
       ROUND(p.pga_used_mem/1024/1024,2) AS pga_used_mem_mb,
       ROUND(p.pga_alloc_mem/1024/1024,2) AS pga_alloc_mem_mb,
       ROUND(p.pga_freeable_mem/1024/1024,2) AS pga_freeable_mem_mb,
       ROUND(p.pga_max_mem/1024/1024,2) AS pga_max_mem_mb,
       s.lockwait,
       s.status,
       s.service_name,
       s.module,
       s.machine,
       s.program,
       TO_CHAR(s.logon_Time,'DD-MON-YYYY HH24:MI:SS') AS logon_time,
       s.last_call_et AS last_call_et_secs
FROM   v$session s,
       v$process p
WHERE  s.paddr = p.addr
ORDER BY s.username, s.osuser;

SET PAGESIZE 14
