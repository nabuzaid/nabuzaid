CREATE OR REPLACE TRIGGER MAXIMO.POLINE_GLCREDITACCT
BEFORE UPDATE 
ON MAXIMO.POLINE 
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE

BEGIN

if nvl(trim(:NEW.GLCREDITACCT),'0') = '0' then
    
   raise_application_error(-20101, 'The GL Account Cannot be NULL, please select a Valied GL Account...');
end if;

if  nvl(trim(:OLD.GLCREDITACCT),'0') = '0' then 
    if nvl(trim(:NEW.GLCREDITACCT),'0') = '0' then
    
       raise_application_error(-20101, 'The GL Account Cannot be NULL, please select a Valied GL Account...');
    end if;
end if;

   EXCEPTION
     WHEN OTHERS THEN
       raise_application_error(-20102, 'The GL Credit Account Cannot be NULL ....');
END PoLine_GLCreditAcct;
/


