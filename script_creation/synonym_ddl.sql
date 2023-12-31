-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Creates the DDL for the specified synonym, or all synonyms.
--                Search based on owner of the synonym.
-- Call Syntax  : @synonym_ddl (schema-name) (synonym-name or all)
-- Last Modified: 08/07/2013 - Rewritten to use DBMS_METADATA
-- -----------------------------------------------------------------------------------
SET LONG 20000 LONGCHUNKSIZE 20000 PAGESIZE 0 LINESIZE 1000 FEEDBACK OFF VERIFY OFF TRIMSPOOL ON

BEGIN
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'SQLTERMINATOR', true);
   DBMS_METADATA.set_transform_param (DBMS_METADATA.session_transform, 'PRETTY', true);
END;
/

SELECT DBMS_METADATA.get_ddl ('SYNONYM', synonym_name, owner)
FROM   all_synonyms
WHERE  owner = UPPER('&1')
AND    synonym_name  = DECODE(UPPER('&2'), 'ALL', synonym_name, UPPER('&2'));

SET PAGESIZE 14 FEEDBACK ON VERIFY ON
