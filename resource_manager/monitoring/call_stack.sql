-- -----------------------------------------------------------------------------------
-- Author       : Pr0x1mo
-- Description  : Displays the current call stack.
-- Requirements : Access to DBMS_UTILITY.
-- Call Syntax  : @call_stack
-- Last Modified: 15/07/2000
-- -----------------------------------------------------------------------------------
SET SERVEROUTPUT ON
DECLARE
  v_stack  VARCHAR2(2000);
BEGIN
  v_stack := Dbms_Utility.Format_Call_Stack;
  Dbms_Output.Put_Line(v_stack);
END;
/
