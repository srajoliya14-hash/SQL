-- 1. Trigger kya hota hai?

-- Trigger ek special SQL program hota hai jo automatically execute hota hai
--  jab table par koi specific event hota hai.

--  2. Simple Trigger ka syntax

-- MySQL mein trigger ka basic syntax:

-- DELIMITER //

-- CREATE TRIGGER trigger_name
-- BEFORE INSERT
-- ON table_name
-- FOR EACH ROW
-- BEGIN
--     -- trigger statements
-- END //

-- DELIMITER ;

-- 4. DML Operation Trigger

-- DML = Data Manipulation Language

-- Main DML operations:

-- INSERT
-- UPDATE
-- DELETE

-- 5. INSERT Trigger
-- DELIMITER //

-- CREATE TRIGGER after_employee_insert
-- AFTER INSERT
-- ON employees
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO employee_log(message)
--     VALUES ('New employee inserted');
-- END //

-- DELIMITER ;

-- 6. UPDATE Trigger

-- Update trigger mein OLD aur NEW dono important hain.

-- DELIMITER //

-- CREATE TRIGGER after_employee_update
-- AFTER UPDATE
-- ON employees
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO employee_log(message)
--     VALUES (
--         CONCAT('Salary changed from ',
--                OLD.salary,
--                ' to ',
--                NEW.salary)
--     );
-- END //

-- DELIMITER ;

-- 7. DELETE Trigger

-- DELETE mein mainly OLD available hota hai because row delete hone wali hai.

-- DELIMITER //

-- CREATE TRIGGER after_employee_delete
-- AFTER DELETE
-- ON employees
-- FOR EACH ROW
-- BEGIN
--     INSERT INTO employee_log(message)
--     VALUES (
--         CONCAT('Employee deleted: ', OLD.emp_name)
--     );
-- END //

-- DELIMITER ;

-- 9. Stored Procedure kya hota hai?

-- Ab trigger ke baad Stored Procedure.

-- Stored Procedure ek predefined SQL program hota hai jise hum jab chahein manually
--  call kar sakte hain.


-- it is siminar to function where we compile the
--  code of the one time and use is on demand
-- isme koi values return nahi tohi 
--------------------------------------------------------------------

-- CREATE PROCEDURE TEST_P(X IN INT, OUTPUT)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('HEY SHUBH'||' '||X);
--     Y:=X*60;        
-- END;


-- CALL TEST_P(10);


------------------------------------------------------------------


-- DECLARE 

--     V_IN INT :=100;

-- BEGIN
--     V_IN:= V_IN+5;
--     DBMS_OUTPUT.PUT_LINE(V_IN);

--     TEST_P(V_IN, V_OUT);
--     DBMS_OUTPUT.PUT_LINE('VALUES FROM PROCEDURE'||''||V_OUT);
    

-- END;


--------------------------------------------------------------------------



-- DECLARE 

--     V_IN INT :=100;

-- BEGIN
--     V_IN:= V_IN+5;
--     DBMS_OUTPUT.PUT_LINE('befor calling'||''||V_IN);

--     TEST_P(V_IN );
--     DBMS_OUTPUT.PUT_LINE('after call'||''||V_in);


-- END;
 
---------------------------------------------------------------------------