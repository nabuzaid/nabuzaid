declare
  cursor CUR is
    select * from EXCHANGE_2021 T order by 3, 1, 2;
  CNT number := 0;
begin

  delete from EXCHANGE T where T.ENTERBY = 'MAXADMIN';

  update EXCHANGE T
     set T.EXPIREDATE = TO_DATE('12/31/2020', 'MM/DD/YYYY'),
         T.CHANGEBY   = 'MAXADMIN',
         T.CHANGEDATE = sysdate
   where T.ENTERBY != 'MAXADMIN';

  for I in CUR loop
    declare
      result number;
    begin
      insert into EXCHANGE
        (CURRENCYCODE,
         EXCHANGERATE,
         ACTIVEDATE,
         EXPIREDATE,
         MEMO,
         ENTERDATE,
         ENTERBY,
         EXCHANGE1,
         EXCHANGE2,
         EXCHANGE3,
         EXCHANGE4,
         CURRENCYCODETO,
         ORGID,
         CHANGEBY,
         CHANGEDATE)
      values
        (I.CURRENCYCODE, --CURRENCYCODE
         I.EXCHANGERATE, --EXCHANGERATE
         TO_DATE(I.ACTIVEDATE, 'MM/DD/YYYY'),
         TO_DATE(I.EXPIREDATE, 'MM/DD/YYYY'), --EXPIREDATE
         null, --MEMO
         sysdate, --ENTERDATE
         'MAXADMIN', --ENTERBY
         null, --EXCHANGE1
         null, --EXCHANGE2
         null, --EXCHANGE3
         null, --EXCHANGE4
         I.CURRENCYCODETO, --CURRENCYCODETO
         'ENIGAS', --ORGID
         null, --CHANGEBY
         sysdate --CHANGEDATE
         );
    
      CNT := CNT + 1;
    exception
      when others then
        DBMS_OUTPUT.PUT_LINE(sqlerrm);
    end;
  end loop;

  commit;

  DBMS_OUTPUT.PUT_LINE(CNT);
end;
