--  cursor--> a cusor is pointer reference which reference to contex area to database 
-- cursor are used to acces the rows one by one and that cursor declare in the declare block 
-- cursor have 4 life cycle --->  
-- 1 declare 
-- 2 open
-- 3 fitch
-- 4 close 

-- 1.implicit > are the cursor that automactly created by the orcale 

-- you dont have to open fatch close the cursor 

-- 2.explicit cursor => 

--------------------------------------------------------------------------------

-- DECLARE
-- CURSOR EMP_CUR IS SELECT * FROM HR.EMPLOYEES;

-- EID HR.EMPLOYEES.EMPLOYEE_ID%TYPE;

-- BEGIN 
--     OPEN EMP_CUR;
--     IF(EMP_CUR%ISOPEN)THEN
--         DBMS_OUTPUT.PUT_LINE('CURSOR OPEN');
--     END IF;
    
-- END;

-----------------------------------------------------------------------------------

-- DECLARE
-- CURSOR EMP_CUR IS SELECT * FROM HR.EMPLOYEES;

-- EMP_RECORD HR.EMPLOYEES%ROWTYPE;

-- BEGIN 
--     OPEN EMP_CUR;
--     IF(EMP_CUR%ISOPEN)THEN
--         DBMS_OUTPUT.PUT_LINE('CURSOR OPEN');
--     END IF;

--     FETCH EMP_CUR INTO EMP_RECORD;
--     IF(EMP_CUR%FOUND)THEN
--         DBMS_OUTPUT.PUT_LINE('CURSOR FOUND HERE');
--     END IF;
-- END;


------------------------------------------------------------------------

-- DECLARE
-- CURSOR EMP_CUR IS SELECT * FROM HR.EMPLOYEES;

-- EMP_RECORD HR.EMPLOYEES%ROWTYPE;

-- BEGIN 
--     OPEN EMP_CUR;
--     IF(EMP_CUR%ISOPEN)THEN
--         DBMS_OUTPUT.PUT_LINE('CURSOR OPEN');
--     END IF;

--     FETCH EMP_CUR INTO EMP_RECORD;
--     DBMS_OUTPUT.PUT_LINE(EMP_RECORD.EMPLOYEE_ID);
--     IF(EMP_CUR%FOUND)THEN
--         DBMS_OUTPUT.PUT_LINE('CURSOR FOUND HERE');
--     END IF;
-- END;

---------------------------------------------------------------------------

-- DECLARE
-- CURSOR EMP_CUR IS SELECT * FROM HR.EMPLOYEES;

-- EMP_RECORD HR.EMPLOYEES%ROWTYPE;

-- BEGIN 
--     OPEN EMP_CUR;  -- OPEN CURSOR

--     FETCH EMP_CUR INTO EMP_RECORD;  -- FETCH CURSOR TO RECORD VARIABLE

--     WHILE EMP_CUR%FOUND LOOP 
--         DBMS_OUTPUT.PUT_LINE( EMP_RECORD.EMPLOYEE_ID ); 
--             FETCH EMP_CUR INTO EMP_RECORD; -- REPAT FECTCH FROM CURSOR
--     END LOOP;

--     CLOSE EMP_CUR; -- CLOSE CURSOR
     
-- END;

-------------------------------------------------------------------------------------

DECLARE
    CURSOR EMP_CUR IS
    SELECT
        *
    FROM
        HR.EMPLOYEES;

BEGIN
    FOR EMP_RECORD IN EMP_CUR LOOP
        DBMS_OUTPUT.PUT_LINE(EMP_RECORD.EMPLOYEE_ID);
    END LOOP;
END;

------------------------------------------------