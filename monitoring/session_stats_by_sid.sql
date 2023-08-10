-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays session-specific statistics.
-- Requirements : Access to the V$ views.
-- Call Syntax  : @session_stats_by_sid (sid) (statistic-name or all)
-- Last Modified: 19/09/2006
-- -----------------------------------------------------------------------------------
SET VERIFY OFF

SELECT sn.name, ss.value
FROM   v$sesstat ss,
       v$statname sn
WHERE  ss.statistic# = sn.statistic#
AND    ss.sid = &1
AND    sn.name LIKE '%' || DECODE(LOWER('&2'), 'all', '', LOWER('&2')) || '%';

