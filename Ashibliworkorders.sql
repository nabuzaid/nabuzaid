((woclass = 'WORKORDER' or woclass = 'ACTIVITY') and istask = 0)and exists (select 1 from wfassignment where ownertable = 'WORKORDER' and ownerid = workorder.workorderid and assignstatus = 'ACTIVE ' and assigncode = 'MESHIBLI')