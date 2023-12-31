-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays users with default passwords.
-- Requirements : Access to the DBA views.
-- Call Syntax  : @default_passwords
-- Last Modified: 26-NOV-2011
-- -----------------------------------------------------------------------------------

SELECT a.username, b.account_status
FROM   dba_users_with_defpwd a
       JOIN dba_users b ON a.username = b.username
ORDER BY 1;
