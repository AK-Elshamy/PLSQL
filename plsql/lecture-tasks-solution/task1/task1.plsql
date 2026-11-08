   SET SERVEROUTPUT ON;

begin
    -- register table
   update register
      set
      total = nvl(
         lab,
         0
      ) + nvl(
         oral,
         0
      ) + nvl(
         written,
         0
      );

   update register
      set
      sub_state = 'S'
    where total >= 50;

   update register
      set
      sub_state = 'F'
    where total < 50;

        -- student table
   update student
      set
      score = (
         select sum(total)
           from register
          where student.id = register.student_id
      );

   update student
      set
      year_state = 'S'
    where 2 >= (
      select count(*)
        from register
       where student.id = register.student_id
         and sub_state = 'F'
   );

   update student
      set
      year_state = 'F'
    where 2 < (
      select count(*)
        from register
       where student.id = register.student_id
         and sub_state = 'F'
   );

end;