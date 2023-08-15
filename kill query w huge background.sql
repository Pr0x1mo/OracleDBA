 SELECT s.sid, s.serial#, p.spid, s.username, s.schemaname
     , s.program, s.terminal, s.osuser, q.sql_text
     , ROUND(s.last_call_et/60, 2) AS query_duration_minutes
  FROM v$session s
  JOIN v$process p ON s.paddr = p.addr
  LEFT JOIN v$sql q ON s.sql_id = q.sql_id
 WHERE s.type != 'BACKGROUND';



alter system kill session 'sid,serial#' immediate;