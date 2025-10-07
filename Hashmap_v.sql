Create Or Replace View Hashmap_v as
 select * 
  from table t
where t.column_1 = session_cache.get_value('param_1')
and t.column_2 = session_cache.get_value('param_2');
/

Declare
 m hashmap_t := hashmap_t(SYS.ODCIVARCHAR2LIST(), SYS.ODCIVARCHAR2LIST());
Begin
   
  session_cache.init;

  session_cache.set_value('param_1', 'value_1');
  session_cache.set_value('param_1', 'value_2');

End;
/


select * 
 from Hashmap_v;


