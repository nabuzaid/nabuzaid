select VOUCHERNUM,DESCRIPTION,LINECOST,UNITCOST,BINNUM,LOCATION,ITEMNUM,ACTUALDATE,QUANTITY,STORELOC,GLCREDITACCT,GLDEBITACCT
from MATUSETRANS 
where actualdate between TO_DATE('2013/01/01', 'yyyy/mm/dd') and TO_DATE('2019/01/01', 'yyyy/mm/dd')