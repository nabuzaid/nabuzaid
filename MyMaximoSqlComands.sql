IBM Maximo SQL Anthology
The purpose of this article is to collect the main Database Queries that I use every day in my job as an IBM Maximo Developer.

The final result is a collection of Database Queries to retrieve data from the main Maximo configuration objects.

The present anthology aims to be a tool that can be used by inexperienced users to involve themselves in the Maximo World and to learn about objects and attributes of Maximo Database.

Moreover, it can also be used by experienced users to broaden their knowledge of Maximo.

The anthology is very detailed even if not all the Maximo Database objects are present. For this reason I will strive to keep the anthology updated.

Below you can find the list of the Maximo objects that I have included in the anthology:

Api Key Token;
Application;
Application Authorization;
Attribute;
Automation Script;
Class Ancestor;
Class Structure;
Condition;
Cron Task;
Cron Task Instance;
Cron Task Parameter;
Cron Task History;
Domain;
Alphanumeric Domain Type;
Table Domain Type;
Crossover Domain Type;
Numeric Domain Type;
Synonym Domain Type;
Number Range Domain Type;
Domain Value Condition;
Escalation;
Group;
Group User;
Label;
Logger;
Lookup Map;
Menu;
Message;
Object;
Object Structure;
Object Structure Detail;
Presentation;
Property;
Property Value;
Query;
Relationship;
Script Launch Point;
Security Restrict;
Sequence;
Server Session;
Service;
Session;
Signature Option;
User;
Variable;
View;
Api Key Token
Object:
APIKEYTOKEN

Primary Columns:
APIKEY

Queries:
Search Api Key by User ID:

select * from apikeytoken where userid='USER';
select * from apikeytoken where userid like '%USER%';
select * from apikeytoken where userid in ('USER1','USER2');
Search Api Key by Expiration Date:

select * from apikeytoken where expiration=-1;
Application
Object:
MAXAPPS

Primary Columns:
APP

Queries:
Search Application by Application Name:

select * from maxapps where app='APPLICATION';
select * from maxapps where app like '%APP%';
select * from maxapps where app in ('APPLICATION1', 'APPLICATION2');
Search Application by Application Description:

select * from maxapps where description='DESCRIPTION';
select * from maxapps where upper(description) like '%DESC%';
Search Application by Original App Name:

select * from maxapps where originalapp='APPLICATION';
select * from maxapps where originalapp like '%APP%';
select * from maxapps where originalapp in ('APPLICATION1', 'APPLICATION2');
Search Application by Application Type:

select * from maxapps where apptype='APP';
select * from maxapps where apptype='OS';
select * from maxapps where apptype='RUN';
select * from maxapps where apptype='WC';
Search Application by Main Object Name:

select * from maxapps where maintbname='OBJECT';
select * from maxapps where maintbname like '%OBJ%';
select * from maxapps where maintbname in ('OBJECT1','OBJECT2');
Application Authorization
Object:
APPLICATIONAUTH

Primary Columns:
GROUPNAME | APP | OPTIONNAME

Queries:
Search Application Authorization by Group Name:

select * from applicationauth where groupname='GROUPNAME';
select * from applicationauth where groupname like '%GROUP%';
select * from applicationauth where groupname in ('GROUPNAME1', 'GROUPNAME2');
Search Application Authorization by App Name:

select * from applicationauth where app='APP';
select * from applicationauth where app like '%APP%';
select * from applicationauth where app in ('APP1','APP2');
Search Application Authorization by Option Name:

select * from applicationauth where optionname='SIGOPTION';
select * from applicationauth where optionname like '%SIG%';
select * from applicationauth where optionname in ('SIGOPTION1', 'SIGOPTION2');
Search Application Authorization by Condition Name:

select * from applicationauth where conditionnum='CONDITION';
select * from applicationauth where conditionnum like '%COND%';
select * from applicationauth where conditionnum in ('CONDITION1', 'CONDITION2');
Attribute
Object:
MAXATTRIBUTE

Primary Columns:
OBJECTNAME | ATTRIBUTENAME

Queries:
Search Attribute by Object Name:

select * from maxattribute where objectname='OBJECT';
select * from maxattribute where objectname like '%OBJ%';
select * from maxattribute where objectname in ('OBJECT1', 'OBJECT2');
Search Attribute by Attribute Name:

select * from maxattribute where attributename='ATTR';
select * from maxattribute where attributename like '%ATTR%';
select * from maxattribute where attributename in ('ATTR1','ATTR2');
Search Attribute by Class Name:

select * from maxattribute where upper(classname) like '%CLASS%';
select * from maxattribute where classname is not null;
Look for Required Attributes:

select * from maxattribute where required=1;
Search Attribute by Domain Name:

select * from maxattribute where domainid='DOMAIN';
select * from maxattribute where domainid like '%DOMAIN%';
select * from maxattribute where domainid in ('DOMAIN1','DOMAIN2');
select * from maxattribute where domainid is not null;
Search Attribute by Same as Object and Same as Attribute:

select * from maxattribute where sameasobject='OBJECT';
select * from maxattribute where sameasobject='OBJECT' and sameasattribute='ATTR';
Search Attribute by Remarks and Title:

select * from maxattribute where remarks like '%REMARK%';
select * from maxattribute where title like '%TITLE%';
select * from maxattribute where remarks like '%REMARK%' or title like '%TITLE%';
Search Attribute by Default Value:

select * from maxattribute where defaultvalue like '%DEFAULT%';
select * from maxattribute where defaultvalue is not null;
Look for Persistent Attributes:

select * from maxattribute where persistent=1;
Search Attribute by Attribute Type:

select * from maxattribute where maxtype='ALN';
select * from maxattribute where maxtype='AMOUNT';
select * from maxattribute where maxtype='BIGINT';
select * from maxattribute where maxtype='BLOB';
select * from maxattribute where maxtype='CLOB';
select * from maxattribute where maxtype='CRYPTO';
select * from maxattribute where maxtype='CRYPTOX';
select * from maxattribute where maxtype='DATE';
select * from maxattribute where maxtype='DATETIME';
select * from maxattribute where maxtype='DECIMAL';
select * from maxattribute where maxtype='DURATION';
select * from maxattribute where maxtype='FLOAT';
select * from maxattribute where maxtype='GL';
select * from maxattribute where maxtype='INTEGER';
select * from maxattribute where maxtype='LONGALN';
select * from maxattribute where maxtype='LOWER';
select * from maxattribute where maxtype='SMALLINT';
select * from maxattribute where maxtype='TIME';
select * from maxattribute where maxtype='UPPER';
select * from maxattribute where maxtype='YORN';
Search Attribute by Attribute Length:

select * from maxattribute where length=16;
Search Attribute by Attribute Scale:

select * from maxattribute where scale=10;
Look for Primary Attributes:

select * from maxattribute where primarykeycolseq=1;
select * from maxattribute where primarykeycolseq=2;
select * from maxattribute where primarykeycolseq is not null;
Look for Auto-Number Attributes:

select * from maxattribute where canautonum=1;
Search Attribute by Auto Key Name:

select * from maxattribute where autokeyname like '%AUTO%';
select * from maxattribute where autokeyname is not null;
Search Attribute by Search Type:

select * from maxattribute where searchtype='EXACT';
select * from maxattribute where searchtype='NONE';
select * from maxattribute where searchtype='WILDCARD';
Look for Restricted Attributes:

select * from maxattribute where restricted=1;
Look for Localizable Attributes:

select * from maxattribute where localizable=1;
Automation Script
Object:
AUTOSCRIPT

Primary Columns:
AUTOSCRIPT

Queries:
Search Automation Script by Automation Script Name:

select * from autoscript where autoscript='AUTOSCRIPT';
select * from autoscript where autoscript like '%AUTO%';
select * from autoscript where autoscript in ('AUTOSCRIPT1', 'AUTOSCRIPT2');
Search Automation Script by Automation Script Description:

select * from autoscript where description='DESCRIPTION';
select * from autoscript where upper(description) like '%DESC%';
Search Automation Script by Source Code:

select * from autoscript where source like '%getString%';
Look for Active Automation Scripts:

select * from autoscript where active=1;
Search Automation Script by Script Language:

select * from autoscript where scriptlanguage='python';
select * from autoscript where scriptlanguage='jython';
Class Ancestor
Object:
CLASSANCESTOR

Primary Columns:
CLASSSTRUCTUREID | ANCESTOR

Queries:
Search Class Ancestor by Class Structure ID:

select * from classancestor where classstructureid='CLASSSTRUCTURE';
select * from classancestor where classstructureid like '%CLASSS%';
select * from classancestor where classstructureid in ('CLASSSTRUCTURE1', 'CLASSSTRUCTURE2');
Search Class Ancestor by Classification ID:

select * from classancestor where classificationid='CLASSIFICATION';
select * from classancestor where classificationid like '%CLASSI%';
select * from classancestor where classificationid in ('CLASSIFICATION1', 'CLASSIFICATION2');
Search Class Ancestor by Ancestor Class Structure ID:

select * from classancestor where ancestor='ANCESTOR';
select * from classancestor where ancestor like '%ANC%';
select * from classancestor where ancestor in ('ANCESTOR1', 'ANCESTOR2');
Search Class Ancestor by Ancestor Classification ID:

select * from classancestor where ancestorclassid='ANCESTORCLASS';
select * from classancestor where ancestorclassid like '%ANC%';
select * from classancestor where ancestorclassid in ('ANCESTORCLASS1', 'ANCESTORCLASS2');
Class Structure
Object:
CLASSSTRUCTURE

Primary Columns:
CLASSSTRUCTUREID

Queries:
Search Class Structure by Class Structure ID:

select * from classstructure where classstructureid='CLASS';
select * from classstructure where classstructureid like '%CLASS%';
select * from classstructure where classstructureid in ('CLASS1', 'CLASS2');
Search Class Structure by Class Structure Description:

select * from classstructure where description='DESCRIPTION';
select * from classstructure where upper(description) like '%DESC%';
Search Class Structure by Parent Class Structure ID:

select * from classstructure where parent='PARENT';
select * from classstructure where parent like '%PARENT%';
select * from classstructure where parent in ('PARENT1', 'PARENT2');
select * from classstructure where parent is null;
Search Class Ancestor by Classification ID:

select * from classstructure where classificationid='CLASS';
select * from classstructure where classificationid like '%CLASS%';
select * from classstructure where classificationid in ('CLASS1', 'CLASS2');
Condition
Object:
CONDITION

Primary Columns:
CONDITIONNUM

Queries:
Search Condition by Condition Name:

select * from condition where conditionnum='CONDITION';
select * from condition where conditionnum like '%COND%';
select * from condition where conditionnum in ('CONDITION1', 'CONDITION2');
Search Condition by Condition Description:

select * from condition where description='DESCRIPTION';
select * from condition where upper(description) like '%DESC%';
Search Condition by Expression:

select * from condition where upper(expression) like '%EXP%';
Search Condition by Condition Type:

select * from condition where type='EXPRESSION';
select * from condition where type='CLASS';
Search Condition by Class Name:

select * from condition where upper(classname) like '%CLASS%';
Cron Task
Object:
CRONTASKDEF

Primary Columns:
CRONTASKNAME

Queries:
Search Cron Task by Cron Task Name:

select * from crontaskdef where crontaskname='CRON';
select * from crontaskdef where crontaskname like '%CRON%';
select * from crontaskdef where crontaskname in ('CRON1','CRON2');
Search Cron Task by Cron Task Description:

select * from crontaskdef where description='DESCRIPTION';
select * from crontaskdef where upper(description) like '%DESC%';
Search Cron Task by Class Name:

select * from crontaskdef where upper(classname) like '%CLASS%';
Cron Task Instance
Object:
CRONTASKINSTANCE

Primary Columns:
INSTANCENAME | CRONTASKNAME

Queries:
Search Cron Task Instance by Cron Task Name:

select * from crontaskinstance where crontaskname='CRON';
select * from crontaskinstance where crontaskname like '%CRON%';
select * from crontaskinstance where crontaskname in ('CRON1','CRON2');
Search Cron Task Instance by Cron Task Description:

select * from crontaskinstance where description='DESCRIPTION';
select * from crontaskinstance where upper(description) like '%DESC%';
Search Cron Task Instance by Instance Name:

select * from crontaskinstance where instancename='INSTANCE';
select * from crontaskinstance where instancename like '%INST%';
select * from crontaskinstance where instancename in ('INSTANCE1', 'INSTANCE2');
Look for Active Cron Task Instances:

select * from crontaskinstance where active=1;
Search Cron Task Instance by Run User ID:

select * from crontaskinstance where runasuserid='USER';
select * from crontaskinstance where runasuserid like '%USER%';
select * from crontaskinstance where runasuserid in ('USER1','USER2');
Cron Task Parameter
Object:
CRONTASKPARAM

Primary Columns:
CRONTASKNAME | INSTANCENAME | PARAMETER

Queries:
Search Cron Task Parameter by Cron Task Name:

select * from crontaskparam where crontaskname='CRON';
select * from crontaskparam where crontaskname like '%CRON%';
select * from crontaskparam where crontaskname in ('CRON1','CRON2');
Search Cron Task Parameter by Instance Name:

select * from crontaskparam where instancename='INSTANCE';
select * from crontaskparam where instancename like '%INST%';
select * from crontaskparam where instancename in ('INSTANCE1', 'INSTANCE2');
Search Cron Task Parameter by Parameter Name:

select * from crontaskparam where parameter='PARAMETER';
select * from crontaskparam where parameter like '%PARAM%';
select * from crontaskparam where parameter in ('PARAMETER1', 'PARAMETER2');
Search Cron Task Parameter by Parameter Value:

select * from crontaskparam where value='PARAMETER';
select * from crontaskparam where value like '%PARAM%';
select * from crontaskparam where value in ('PARAMETER1', 'PARAMETER2');
Cron Task History
Object:
CRONTASKHISTORY

Primary Columns:
CRONTASKNAME | INSTANCENAME | SEQUENCE

Queries:
Search Cron Task History by Cron Task Name:

select * from crontaskhistory where crontaskname='CRON';
select * from crontaskhistory where crontaskname like '%CRON%';
select * from crontaskhistory where crontaskname in ('CRON1','CRON2');
Search Cron Task History by Instance Name:

select * from crontaskhistory where instancename='INSTANCE';
select * from crontaskhistory where instancename like '%INST%';
select * from crontaskhistory where instancename in ('INSTANCE1', 'INSTANCE2');
Search Cron Task History by Server Name:

select * from crontaskhistory where servername='MXServer';
select * from crontaskhistory where servername like '%MXServer%';
select * from crontaskhistory where servername in ('MXServer1', 'MXServer2');
Search Cron Task History by Server Host:

select * from crontaskhistory where serverhost='10.150.231.21';
select * from crontaskhistory where serverhost like '%10.150.231.21%';
select * from crontaskhistory where serverhost in ('10.150.231.21', '10.150.231.30');
Search Cron Task History by Instance Activity:

select * from crontaskhistory where activity='ACTION';
select * from crontaskhistory where activity='INIT';
select * from crontaskhistory where activity='SHUTDOWN';
select * from crontaskhistory where activity='START';
select * from crontaskhistory where activity='STOP';
Search Cron Task History by Activity Start Time:

select * from crontaskhistory where trunc(starttime)=trunc(sysdate);
Search Cron Task History by Activity Finish Time:

select * from crontaskhistory where trunc(endtime)=trunc(sysdate);
Domain
Object:
MAXDOMAIN

Primary Columns:
DOMAINID

Queries:
Search Domain by Domain Name:

select * from maxdomain where domainid='DOMAIN';
select * from maxdomain where domainid like '%DOMAIN%';
select * from maxdomain where domainid in ('DOMAIN1','DOMAIN2');
Search Domain by Domain Description:

select * from maxdomain where description='DESCRIPTION';
select * from maxdomain where upper(description) like '%DESC%';
Search Domain by Domain Type:

select * from maxdomain where domaintype='ALN';
select * from maxdomain where domaintype='CROSSOVER';
select * from maxdomain where domaintype='NUMERIC';
select * from maxdomain where domaintype='NUMRANGE';
select * from maxdomain where domaintype='SYNONYM';
select * from maxdomain where domaintype='TABLE';
Search Domain by Type of Domain Values:

select * from maxdomain where maxtype='ALN';
select * from maxdomain where maxtype='DECIMAL';
select * from maxdomain where maxtype='INTEGER';
select * from maxdomain where maxtype='LOWER';
select * from maxdomain where maxtype='SMALLINT';
select * from maxdomain where maxtype is null;
Look for Internal Domains:

select * from maxdomain where internal=1;
Alphanumeric Domain Type
Object:
ALNDOMAIN

Primary Columns:
DOMAINID | VALUE | SITEID | ORGID

Queries:
Search Alphanumeric Domain by Domain Name:

select * from alndomain where domainid='DOMAIN';
select * from alndomain where domainid like '%DOMAIN%';
select * from alndomain where domainid in ('DOMAIN1','DOMAIN2');
Search Alphanumeric Domain by Value:

select * from alndomain where value='VALUE';
select * from alndomain where value like '%VALUE%';
select * from alndomain where value in ('VALUE1','VALUE2');
Search Alphanumeric Domain by Value Description:

select * from alndomain where description='DESCRIPTION';
select * from alndomain where upper(description) like '%DESC%';
Table Domain Type
Object:
MAXTABLEDOMAIN

Primary Columns:
DOMAINID | SITEID | ORGID

Queries:
Search Table Domain by Domain Name:

select * from maxtabledomain where domainid='DOMAIN';
select * from maxtabledomain where domainid like '%DOMAIN%';
select * from maxtabledomain where domainid in ('DOMAIN1', 'DOMAIN2');
Search Table Domain by Object Name:

select * from maxtabledomain where objectname='OBJECT';
select * from maxtabledomain where objectname like '%OBJ%';
select * from maxtabledomain where objectname in ('OBJECT1', 'OBJECT2');
Search Table Domain by List Where Clause:

select * from maxtabledomain where upper(listwhereclause) like '%EXP%';
Search Table Domain by Validation Where Clause:

select * from maxtabledomain where upper(validtnwhereclause) like '%EXP%';
Crossover Domain Type
Object:
CROSSOVERDOMAIN

Primary Columns:
DOMAINID | SOURCEFIELD | DESTFIELD | SITEID | ORGID

Queries:
Search Crossover Domain by Domain Name:

select * from crossoverdomain where domainid='DOMAIN';
select * from crossoverdomain where domainid like '%DOMAIN%';
select * from crossoverdomain where domainid in ('DOMAIN1', 'DOMAIN2');
Search Crossover Domain by Source Field Name:

select * from crossoverdomain where sourcefield='ATTR';
select * from crossoverdomain where sourcefield like '%ATTR%';
select * from crossoverdomain where sourcefield in ('ATTR1', 'ATTR2');
Search Crossover Domain by Target Field Name:

select * from crossoverdomain where destfield='ATTR';
select * from crossoverdomain where destfield like '%ATTR%';
select * from crossoverdomain where destfield in ('ATTR1', 'ATTR2');
Search Crossover Domain by Condition Name on Source:

select * from crossoverdomain where sourcecondition='CONDITION';
select * from crossoverdomain where sourcecondition like '%COND%';
select * from crossoverdomain where sourcecondition in ('COND1', 'COND2');
select * from crossoverdomain where sourcecondition is not null;
Search Crossover Domain by Condition Name on Target:

select * from crossoverdomain where destcondition='CONDITION';
select * from crossoverdomain where destcondition like '%COND%';
select * from crossoverdomain where destcondition in ('COND1', 'COND2');
select * from crossoverdomain where destcondition is not null;
Search Crossover Domain by Sequence Value:

select * from crossoverdomain where sequence=10;
select * from crossoverdomain where sequence=20;
select * from crossoverdomain where sequence is not null;
Look for Accept NULL Values:

select * from crossoverdomain where copyevenifsrcnull=1;
Look for Overwrite Values:

select * from crossoverdomain where copyonlyifdestnull=1;
Numeric Domain Type
Object:
NUMERICDOMAIN

Primary Columns:
DOMAINID | VALUE | SITEID | ORGID

Queries:
Search Numeric Domain by Domain Name:

select * from numericdomain where domainid='DOMAIN';
select * from numericdomain where domainid like '%DOMAIN%';
select * from numericdomain where domainid in ('DOMAIN1','DOMAIN2');
Search Numeric Domain by Value:

select * from numericdomain where value=8;
Search Numeric Domain by Value Description:

select * from numericdomain where description='DESCRIPTION';
select * from numericdomain where upper(description) like '%DESC%';
Synonym Domain Type
Object:
SYNONYMDOMAIN

Primary Columns:
DOMAINID | MAXVALUE | VALUE | SITEID | ORGID

Queries:
Search Synonym Domain by Domain Name:

select * from synonymdomain where domainid='DOMAIN';
select * from synonymdomain where domainid like '%DOMAIN%';
select * from synonymdomain where domainid in ('DOMAIN1','DOMAIN2');
Search Synonym Domain by Internal Value:

select * from synonymdomain where maxvalue='VALUE';
select * from synonymdomain where maxvalue like '%VALUE%';
select * from synonymdomain where maxvalue in ('VALUE1','VALUE2');
Search Synonym Domain by Value:

select * from synonymdomain where value='VALUE';
select * from synonymdomain where value like '%VALUE%';
select * from synonymdomain where value in ('VALUE1','VALUE2');
Search Synonym Domain by Value Description:

select * from synonymdomain where description='DESCRIPTION';
select * from synonymdomain where upper(description) like '%DESC%';
Look for Default Values:

select * from synonymdomain where defaults=1;
Number Range Domain Type
Object:
NUMRANGEDOMAIN

Primary Columns:
DOMAINID | RANGESEGMENT | SITEID | ORGID

Queries:
Search Number Range Domain by Domain Name:

select * from numrangedomain where domainid='DOMAIN';
select * from numrangedomain where domainid like '%DOMAIN%';
select * from numrangedomain where domainid in ('DOMAIN1', 'DOMAIN2');
Search Number Range Domain by Range Minimum:

select * from numrangedomain where rangeminimum=100;
Search Number Range Domain by Range Maximum:

select * from numrangedomain where rangemaximum=1000;
Search Number Range Domain by Range Interval:

select * from numrangedomain where rangeinterval=25;
Domain Value Condition
Object:
MAXDOMVALCOND

Primary Columns:
VALUEID | DOMAINID | CONDITIONNUM | OBJECTNAME

Queries:
Search Domain Value Condition by Domain Name:

select * from maxdomvalcond where domainid='DOMAIN';
select * from maxdomvalcond where domainid like '%DOMAIN%';
select * from maxdomvalcond where domainid in ('DOMAIN1','DOMAIN2');
Search Domain Value Condition by Condition Name:

select * from maxdomvalcond where conditionnum='CONDITION';
select * from maxdomvalcond where conditionnum like '%COND%';
select * from maxdomvalcond where conditionnum in ('CONDITION1', 'CONDITION2');
Search Domain Value Condition by Object Name:

select * from maxdomvalcond where objectname='OBJECT';
select * from maxdomvalcond where objectname like '%OBJ%';
select * from maxdomvalcond where objectname in ('OBJECT1', 'OBJECT2');
select * from maxdomvalcond where objectname is null;
Escalation
Object:
ESCALATION

Primary Columns:
ESCALATION

Queries:
Search Escalation by Escalation Name:

select * from escalation where escalation='ESCALATION';
select * from escalation where escalation like '%ESC%';
select * from escalation where escalation in ('ESCALATION1', 'ESCALATION2');
Search Escalation by Escalation Description:

select * from escalation where description='DESCRIPTION';
select * from escalation where upper(description) like '%DESC%';
Search Escalation by Expression:

select * from escalation where upper(condition) like '%EXP%';
Search Escalation by Object Name:

select * from escalation where objectname='OBJECT';
select * from escalation where objectname like '%OBJ%';
select * from escalation where objectname in ('OBJECT1','OBJECT2');
Look for Active Escalation:

select * from escalation where active=1;
Group
Object:
MAXGROUP

Primary Columns:
GROUPNAME

Queries:
Search Group by Group Name:

select * from maxgroup where groupname='GROUP';
select * from maxgroup where groupname like '%GROUP%';
select * from maxgroup where groupname in ('GROUP1','GROUP2');
Search Group by Group Description:

select * from maxgroup where description='DESCRIPTION';
select * from maxgroup where upper(description) like '%DESC%';
Search Group by Default Application Name:

select * from maxgroup where dfltapp='APP';
select * from maxgroup where dfltapp like '%APP%';
select * from maxgroup where dfltapp in ('APP1','APP2');
Search Group by Start Center Template ID:

select * from maxgroup where sctemplateid='TEMPLATEID';
Group User
Object:
GROUPUSER

Primary Columns:
USERID | GROUPNAME

Queries:
Search Group by Group Name:

select * from groupuser where groupname='GROUP';
select * from groupuser where groupname like '%GROUP%';
select * from groupuser where groupname in ('GROUP1','GROUP2');
Search Group by User ID:

select * from groupuser where userid='USER';
select * from groupuser where userid like '%USER%';
select * from groupuser where userid in ('USER1','USER2');
Label
Object:
MAXLABELS

Primary Columns:
APP | ID | PROPERTY

Queries:
Search Label by Application Name:

select * from maxlabels where app='APP';
select * from maxlabels where app like '%APP%';
select * from maxlabels where app in ('APP1','APP2');
Search Label by Label ID:

select * from maxlabels where id='ID';
select * from maxlabels where id like '%ID%';
select * from maxlabels where id in ('ID1','ID2');
Search Label by Label Value:

select * from maxlabels where value='VALUE';
select * from maxlabels where value like '%VALUE%';
select * from maxlabels where value in ('VALUE1','VALUE2');
Search Label by Label Property:

select * from maxlabels where property='label';
select * from maxlabels where property='mxevent_desc';
select * from maxlabels where property='buttonlabel';
Logger
Object:
MAXLOGGER

Primary Columns:
LOGKEY

Queries:
Search Logger by Logger Name:

select * from maxlogger where logger='LOGGER';
select * from maxlogger where logger like '%LOGGER%';
select * from maxlogger where logger in ('LOGGER1','LOGGER2');
Search Logger by Logger Level:

select * from maxlogger where loglevel='DEBUG';
select * from maxlogger where loglevel='ERROR';
select * from maxlogger where loglevel='INFO';
select * from maxlogger where loglevel='WARN';
Search Logger by Logger Key:

select * from maxlogger where logkey like 'log4j.logger.maximo%';
Look for Active Loggers:

select * from maxlogger where active=1;
Look for Internal Loggers:

select * from maxlogger where internal=1;
Search Logger by Logger Appenders:

select * from maxlogger where appenders='jmsque';
select * from maxlogger where appenders like 'Asset%';
select * from maxlogger where appenders in ('jmsque','bimlogger');
select * from maxlogger where appenders is not null;
Search Logger by Parent Logger ID:

select * from maxlogger where parentloggerid=5;
select * from maxlogger where parentloggerid in (3,5);
select * from maxlogger where parentloggerid is not null;
Lookup Map
Object:
MAXLOOKUPMAP

Primary Columns:
TARGET | LOOKUPATTR | TARGETATTR | SOURCE

Queries:
Search Lookup Map by Source Object Name:

select * from maxlookupmap where source='SOURCE';
select * from maxlookupmap where source like '%SOURCE%';
select * from maxlookupmap where source in ('SOURCE1','SOURCE2');
Search Lookup Map by Source Key Name:

select * from maxlookupmap where sourcekey='SOURCEKEY';
select * from maxlookupmap where sourcekey like '%SOURCEKEY%';
select * from maxlookupmap where sourcekey in ('SOURCEKEY1', 'SOURCEKEY2');
Search Lookup Map by Lookup Attribute Name:

select * from maxlookupmap where lookupattr='LOOKUPATTR';
select * from maxlookupmap where lookupattr like '%LOOKUPATTR%';
select * from maxlookupmap where lookupattr in ('LOOKUPATTR1', 'LOOKUPATTR2');
Search Lookup Map by Target Object Name:

select * from maxlookupmap where target='TARGET';
select * from maxlookupmap where target like '%TARGET%';
select * from maxlookupmap where target in ('TARGET1','TARGET2');
Search Lookup Map by Target Attribute Name:

select * from maxlookupmap where targetattr='TARGETATTR';
select * from maxlookupmap where targetattr like '%TARGETATTR%';
select * from maxlookupmap where targetattr in ('TARGETATTR1', 'TARGETATTR2');
Look for Allow Null Lookup Maps:

select * from maxlookupmap where allownull=1;
Menu
Object:
MAXMENU

Primary Columns:
MENUTYPE | MODULEAPP | ELEMENTTYPE | KEYVALUE

Queries:
Search Menu by Menu Type:

select * from maxmenu where menutype='APPMENU';
select * from maxmenu where menutype='APPTOOL';
select * from maxmenu where menutype='MODULE';
select * from maxmenu where menutype='SEARCHMENU';
Search Menu by Module Name:

select * from maxmenu where moduleapp='LOCATION';
select * from maxmenu where moduleapp like '%CREW%';
select * from maxmenu where moduleapp in ('PO','WO');
Search Menu by Position:

select * from maxmenu where position=100;
Search Menu by Sub-Position:

select * from maxmenu where subposition=10;
Search Menu by Element Type:

select * from maxmenu where elementtype='APP';
select * from maxmenu where elementtype='HEADER';
select * from maxmenu where elementtype='MODULE';
select * from maxmenu where elementtype='OPTION';
select * from maxmenu where elementtype='SEP';
Search Menu by Key Value:

select * from maxmenu where keyvalue='APPNAME';
select * from maxmenu where keyvalue='HEADERNAME';
select * from maxmenu where keyvalue='MODULENAME';
select * from maxmenu where keyvalue='OPTIONNAME';
select * from maxmenu where keyvalue='SEPNAME';
Search Menu by Menu Description:

select * from maxmenu where headerdescription='DESCRIPTION';
select * from maxmenu where upper(headerdescription) like '%DESC%';
select * from maxmenu where headerdescription is not null;
Look for Visible Menus:

select * from maxmenu where visible=1;
Search Menu by Image Name:

select * from maxmenu where image='IMG';
select * from maxmenu where upper(image) like '%IMG%';
select * from maxmenu where image is not null;
Search Menu by Access Key:

select * from maxmenu where accesskey='CTRL+ALT+A';
select * from maxmenu where accesskey like '%TARGET%';
select * from maxmenu where accesskey in ('CTRL+ALT+A', 'CTRL+ALT+B');
select * from maxmenu where accesskey is not null;
Search Menu by Tab Display:

select * from maxmenu where tabdisplay='ALL';
select * from maxmenu where tabdisplay='LIST';
select * from maxmenu where tabdisplay='MAIN';
select * from maxmenu where tabdisplay='SEP';
select * from maxmenu where tabdisplay is null;
Message
Object:
MAXMESSAGES

Primary Columns:
MSGKEY | MSGGROUP

Queries:
Search Message by Message ID:

select * from maxmessages where msgid='BMXAA0000E';
select * from maxmessages where msgid like '%BMX%';
select * from maxmessages where msgid in ('BMXAA0000E', 'BMXAA0001E');
Search Message by Message Key:

select * from maxmessages where msgkey='messagekey';
select * from maxmessages where msgkey like '%key%';
select * from maxmessages where msgkey in ('messagekey1', 'messagekey2');
Search Message by Message Group:

select * from maxmessages where msggroup='messagegroup';
select * from maxmessages where msggroup like '%group%';
select * from maxmessages where msggroup in ('messagegroup1', 'messagegroup2');
Search Message by Message Value:

select * from maxmessages where upper(value) like '%VALUE%';
Object
Object:
MAXOBJECT

Primary Columns:
OBJECTNAME

Queries:
Search Object by Object Name:

select * from maxobject where objectname='OBJECT';
select * from maxobject where objectname like '%OBJ%';
select * from maxobject where objectname in ('OBJECT1','OBJECT2');
Search Object by Class Name:

select * from maxobject where upper(classname) like '%CLASS%';
select * from maxobject where classname is not null;
Search Object by Object Description:

select * from maxobject where upper(description) like '%DESC%';
Search Object by Service Name:

select * from maxobject where servicename='SERV';
select * from maxobject where servicename like '%SERV%';
select * from maxobject where servicename in ('SERV1','SERV2');
Look for Views:

select * from maxobject where isview=1;
Look for Persistent Objects:

select * from maxobject where persistent=1;
Search Object by Object Type:

select * from maxobject where siteorgtype='COMPANYSET';
select * from maxobject where siteorgtype='ITEMSET';
select * from maxobject where siteorgtype='ORG';
select * from maxobject where siteorgtype='ORGSITE';
select * from maxobject where siteorgtype='SITE';
select * from maxobject where siteorgtype='SYSTEM';
select * from maxobject where siteorgtype='SYSTEMORG';
select * from maxobject where siteorgtype='SYSTEMORGSITE';
Look for Main Objects:

select * from maxobject where mainobject=1;
Object Structure
Object:
MAXINTOBJECT

Primary Columns:
INTOBJECTNAME

Queries:
Search Object Structure by Object Structure Name:

select * from maxintobject where intobjectname='OBJECTSTR';
select * from maxintobject where intobjectname like '%OBJSTR%';
select * from maxintobject where intobjectname in ('OBJECTSTR1', 'OBJECTSTR2');
Search Object Structure by Object Structure Description:

select * from maxintobject where description='DESCRIPTION';
select * from maxintobject where upper(description) like '%DESC%';
Search Object Structure by Consumed By:

select * from maxintobject where usewith='INTEGRATION';
select * from maxintobject where usewith='MIGRATIONMGR';
select * from maxintobject where usewith='OSLC';
select * from maxintobject where usewith='REPORTING';
select * from maxintobject where usewith='WOS';
Search Object Structure by Application Name:

select * from maxintobject where app='APP';
select * from maxintobject where app like '%APP%';
select * from maxintobject where app in ('APP1','APP2');
select * from maxintobject where app is not null;
Search Object Structure by Authorization Name;

select * from maxintobject where authapp='AUTHAPP';
select * from maxintobject where authapp like '%AUTHAPP%';
select * from maxintobject where authapp in ('AUTHAPP1','AUTHAPP2');
select * from maxintobject where authapp is not null;
Search Object Structure by Change By User ID:

select * from maxintobject where changeby='USER';
select * from maxintobject where changeby like '%USER%';
select * from maxintobject where changeby in ('USER1','USER2');
Search Object Structure by Outbound Definition Class:

select * from maxintobject where upper(defclass) like '%CLASS%';
Search Object Structure by Inbound Processing Class:

select * from maxintobject where upper(procclass) like '%CLASS%';
Object Structure Detail
Object:
MAXINTOBJDETAIL

Primary Columns:
INTOBJECTNAME | OBJECTID

Queries:
Search Source Object by Object Structure Name:

select * from maxintobjdetail where intobjectname='OBJECTSTR';
select * from maxintobjdetail where intobjectname like '%OBJSTR%';
select * from maxintobjdetail where intobjectname in ('OBJECTSTR1', 'OBJECTSTR2');
Search Source Object by Source Object Name:

select * from maxintobjdetail where objectname='OBJECT';
select * from maxintobjdetail where objectname like '%OBJ%';
select * from maxintobjdetail where objectname in ('OBJECT1', 'OBJECT2');
Search Source Object by Relation Name:

select * from maxintobjdetail where relation='RELATION';
select * from maxintobjdetail where relation like '%RELATION%';
select * from maxintobjdetail where relation in ('RELATION1', 'RELATION2');
Search Source Object by Reporting Description:

select * from maxintobjdetail where description='DESCRIPTION';
select * from maxintobjdetail where upper(description) like '%DESC%';
Search Source Object by Change By User ID:

select * from maxintobjdetail where changeby='USER';
select * from maxintobjdetail where changeby like '%USER%';
select * from maxintobjdetail where changeby in ('USER1','USER2');
Search Source Object by Hierarchy Path:

select * from maxintobjdetail where hierarchypath like '%OBJECT%';
Search Source Object by Exclude Parent Key Attributes:

select * from maxintobjdetail where excludeparentkey=1;
Search Source Object by Delete Auto-Generated Data:

select * from maxintobjdetail where deleteoncreate=1;
Search Source Object by Do Not Update Primary Key:

select * from maxintobjdetail where skipkeyupdate=1;
Search Source Object by Exclude Attributes Mode:

select * from maxintobjdetail where excludebydefault=1;
Search Source Object by Alternate Key:

select * from maxintobjdetail where altkey='ALTKEY';
select * from maxintobjdetail where altkey like '%ALTKEY%';
select * from maxintobjdetail where altkey in ('ALTKEY1','ALTKEY2');
Search Source Object by Propagate Event:

select * from maxintobjdetail where propagateevent=1;
Search Source Object by Invoke Execute on Non-persistent Object:

select * from maxintobjdetail where invokeexecute=1;
Presentation
Object:
MAXPRESENTATION

Primary Columns:
APP

Queries:
Search Presentation by App Name:

select * from maxpresentation where app='APP';
select * from maxpresentation where app like '%APP%';
select * from maxpresentation where app in ('APP1', 'APP2');
Search Presentation by XML Presentation:

select * from maxpresentation where presentation like '%id="changepswd"%';
Property
Object:
MAXPROP

Primary Columns:
PROPNAME

Queries:
Search Property by Property Name:

select * from maxprop where propname='property';
select * from maxprop where propname like '%prop%';
select * from maxprop where propname in ('prop1','prop2');
Search Property by Property Description:

select * from maxprop where upper(description) like '%DESC%';
Search Property by Property Type:

select * from maxprop where maxtype='ALN';
select * from maxprop where maxtype='INTEGER';
select * from maxprop where maxtype='YORN';
Look for Global Only Properties:

select * from maxprop where globalonly=1;
Look for Instance Only Properties:

select * from maxprop where instanceonly=1;
Search Property by Default Value:

select * from maxprop where maximodefault='DEF';
select * from maxprop where maximodefault like '%DEF%';
select * from maxprop where maximodefault in ('DEF1', 'DEF2');
select * from maxprop where maximodefault is not null;
Look for Live Refresh Properties:

select * from maxprop where liverefresh=1;
Look for Encrypted Properties:

select * from maxprop where encrypted=1;
Search Property by Domain Name:

select * from maxprop where domainid='DOMAIN';
select * from maxprop where domainid like '%DOMAIN%';
select * from maxprop where domainid in ('DOMAIN1','DOMAIN2');
select * from maxprop where domainid is not null;
Look for Nulls Allowed Properties:

select * from maxprop where nullsallowed=1;
Look for User Defined Properties:

select * from maxprop where userdefined=1;
Look for Online Changes Properties:

select * from maxprop where onlinechanges=1;
Search Property by Secure Level:

select * from maxprop where securelevel='PRIVATE';
select * from maxprop where securelevel='PUBLIC';
select * from maxprop where securelevel='SECURE';
Search Property by Change By User ID:

select * from maxprop where changeby='USER';
select * from maxprop where changeby like '%USER%';
select * from maxprop where changeby in ('USER1','USER2');
Look for Masked Properties:

select * from maxprop where masked=1;
Property Value
Object:
MAXPROPVALUE

Primary Columns:
PROPNAME | SERVERNAME | SERVERHOST

Queries:
Search Property Value by Property Name:

select * from maxpropvalue where propname='property';
select * from maxpropvalue where propname like '%prop%';
select * from maxpropvalue where propname in ('prop1','prop2');
Search Property Value by Server Name:

select * from maxpropvalue where servername='MXServer';
select * from maxpropvalue where servername like '%MXServer%';
select * from maxpropvalue where servername in ('MXServer1', 'MXServer2');
Search Property Value by Server Host:

select * from maxpropvalue where serverhost='10.150.231.21';
select * from maxpropvalue where serverhost like '%10.150.231.21%';
select * from maxpropvalue where serverhost in ('10.150.231.21', '10.150.231.30');
select * from maxpropvalue where serverhost is not null;
Search Property Value by Property Value:

select * from maxpropvalue where propvalue='VALUE';
select * from maxpropvalue where propvalue like '%VALUE%';
select * from maxpropvalue where propvalue in ('VALUE1','VALUE2');
select * from maxpropvalue where propvalue is not null;
Look for Encrypted Property Values:

select * from maxpropvalue where encryptedvalue is not null;
Search Property by Change By User ID:

select * from maxpropvalue where changeby='USER';
select * from maxpropvalue where changeby like '%USER%';
select * from maxpropvalue where changeby in ('USER1','USER2');
Query
Object:
QUERY

Primary Columns:
APP | OWNER | CLAUSENAME

Queries:
Search Query by App Name:

select * from query where app='APP';
select * from query where app like '%APP%';
select * from query where app in ('APP1', 'APP2');
Search Query by Where Clause Description:

select * from query where clausename='NAME';
select * from query where upper(clausename) like '%NAME%';
Search Query by Query Description:

select * from query where description='DESCRIPTION';
select * from query where upper(description) like '%DESC%';
Search Query by Owner ID:

select * from query where owner='USER';
select * from query where owner like '%USER%';
select * from query where owner in ('USER1','USER2');
Search Query by Where Clause:

select * from query where upper(clause) like '%EXP%';
Look for Public Queries:

select * from query where ispublic=1;
Relationship
Object:
MAXRELATIONSHIP

Primary Columns:
PARENT | NAME

Queries:
Search Relation by Relation Name:

select * from maxrelationship where name='NAME';
select * from maxrelationship where name like '%NAME%';
select * from maxrelationship where name in ('NAME1','NAME2');
Search Relationship by Parent and Child Object Name:

select * from maxrelationship where parent='PARENT';
select * from maxrelationship where child='CHILD';
select * from maxrelationship where parent='PARENT' and child='CHILD';
select * from maxrelationship where parent='PARENT' or child='CHILD';
Search Relationship by Expression:

select * from maxrelationship where upper(whereclause) like '%EXP%';
Script Launch Point
Object:
SCRIPTLAUNCHPOINT

Primary Columns:
LAUNCHPOINTNAME | AUTOSCRIPT

Queries:
Search Script Launch Point by Script Launch Point Name:

select * from scriptlaunchpoint where launchpointname='LAUNCHPOINT';
select * from scriptlaunchpoint where launchpointname like '%LAUN%';
select * from scriptlaunchpoint where launchpointname in ('LAUNCHPOINT1','LAUNCHPOINT2');
Search Script Launch Point by Script Launch Point Description:

select * from scriptlaunchpoint where description='DESCRIPTION';
select * from scriptlaunchpoint where upper(description) like '%DESC%';
Search Script Launch Point by Automation Script Name:

select * from scriptlaunchpoint where autoscript='AUTOSCRIPT';
select * from scriptlaunchpoint where autoscript like ('%AUTO%');
select * from scriptlaunchpoint where autoscript in ('AUTOSCRIPT1', 'AUTOSCRIPT2');
Search Script Launch Point by Launch Point Type:

select * from scriptlaunchpoint where launchpointtype='OBJECT';
select * from scriptlaunchpoint where launchpointtype='ATTRIBUTE';
select * from scriptlaunchpoint where launchpointtype='ACTION';
Search Script Launch Point by Object Name:

select * from scriptlaunchpoint where objectname='OBJECT';
select * from scriptlaunchpoint where objectname like '%OBJ%';
select * from scriptlaunchpoint where objectname in ('OBJECT1', 'OBJECT2');
Search Script Launch Point by Attribute Name:

select * from scriptlaunchpoint where attributename='ATTRIBUTE';
select * from scriptlaunchpoint where attributename like '%ATTR%';
select * from scriptlaunchpoint where attributename in ('ATTRIBUTE1','ATTRIBUTE2');
Search Script Launch Point by Condition:

select * from scriptlaunchpoint where upper(condition) like '%EXP%';
Look for Active Script Launch Points:

select * from scriptlaunchpoint where active=1;
Security Restrict
Object:
SECURITYRESTRICT

Primary Columns:
APP | GROUPNAME | ATTRIBUTENAME | OBJECTNAME | RESTRICTION | TYPE

Queries:
Search Security Restrict by Group Name:

select * from securityrestrict where groupname='GROUP';
select * from securityrestrict where groupname like '%GROUP%';
select * from securityrestrict where groupname in ('GROUP1', 'GROUP2');
select * from securityrestrict where groupname is not null;
Search Security Restrict by App Name:

select * from securityrestrict where app='APP';
select * from securityrestrict where app like '%APP%';
select * from securityrestrict where app in ('APP1', 'APP2');
select * from securityrestrict where app is not null;
Search Security Restrict by Object Name:

select * from securityrestrict where objectname='OBJECT';
select * from securityrestrict where objectname like '%OBJ%';
select * from securityrestrict where objectname in ('OBJECT1', 'OBJECT2');
Search Security Restrict by Attribute Name:

select * from securityrestrict where attributename='ATTR';
select * from securityrestrict where attributename like '%ATTR%';
select * from securityrestrict where attributename in ('ATTR1', 'ATTR2');
select * from securityrestrict where attributename is not null;
Search Security Restrict by Restriction Type:

select * from securityrestrict where restriction='HIDDEN';
select * from securityrestrict where restriction='QUALIFIED';
select * from securityrestrict where restriction='READONLY';
Search Security Restrict by Condition Name:

select * from securityrestrict where conditionnum='CONDITION';
select * from securityrestrict where conditionnum like '%COND%';
select * from securityrestrict where conditionnum in ('CONDITION1', 'CONDITION2');
Sequence
Object:
MAXSEQUENCE

Primary Columns:
TBNAME | NAME

Queries:
Search Sequence by Object Name:

select * from maxsequence where tbname='OBJECT';
select * from maxsequence where tbname like '%OBJ%';
select * from maxsequence where tbname in ('OBJECT1','OBJECT2');
Search Sequence by Attribute Name:

select * from maxsequence where name='ATTRIBUTE';
select * from maxsequence where name like '%ATTR%';
select * from maxsequence where name in ('ATTRIBUTE1','ATTRIBUTE2');
Search Sequence by Sequence Name:

select * from maxsequence where sequencename='ATTRIBUTESEQ';
select * from maxsequence where sequencename like '%ATTR%';
select * from maxsequence where sequencename in ('ATTR1SEQ', 'ATTR2SEQ');
Server Session
Object:
SERVERSESSION

Primary Columns:
TENANTID | SERVERSESSIONID

Queries:
Search Server Session by Server Host:

select * from serversession where serverhost='10.150.231.21';
select * from serversession where serverhost like '%10.150.231.21%';
select * from serversession where serverhost in ('10.150.231.21', '10.150.231.30');
Search Server Session by Server Name:

select * from serversession where servername='MXServer';
select * from serversession where servername like '%MXServer%';
select * from serversession where servername in ('MXServer1', 'MXServer2');
Look for Active Server Sessions:

select * from serversession where active=1;
Look for Server Sessions in Admin Mode:

select * from serversession where adminmode=1;
Look for Server Sessions that is Reloading Cache:

select * from serversession where reloadcache is not null;
Search Server Session by Registry Port:

select * from serversession where registryport=13400;
Search Server Session by Process ID:

select * from serversession where pid=15016;
Service
Object:
MAXSERVICE

Primary Columns:
SERVICENAME

Queries:
Search Service by Service Name:

select * from maxservice where servicename='SERVICE';
select * from maxservice where servicename like '%SERVICE%';
select * from maxservice where servicename in ('SERVICE1', 'SERVICE2');
Search Service by Class:

select * from maxservice where upper(classname) like '%CLASS%';
Look for Active Services:

select * from maxservice where active=1;
Session
Object:
MAXSESSION

Primary Columns:
MAXSESSIONUID

Queries:
Search Session by Server Host:

select * from maxsession where serverhost='10.150.231.21';
select * from maxsession where serverhost like '%10.150.231.21%';
select * from maxsession where serverhost in ('10.150.231.21', '10.150.231.30');
Search Session by Server Name:

select * from maxsession where servername='MXServer';
select * from maxsession where servername like '%MXServer%';
select * from maxsession where servername in ('MXServer1', 'MXServer2');
Search Session by User ID:

select * from maxsession where userid='USER';
select * from maxsession where userid like '%USER%';
select * from maxsession where userid in ('USER1','USER2');
Search Session by Display Name:

select * from maxsession where displayname='NAME';
select * from maxsession where upper(displayname) like '%NAME%';
select * from maxsession where displayname in ('NAME1','NAME2');
Search Session by Client Host:

select * from maxsession where clienthost='HOST';
select * from maxsession where upper(clienthost) like '%HOST%';
select * from maxsession where clienthost in ('HOST1','HOST2');
Look for Active Sessions:

select * from maxsession where active=1;
Search Session by Client Address:

select * from maxsession where clientaddr='10.150.231.21';
select * from maxsession where clientaddr like '%10.150.231.21%';
select * from maxsession where clientaddr in ('10.150.231.21', '10.150.231.30');
Signature Option
Object:
SIGOPTION

Primary Columns:
APP | OPTIONNAME

Queries:
Search Signature Option by Application Name:

select * from sigoption where app='APPLICATION';
select * from sigoption where app like '%APP%';
select * from sigoption where app in ('APPLICATION1', 'APPLICATION2');
Search Signature Option by Option Name:

select * from sigoption where optionname='OPNAME';
select * from sigoption where optionname like '%OPNAME%';
select * from sigoption where optionname in ('OPNAME1','OPNAME2');
Search Signature Option by Option Description:

select * from sigoption where description='DESCRIPTION';
select * from sigoption where upper(description) like '%DESC%';
Look for Visible Signature Options:

select * from sigoption where visible=1;
Search Signature Option by Option Also Grants:

select * from sigoption where alsogrants='SAVE';
select * from sigoption where alsogrants like '%DELETE%';
select * from sigoption where alsogrants is not null;
Search Signature Option by Option Also Revokes:

select * from sigoption where alsorevokes='SAVE';
select * from sigoption where alsorevokes like '%DELETE%';
select * from sigoption where alsorevokes is not null;
Search Signature Option by Prerequisite:

select * from sigoption where prerequisite='INSERT';
select * from sigoption where prerequisite like '%INSERT%';
select * from sigoption where prerequisite in ('INSERT','SAVE');
User
Object:
MAXUSER

Primary Columns:
USERID

Queries:
Search User by User ID:

select * from maxuser where userid='USER';
select * from maxuser where userid like '%USER%';
select * from maxuser where userid in ('USER1','USER2');
Search User by Person ID:

select * from maxuser where person='PERSON';
select * from maxuser where person like '%PERSON%';
select * from maxuser where person in ('PERSON1','PERSON2');
Look for Active and Blocked Users:

select * from maxuser where status='ACTIVE';
select * from maxuser where status='BLOCKED';
Search User by User Type:

select * from maxuser where type='TYPE 1';
Search User by Default Site:

select * from maxuser where defsite='BEDFORD';
Search User by Login ID:

select * from maxuser where loginid='LOGINID';
select * from maxuser where loginid like '%LOGINID%';
select * from maxuser where loginid in ('LOGINID1','LOGINID2');
Variable
Object:
MAXVARS

Primary Columns:
VARNAME | ORGID | SITEID

Queries:
Search Variable by Variable Name:

select * from maxvars where varname='VARNAME';
select * from maxvars where varname like '%VARNAME%';
select * from maxvars where varname in ('VARNAME1','VARNAME2');
Search Variable by Variable Value:

select * from maxvars where varvalue='VARVALUE';
select * from maxvars where varvalue like '%VARVALUE%';
select * from maxvars where varvalue in ('VARVALUE1','VARVALUE2');
select * from maxvars where varvalue is null;
Search Variable by Variable Type:

select * from maxvars where vartype='ORG';
select * from maxvars where vartype='SITE';
select * from maxvars where vartype is null;
Search Variable by Default Value:

select * from maxvartype where defaultvalue='DEFVALUE';
select * from maxvartype where defaultvalue like '%DEFVALUE%';
select * from maxvartype where defaultvalue in ('DEFVALUE1', 'DEFVALUE2');
select * from maxvartype where defaultvalue is null;
Search Variable by Variable Description:

select * from maxvartype where upper(description) like '%DESC%';
View
Object:
MAXVIEW

Primary Columns:
VIEWNAME

Queries:
Search View by View Name:

select * from maxview where viewname='VIEW';
select * from maxview where viewname like '%VIEW%';
select * from maxview where viewname in ('VIEW1','VIEW2');
Search View by View Select:

select * from maxview where upper(viewselect) like '%SELECT%';
Search View by View From:

select * from maxview where upper(viewfrom) like '%FROM%';
Search View by View Where Clause:

select * from maxview where upper(viewwhere) like '%WHERECLAUSE%';
Look for Dynamic Views:

select * from maxview where autoselect=1;