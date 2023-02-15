CREATE OR REPLACE TRIGGER MAXIMO.POCOST_GLCREDITACCT
BEFORE UPDATE 
ON MAXIMO.POCOST 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE

BEGIN

  if nvl(trim(:new.GLCREDITACCT),'0') = '0'then
    raise_application_error(-20101, 'The GL Account Cannot be NULL, please select a Valied GL Account...');
  end if;  

if  nvl(trim(:OLD.GLCREDITACCT),'0') = '0' then
  if nvl(trim(:new.GLCREDITACCT),'0') = '0'then
    raise_application_error(-20101, 'The GL Account Cannot be NULL, please select a Valied GL Account...');
  end if;  
end if;

   EXCEPTION
     WHEN OTHERS THEN
       raise_application_error(-20102, 'The GL Credit Account Cannot be null ....');
END POCOST_GLCreditAcct;
/


