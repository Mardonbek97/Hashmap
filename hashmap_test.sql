DECLARE
  m hashmap_t := hashmap_t(SYS.ODCIVARCHAR2LIST(), SYS.ODCIVARCHAR2LIST());
BEGIN

  session_cache.init;

  /*
  You can get dynamic parameter from frontend
  */
  session_cache.set_value('param_1', 'Value_1');
  session_cache.set_value('param_2', 'Value_2');
  session_cache.set_value('param_3', 'Value_3');


  session_cache.set_value(1, 'Test1');
  session_cache.set_value(2, 'Test2');
  session_cache.set_value(3, 'Test3');


END;
/

Select session_cache.get_value('B') val1,
       session_cache.get_value(2) val2
   from dual
