Declare
  i pls_integer := 0;
BEGIN

  session_cache.init;

  /*
  You can get dynamic parameter from frontend
  */
  session_cache.set_value('param_1', 'Value_1');
  session_cache.set_value('param_2', 'Value_2');
  session_cache.set_value('param_3', 'Value_3');

  Dbms_output.Put_Line(session_cache.get_value('param_1'));
  Dbms_output.Put_Line(session_cache.get_value('param_2'));
  Dbms_output.Put_Line(session_cache.get_value('param_3'));

  session_cache.init;
  session_cache.set_value(1, 'Test1');
  session_cache.set_value(2, 'Test2');
  session_cache.set_value(3, 'Test3');

  Dbms_output.Put_Line(session_cache.get_value(1));
  Dbms_output.Put_Line(session_cache.get_value(2));
  Dbms_output.Put_Line(session_cache.get_value(3));

 session_cache.init; 
 i := 1;
 for rec in (Select u.user_id, u.user_name from All_Users u)
    Loop
     session_cache.set_value(i, rec.user_name);
     i := i + 1;
End Loop;

    --Using small records is more efficient despite running query every time
    iF session_cache.get_value(1) = 'Test' Then
        Raise_application_Error(-20001, 'You have an access the user role!!!')
    End iF;      

END;
/

Select session_cache.get_value('param_2') val1,
       session_cache.get_value(2) val2
   from dual
