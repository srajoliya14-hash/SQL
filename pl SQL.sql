/*
Declarative 
   ariables, functions, cursors, 


Executable 
            beging
                LOGIC
            end

Exception 
        Exception 
        Traps and handles errors safely so the application doesn't crash.

*/

/*
DECLARE 
        age number :=19;

begin
    dbms_output.put_line('hello');
    dbms_output.put_line('hello ram');
    dbms_output.put_line(age);
    age:=20;
            dbms_output.put_line(age);
    if(age = 20) THEN
        dbms_output.put_line('we got 20');
    else
        dbms_output.put_line('not 20');

    end if;

 end
 */


DECLARE 
        age number :=19;
        x number:=5;
begin
    while x<=age LOOP
        dbms_output.put_line(x);
        x:=x+1;
    end loop;