-- 1- create a new index on  siteuser table --done
create index siteuser_ndx3 on siteuser(username,laborcode,siteid);
   insert into maxsysindexES (name,tbname,uniquerule,changed,storagepartition) values ('SITEUSER_NDX3','SITEUSER','D','N','MAXIMO');
   INSERT INTO MAXSYSKEYS (IXNAME,COLNAME,COLSEQ,ORDERING,CHANGED) VALUES ('SITEUSER_NDX3','USERNAME',1,'A','N');
   INSERT INTO MAXSYSKEYS (IXNAME,COLNAME,COLSEQ,ORDERING,CHANGED) VALUES ('SITEUSER_NDX3','LABORCODE',2,'A','N');
   INSERT INTO MAXSYSKEYS (IXNAME,COLNAME,COLSEQ,ORDERING,CHANGED) VALUES ('SITEUSER_NDX3','SITEID',3,'A','N');
   commit;

-- 2- create backup from inactive wfassigment  -- done
create table WFASSIGNMENT_INACTIVE as select * from wfassignment;

-- 3- delete assignstatus = 'INACTIVE' and wfid > 0
begin
delete from wfassignment where assignstatus = 'INACTIVE' and wfid > 0;
COMMIT;
end;

-- 4- create a job to work once every week (this job will delete all wfassignment where assignstatus = 'INACTIVE' and wfid > 0
DECLARE
  X NUMBER;
BEGIN
  SYS.DBMS_JOB.SUBMIT
    ( job       => X 
     ,what      => 'declare
  v_count number;
  begin
    insert into WFASSIGNMENT_INACTIVE select * from wfassignment where assignstatus = ''INACTIVE'' and wfid > 0;
    delete from wfassignment where assignstatus = ''INACTIVE'' and wfid > 0;
    commit;
  end;'
     ,next_date => to_date('15/01/2018 03:00:00','dd/mm/yyyy hh24:mi:ss')
     ,interval  => 'TRUNC(SYSDATE+7)+3/24'
     ,no_parse  => TRUE
    );
  SYS.DBMS_OUTPUT.PUT_LINE('Job Number is: ' || to_char(x));
END;

-- 5- rebuild indexes 

BEGIN
 REBUILD_NORMAL_INDEXES('WFASSIGNMENT');
END;