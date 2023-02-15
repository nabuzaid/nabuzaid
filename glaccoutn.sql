SELECT location ,glaccount from locations 
where glaccount !='' 
and SUBSTRING(glaccount,10,6)='XXXXXX' AND [location] like '8%'or [location] like '4%'or
[location] like '5%' order BY [location] 

SELECT COUNT(*) from locations 
where glaccount !='' 
and SUBSTRING(glaccount,10,6)='XXXXXX' AND [location] like '8%'or [location] like '4%'or
[location] like '5%' order BY [location] 
