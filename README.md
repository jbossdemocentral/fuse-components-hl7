Fuse Components - HL7
======================================================

This example will run a HL7 message through a Camel Route to show how to easily use the HL7 component.


Setup and configuration
-----------------------

Download JBoss Fuse from jboss.org, and place the downloaded zip file under installs folder.

run 
```
init.sh or init.bat
```
NOTE: init-fabric.sh/init-fabric.bat will be future for a fabric example.  menu.sh will be future for building a local install or docker install.

The environment will be setup and Fuse will be started.  Then follow the following steps:

Step 1:  
  Enter the following in the console: features:addurl mvn:org.fusebyexample.examples/hl7-example-features/1.0.0-SNAPSHOT/xml/features"  
Step 2:  
  Enter the following in the console: features:install hl7-example-all"  
Step 3:  
  Enter the following in the console: log:tail"  
Step 4:  
  Move the camel-test.hl7 file to /tmp/ then look at the fuse.log for the following trace output:  

  21:47:28,228 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7FileRoute) from(file:///tmp/?delete=true&filter=%23hl7FileFilter&moveFailed=.error) --> convertBodyTo[java.lang.String] <<< Pattern:InOnly, Headers:{CamelFileNameOnly=camel-test.hl7, CamelFileAbsolute=true, CamelFileName=camel-test.hl7, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileLastModified=1420054586000, CamelFileNameConsumed=camel-test.hl7, CamelFilePath=/tmp/camel-test.hl7, CamelFileParent=/tmp, CamelFileRelativePath=camel-test.hl7, CamelFileLength=285}, BodyType:org.apache.camel.component.file.GenericFile, Body:[Body is file based: GenericFile[/tmp/camel-test.hl7]]

21:47:28,234 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7FileRoute) convertBodyTo[java.lang.String] --> direct://hl7Direct <<< Pattern:InOnly, Headers:{CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelFileNameOnly=camel-test.hl7, CamelFileName=camel-test.hl7, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileRelativePath=camel-test.hl7, CamelFileParent=/tmp, CamelFileLength=285, CamelFilePath=/tmp/camel-test.hl7, CamelFileLastModified=1420054586000, CamelFileNameConsumed=camel-test.hl7}, BodyType:String, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA|||||||
PV1||O|OP^^||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,236 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) direct://hl7Direct --> log[HL7 Request: ${body}] <<< Pattern:InOnly, Headers:{CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelFileNameOnly=camel-test.hl7, CamelFileName=camel-test.hl7, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileRelativePath=camel-test.hl7, CamelFileParent=/tmp, CamelFileLength=285, CamelFilePath=/tmp/camel-test.hl7, CamelFileLastModified=1420054586000, CamelFileNameConsumed=camel-test.hl7}, BodyType:String, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA|||||||
PV1||O|OP^^||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,237 | INFO | 0 - file:///tmp/ | hl7DirectRoute | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | HL7 Request: MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA|||||||
PV1||O|OP^^||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,238 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) log[HL7 Request: ${body}] --> unmarshal[org.apache.camel.component.hl7.HL7DataFormat@5ecb0fc4] <<< Pattern:InOnly, Headers:{CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelFileNameOnly=camel-test.hl7, CamelFileName=camel-test.hl7, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileRelativePath=camel-test.hl7, CamelFileParent=/tmp, CamelFileLength=285, CamelFilePath=/tmp/camel-test.hl7, CamelFileLastModified=1420054586000, CamelFileNameConsumed=camel-test.hl7}, BodyType:String, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA|||||||
PV1||O|OP^^||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,313 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) unmarshal[org.apache.camel.component.hl7.HL7DataFormat@5ecb0fc4] --> direct://hl7DirectCBR <<< Pattern:InOnly, Headers:{CamelFileParent=/tmp, CamelHL7Security=null, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelHL7MessageType=ADT, CamelFilePath=/tmp/camel-test.hl7, CamelHL7TriggerEvent=A01, CamelHL7ReceivingApplication=TEST, CamelFileNameConsumed=camel-test.hl7, CamelHL7VersionId=2.4, CamelFileRelativePath=camel-test.hl7, CamelHL7ReceivingFacility=JBOSS, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileLastModified=1420054586000, CamelHL7SendingApplication=FUSEDEMO, CamelHL7ProcessingId=P, CamelHL7MessageControl=MSGID12349876, CamelFileNameOnly=camel-test.hl7, CamelFileLength=285, CamelFileName=camel-test.hl7, CamelHL7SendingFacility=ORG, CamelHL7Timestamp=20061019172719}, BodyType:ca.uhn.hl7v2.model.v24.message.ADT_A01, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,317 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectCBRRoute) direct://hl7DirectCBR --> choice <<< Pattern:InOnly, Headers:{CamelFileParent=/tmp, CamelHL7Security=null, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelHL7MessageType=ADT, CamelFilePath=/tmp/camel-test.hl7, CamelHL7TriggerEvent=A01, CamelHL7ReceivingApplication=TEST, CamelFileNameConsumed=camel-test.hl7, CamelHL7VersionId=2.4, CamelFileRelativePath=camel-test.hl7, CamelHL7ReceivingFacility=JBOSS, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileLastModified=1420054586000, CamelHL7SendingApplication=FUSEDEMO, CamelHL7ProcessingId=P, CamelHL7MessageControl=MSGID12349876, CamelFileNameOnly=camel-test.hl7, CamelFileLength=285, CamelFileName=camel-test.hl7, CamelHL7SendingFacility=ORG, CamelHL7Timestamp=20061019172719}, BodyType:ca.uhn.hl7v2.model.v24.message.ADT_A01, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,836 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectCBRRoute) choice --> log[Transforming message.] <<< Pattern:InOnly, Headers:{CamelFileParent=/tmp, CamelHL7Security=null, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelHL7MessageType=ADT, CamelFilePath=/tmp/camel-test.hl7, CamelHL7TriggerEvent=A01, CamelHL7ReceivingApplication=TEST, CamelFileNameConsumed=camel-test.hl7, CamelHL7VersionId=2.4, CamelFileRelativePath=camel-test.hl7, CamelHL7ReceivingFacility=JBOSS, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileLastModified=1420054586000, CamelHL7SendingApplication=FUSEDEMO, CamelHL7ProcessingId=P, CamelHL7MessageControl=MSGID12349876, CamelFileNameOnly=camel-test.hl7, CamelFileLength=285, CamelFileName=camel-test.hl7, CamelHL7SendingFacility=ORG, CamelHL7Timestamp=20061019172719}, BodyType:ca.uhn.hl7v2.model.v24.message.ADT_A01, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,836 | INFO | 0 - file:///tmp/ | hl7DirectCBRRoute | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | Transforming message.

21:47:28,839 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectCBRRoute) log[Transforming message.] --> transform[groovy: adt = request?.body; adt?.PID?.removePatientName(0); request.body = adt;] <<< Pattern:InOnly, Headers:{CamelFileParent=/tmp, CamelHL7Security=null, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileAbsolute=true, CamelHL7MessageType=ADT, CamelFilePath=/tmp/camel-test.hl7, CamelHL7TriggerEvent=A01, CamelHL7ReceivingApplication=TEST, CamelFileNameConsumed=camel-test.hl7, CamelHL7VersionId=2.4, CamelFileRelativePath=camel-test.hl7, CamelHL7ReceivingFacility=JBOSS, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileLastModified=1420054586000, CamelHL7SendingApplication=FUSEDEMO, CamelHL7ProcessingId=P, CamelHL7MessageControl=MSGID12349876, CamelFileNameOnly=camel-test.hl7, CamelFileLength=285, CamelFileName=camel-test.hl7, CamelHL7SendingFacility=ORG, CamelHL7Timestamp=20061019172719}, BodyType:ca.uhn.hl7v2.model.v24.message.ADT_A01, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||Durden^Tyler^^^Mr.||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,922 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectCBRRoute) transform[groovy: adt = request?.body; adt?.PID?.removePatientName(0); request.body = adt;] --> log[HL7 Transformed Request: ${body}] <<< Pattern:InOnly, Headers:{CamelFileLength=285, CamelFilePath=/tmp/camel-test.hl7, CamelFileName=camel-test.hl7, CamelHL7MessageControl=MSGID12349876, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelHL7SendingApplication=FUSEDEMO, CamelHL7VersionId=2.4, CamelHL7TriggerEvent=A01, CamelHL7ReceivingFacility=JBOSS, CamelHL7Security=null, CamelHL7SendingFacility=ORG, CamelFileNameConsumed=camel-test.hl7, CamelHL7ProcessingId=P, CamelFileRelativePath=camel-test.hl7, CamelFileLastModified=1420054586000, CamelFileNameOnly=camel-test.hl7, CamelHL7MessageType=ADT, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelHL7ReceivingApplication=TEST, CamelFileParent=/tmp, CamelFileAbsolute=true, CamelHL7Timestamp=20061019172719}, BodyType:ca.uhn.hl7v2.model.v24.message.ADT_A01, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,925 | INFO | 0 - file:///tmp/ | hl7DirectCBRRoute | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | HL7 Transformed Request: MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,928 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) log[HL7 Transformed Request: ${body}] --> bean[ref:hl7AckGenerator] <<< Pattern:InOnly, Headers:{CamelFileLength=285, CamelFilePath=/tmp/camel-test.hl7, CamelFileName=camel-test.hl7, CamelHL7MessageControl=MSGID12349876, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelHL7SendingApplication=FUSEDEMO, CamelHL7VersionId=2.4, CamelHL7TriggerEvent=A01, CamelHL7ReceivingFacility=JBOSS, CamelHL7Security=null, CamelHL7SendingFacility=ORG, CamelFileNameConsumed=camel-test.hl7, CamelHL7ProcessingId=P, CamelFileRelativePath=camel-test.hl7, CamelFileLastModified=1420054586000, CamelFileNameOnly=camel-test.hl7, CamelHL7MessageType=ADT, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelHL7ReceivingApplication=TEST, CamelFileParent=/tmp, CamelFileAbsolute=true, CamelHL7Timestamp=20061019172719}, BodyType:ca.uhn.hl7v2.model.v24.message.ADT_A01, Body:MSH|^~\&|FUSEDEMO|ORG|TEST|JBOSS|20061019172719||ADT^A01^ADT_A01|MSGID12349876|P|2.4
PID|||20301||||19700312|M|||88 Punchward Dr.^^Los Angeles^CA^11221^USA
PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718

21:47:28,950 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) bean[ref:hl7AckGenerator] --> marshal[org.apache.camel.component.hl7.HL7DataFormat@65783d7a] <<< Pattern:InOnly, Headers:{CamelHL7Security=null, CamelFilePath=/tmp/camel-test.hl7, CamelFileNameConsumed=camel-test.hl7, CamelFileRelativePath=camel-test.hl7, CamelHL7ProcessingId=P, CamelFileLastModified=1420054586000, CamelHL7ReceivingApplication=TEST, CamelHL7TriggerEvent=A01, CamelFileNameOnly=camel-test.hl7, CamelHL7SendingFacility=ORG, CamelFileAbsolute=true, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelHL7VersionId=2.4, CamelHL7SendingApplication=FUSEDEMO, CamelFileParent=/tmp, CamelFileLength=285, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelFileName=camel-test.hl7, CamelHL7MessageType=ADT, CamelHL7MessageControl=MSGID12349876, CamelHL7Timestamp=20061019172719, CamelHL7ReceivingFacility=JBOSS}, BodyType:ca.uhn.hl7v2.model.v24.message.ACK, Body:MSH|^~\&|TEST|JBOSS|FUSEDEMO|ORG|20141231214728.945-0500||ACK^A01|1|P|2.4
MSA|AA|MSGID12349876

21:47:28,953 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) marshal[org.apache.camel.component.hl7.HL7DataFormat@65783d7a] --> log[HL7 Response: ${body}] <<< Pattern:InOnly, Headers:{CamelHL7TriggerEvent=A01, CamelHL7VersionId=2.4, CamelHL7MessageControl=MSGID12349876, CamelFileNameOnly=camel-test.hl7, CamelFileNameConsumed=camel-test.hl7, CamelHL7Timestamp=20061019172719, CamelHL7MessageType=ADT, CamelHL7Security=null, CamelHL7SendingApplication=FUSEDEMO, CamelFileRelativePath=camel-test.hl7, CamelFileLastModified=1420054586000, CamelHL7ReceivingApplication=TEST, CamelHL7SendingFacility=ORG, CamelFileAbsolute=true, CamelHL7ProcessingId=P, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileParent=/tmp, CamelFilePath=/tmp/camel-test.hl7, CamelFileLength=285, CamelFileName=camel-test.hl7, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelHL7ReceivingFacility=JBOSS}, BodyType:byte[], Body:MSH|^~\&|TEST|JBOSS|FUSEDEMO|ORG|20141231214728.945-0500||ACK^A01|1|P|2.4
MSA|AA|MSGID12349876

21:47:28,954 | INFO | 0 - file:///tmp/ | hl7DirectRoute | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | HL7 Response: MSH|^~\&|TEST|JBOSS|FUSEDEMO|ORG|20141231214728.945-0500||ACK^A01|1|P|2.4
MSA|AA|MSGID12349876

21:47:28,954 | INFO | 0 - file:///tmp/ | Tracer | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | ID-localhost-50691-1420080376277-0-2 >>> (hl7DirectRoute) log[HL7 Response: ${body}] --> mock://hl7DirectResponse <<< Pattern:InOnly, Headers:{CamelHL7TriggerEvent=A01, CamelHL7VersionId=2.4, CamelHL7MessageControl=MSGID12349876, CamelFileNameOnly=camel-test.hl7, CamelFileNameConsumed=camel-test.hl7, CamelHL7Timestamp=20061019172719, CamelHL7MessageType=ADT, CamelHL7Security=null, CamelHL7SendingApplication=FUSEDEMO, CamelFileRelativePath=camel-test.hl7, CamelFileLastModified=1420054586000, CamelHL7ReceivingApplication=TEST, CamelHL7SendingFacility=ORG, CamelFileAbsolute=true, CamelHL7ProcessingId=P, CamelFileAbsolutePath=/tmp/camel-test.hl7, CamelFileParent=/tmp, CamelFilePath=/tmp/camel-test.hl7, CamelFileLength=285, CamelFileName=camel-test.hl7, breadcrumbId=ID-localhost-50691-1420080376277-0-1, CamelHL7ReceivingFacility=JBOSS}, BodyType:byte[], Body:MSH|^~\&|TEST|JBOSS|FUSEDEMO|ORG|20141231214728.945-0500||ACK^A01|1|P|2.4
MSA|AA|MSGID12349876

Supporting Material
-------------------

Presentation -  
Blog - http://www.ossmentor.com/2014/12/transforming-and-routing-hl7-messages.html  
Videos -   


Released versions
-----------------

See the tagged releases for the following versions of the product:

v1.0 - Initial project
