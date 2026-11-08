   SET SERVEROUTPUT ON;

begin
   insert into employees (
      employee_id,
      employee_name,
      salary
   ) values
      ( 104,
        'Mona',
        9000 );

   dbms_output.put_line('Rows inserted: ' || sql%rowcount);
  
end;
/
ROLLBACK;
select *
  from employees;