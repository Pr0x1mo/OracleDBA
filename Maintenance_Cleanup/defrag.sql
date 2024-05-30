-- Rebuild indexes
ALTER INDEX emp_index REBUILD;

-- Shrink tables and indexes
ALTER TABLE employees SHRINK SPACE;
ALTER INDEX emp_index SHRINK SPACE;

-- Move tables
ALTER TABLE employees MOVE TABLESPACE users;

-- Drop unused objects
DROP TABLE old_employees;
DROP INDEX old_emp_index;

-- Purge recycle bin
PURGE RECYCLEBIN;

-- Delete old data
DELETE FROM logs WHERE log_date < SYSDATE - 30;
