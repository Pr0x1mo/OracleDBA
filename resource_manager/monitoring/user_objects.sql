-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays the objects owned by the current user.
-- Requirements : 
-- Call Syntax  : @user_objects
-- Last Modified: 23-OCT-2019
-- -----------------------------------------------------------------------------------

COLUMN object_name FORMAT A30

SELECT object_name, object_type
FROM   user_objects
ORDER BY 1, 2;
