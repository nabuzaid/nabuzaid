WHERE  (reportdate >= to_timestamp ('2022-04-01 00:00:00' , 'YYYY-MM-DD HH24:MI:SS.FF') and reportdate <= to_timestamp ('2022-05-01 00:59:59' , 'YYYY-MM-DD HH24:MI:SS.FF') and istask = 'N' and worktype = 'CO' and (location like '1%' or location like '2%' or location like '3%'))

WHERE  (schedstart <= to_timestamp ('2022-05-01 00:59:59' , 'YYYY-MM-DD HH24:MI:SS.FF') and istask = 'N' and
 schedstart >= to_timestamp ('2022-04-01 00:00:00' , 'YYYY-MM-DD HH24:MI:SS.FF') and worktype = 'PM' and
 (location like '1%' or location like '2%' or location like '3%'))
