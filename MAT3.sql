select issuetype,actualdate, VOUCHERNUM,DESCRIPTION,LINECOST,UNITCOST,BINNUM,LOCATION,ITEMNUM,QUANTITY,STORELOC,GLCREDITACCT,GLDEBITACCT
from MATUSETRANS 
where actualdate between TO_DATE('2021/06/01', 'yyyy/mm/dd') and TO_DATE('2021/7/01', 'yyyy/mm/dd')
order by actualdate;
