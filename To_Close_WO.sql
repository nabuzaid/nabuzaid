select * from workorder where wonum ='1055517'

select wonum, status, CHANGEDATE, CHANGEBY, STATUSDATE, HISTORYFLAG, wfactive, wfid from workorder where wonum in ('1055517', '1281640')
  
select wfid, WFASSIGNMENT.* from WFASSIGNMENT where RECORDKEY in ('1281640') and assignstatus <> 'COMPLETE'


update workorder set
                  status ='CLOSE',
                  CHANGEDATE = sysdate, 
                  CHANGEBY = 'MOG', 
                  STATUSDATE = sysdate,
                  HISTORYFLAG = 'Y',
                  wfactive='N',
                  wfid=0
                  where wonum in('');


/*remove wo from inbox*/

update WFASSIGNMENT set assignstatus='INACTIVE' where RECORDKEY IN ('');
