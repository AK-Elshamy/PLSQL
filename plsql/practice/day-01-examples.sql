-- Day 01 examples — Oracle PL/SQL; run in SQLcl.

SET SERVEROUTPUT ON;

-- 1. Basic block and output
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL');
    DBMS_OUTPUT.PUT_LINE('I''m learning Oracle');
END;
/

-- 2. Variables, arithmetic, and concatenation
DECLARE
    v_price    NUMBER(8,2) := 232.32;
    v_quantity INTEGER := 12;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Price is: ' || (v_price * v_quantity));
END;
/

-- 3. Reassign a variable
DECLARE
    v_price NUMBER(8,2) := 100;
BEGIN
    v_price := 250;
    DBMS_OUTPUT.PUT_LINE('Price: ' || v_price);
END;
/

-- 4. IF / ELSIF / ELSE
DECLARE
    v_grade NUMBER(4,2) := 82;
BEGIN
    IF v_grade >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF v_grade >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Very Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Keep Practicing');
    END IF;
END;
/

-- 5. FOR LOOP: print even numbers from 1 to 10
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;
/

-- 6. WHILE LOOP: count down from 10 to 1
DECLARE
    v_counter NUMBER := 10;
BEGIN
    WHILE v_counter >= 1 LOOP
        DBMS_OUTPUT.PUT_LINE(v_counter);
        v_counter := v_counter - 1;
    END LOOP;
END;
/
