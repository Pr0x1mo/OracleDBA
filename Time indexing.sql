--CREATE INDEX ASSURTRKVOR.VORACTIVITY_OBJ_IDX ON ASSURTRKVOR.VORACTIVITY (OBJECT_ID);
SELECT INDEX_NAME, TABLE_NAME
FROM ALL_INDEXES
WHERE INDEX_NAME = 'EDI856LI_STOCK_IDX' AND OWNER = 'ASSURTRKVOR';
-- Enable DBMS_OUTPUT
-- Declare variables
SET SERVEROUTPUT ON;

-- Declare variables
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    duration INTERVAL DAY TO SECOND;
BEGIN
    -- Capture start time for vor index
    SELECT SYSTIMESTAMP INTO start_time FROM DUAL;

    -- Create vor index
    EXECUTE IMMEDIATE 'CREATE INDEX ASSURTRKVOR.EDI856LI_STOCK_IDX ON ASSURTRKVOR.EDI856LI (STOCK_ID)';
                      

    -- Capture end time
    SELECT SYSTIMESTAMP INTO end_time FROM DUAL;

    -- Calculate duration
    duration := end_time - start_time;

    -- Print duration for vor index
    DBMS_OUTPUT.PUT_LINE('VOR index creation took: ' || duration);

    -- Capture start time for pm index
    SELECT SYSTIMESTAMP INTO start_time FROM DUAL;

    -- Create pm index
    EXECUTE IMMEDIATE 'CREATE INDEX ASSURTRKVOR.EXCEPTIONITEM_OBJ_IDX ON ASSURTRKVOR.EXCEPTIONITEM (OBJECT_ID)';
                       
    -- Capture end time
    SELECT SYSTIMESTAMP INTO end_time FROM DUAL;

    -- Calculate duration
    duration := end_time - start_time;

    -- Print duration for pm index
    DBMS_OUTPUT.PUT_LINE('PM index creation took: ' || duration);

--    -- Capture start time for assurtrk index
--    SELECT SYSTIMESTAMP INTO start_time FROM DUAL;
--
--    -- Create assurtrk index
--    EXECUTE IMMEDIATE 'CREATE INDEX ASSURTRK.SERIALNUMBER_LOC_IDX ON ASSURTRK.SERIALNUMBER (ORG_ADDR_ID)';
--
--    -- Capture end time
--    SELECT SYSTIMESTAMP INTO end_time FROM DUAL;
--
--    -- Calculate duration
--    duration := end_time - start_time;
--
--    -- Print duration for assurtrk index
--    DBMS_OUTPUT.PUT_LINE('Assurtrk index creation took: ' || duration);
END;
/

