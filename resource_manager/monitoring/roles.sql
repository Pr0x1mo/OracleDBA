-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays a list of all roles and privileges granted to the specified user.
-- Requirements : Access to the USER views.
-- Call Syntax  : @roles
-- Last Modified: 27/02/2018
-- -----------------------------------------------------------------------------------
SET SERVEROUTPUT ON
SET VERIFY OFF

COLUMN role FORMAT A30

SELECT a.role,
       a.password_required,
       a.authentication_type
FROM   dba_roles a
ORDER BY a.role;
               
SET VERIFY ON
