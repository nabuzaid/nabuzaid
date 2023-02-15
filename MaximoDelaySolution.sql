delete from wfassignment where assignstatus = 'INACTIVE' and wfid > 0 and rownum<500000;

BEGIN
 REBUILD_NORMAL_INDEXES('WFASSIGNMENT');
END;

CREATE OR REPLACE procedure MAXIMO.REBUILD_NORMAL_INDEXES(TABLE_NAME_IN in MAXSYSINDEXES.TBNAME%type) as

  --Author : Bassel Deraawy

  /*This procedure rebuilds all normal indexes for the designated table (Only maximo tables) to improve the performance.
  It will rebuild all normal indexes for all maximo tables if "ALL_MAXIMO" is passed*/

  cursor CUR is
    select T.NAME,
           T.TBNAME,
           'ALTER INDEX ' || T.NAME || ' REBUILD' STMT
      from MAXSYSINDEXES T
     where T.TBNAME = DECODE(UPPER(TABLE_NAME_IN),
                             'ALL_MAXIMO',
                             T.TBNAME,
                             UPPER(TABLE_NAME_IN))
       and exists
     (select 1 from USER_INDEXES D where T.NAME = D.INDEX_NAME)
     order by T.NAME;

begin
  if (TABLE_NAME_IN is null) then
    DBMS_OUTPUT.PUT_LINE('Null table name is passed.');
    DBMS_OUTPUT.PUT_LINE('Please pass the table name you want to rebuild the normal indexes for,');
    DBMS_OUTPUT.PUT_LINE('Or pass ''ALL_MAXIMO'' to rebuild all normal indexes for all maximo tables.');

    return;
  end if;

  for T in CUR loop
    begin
      execute immediate T.STMT;

      --DBMS_OUTPUT.PUT_LINE(T.NAME || ': has been Rebuilded successfully');

    exception
      when others then
        DBMS_OUTPUT.PUT_LINE(T.NAME || ': ' ||
                             sqlerrm);
    end;
  end loop;
end REBUILD_NORMAL_INDEXES;
/
