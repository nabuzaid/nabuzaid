SELECT * FROM MAXUSERGROUPS WHERE GRPNAME IN (SELECT GRPNAME  FROM MAXGROUPS WHERE GRPNAME LIKE '%WH%')