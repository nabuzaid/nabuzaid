select ACTUALDATE,VOUCHERNUM,DESCRIPTION,LINECOST,UNITCOST,ITEMNUM,QUANTITY,STORELOC,GLCREDITACCT,GLDEBITACCT
from MATUSETRANS 
where actualdate between TO_DATE('2022/01/01', 'yyyy/mm/dd') and TO_DATE('2022/04/01', 'yyyy/mm/dd')
