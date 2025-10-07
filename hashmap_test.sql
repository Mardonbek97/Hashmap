DECLARE
  m hashmap_t := hashmap_t(SYS.ODCIVARCHAR2LIST(), SYS.ODCIVARCHAR2LIST());
BEGIN

  session_cache.init;

  session_cache.set_value('A', 'Test1');
  session_cache.set_value('B', 'Test2');
  session_cache.set_value('C', 'Test3');

  session_cache.set_value(1, 'Test1');
  session_cache.set_value(2, 'Test2');
  session_cache.set_value(3, 'Test3');


END;
/

Select session_cache.get_value('B') val from dual
