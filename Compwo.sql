select wonum,location from workorder where status ='COMP' and istask='N' order by location;


select count(*) ,site from workorder having status ='COMP' and  istask='N' group by location;


SELECT COUNT (wonum),site
FROM workorder
where
 status ='COMP' and  istask='N' 
group by site
