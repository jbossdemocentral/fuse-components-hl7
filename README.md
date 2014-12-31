Fuse Components - HL7
======================================================
Currently in progress - Check back later

This example will run a HL7 message through a Camel Route to show how to easily use the HL7 component.


Setup and configuration
-----------------------

Download JBoss Fuse from jboss.org, and place the downloaded zip file under installs folder.

Add fabric server passwords for Maven Plugin to your ~/.m2/settings.xml file the fabric server's user and password so that the maven plugin can login to the fabric.

```
<server>
  <id>fabric8.upload.repo</id>
  <username>admin</username>
  <password>admin</password>
</server>
```

run 
```
init.sh
```
NOTE: init-fabric.sh will be future for a fabric example.  menu.sh will be future for building a local install or docker install.

The environment will be setup and Fuse will be started.  Then follow the following steps:

Step 1:  
  Enter the following in the console: features:addurl mvn:org.fusebyexample.examples/hl7-example-features/1.0.0-SNAPSHOT/xml/features"  
Step 2:  
  Enter the following in the console: features:install hl7-example-all"  
Step 3:  
  Enter the following in the console: log:tail"  
Step 4:  
  Move the camel-test.hl7 file to /tmp/ then watch the log for the following output  
2014-12-31 16:08:17,040 | INFO  | 0 - file:///tmp/ | hl7DirectRoute| ?? | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | HL7PV1||O|OP^^||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718  
2014-12-31 16:08:17,044 | INFO  | 0 - file:///tmp/ | hl7DirectCBRRoute| ?? | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | Transforming message.  
2014-12-31 16:08:17,051 | INFO  | 0 - file:///tmp/ | hl7DirectCBRRoute| ?? | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | HL7PV1||O|OP||||4652^Paulson^Robert|||OP|||||||||9|||||||||||||||||||||||||20061019172717|20061019172718P|2.4  
2014-12-31 16:08:17,053 | INFO  | 0 - file:///tmp/ | hl7DirectRoute| ?? | 142 - org.apache.camel.camel-core - 2.12.0.redhat-610379 | HL7MSA|AA|MSGID12349876TEST|JBOSS|FUSEDEMO|ORG|20141231160817.052-0500||ACK^A01|2|P|2.4  

Supporting Material
-------------------

Presentation -  
Blog -  
Videos -   


Released versions
-----------------

See the tagged releases for the following versions of the product:

v1.0 - Initial project
