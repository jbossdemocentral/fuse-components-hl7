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

It will setup JBoss Fuse, install fabric, build and deploy the profile. 

To run the demo, in browser enter http://localhost:8181 and login with ID/PWD of admin/admin

Under Runtime, you will see list of containers, and click on the small icon on the righthand-side of the testcon container
![Fabric list]()
You can also checkout the registry
![Fabric list]()

And either use browser to run it 
![Fabric list]()
Or you can use HAPITest
![Fabric list]()


Supporting Material
-------------------

Presentation -
Blog -
Videos - 


Released versions
-----------------


See the tagged releases for the following versions of the product:

v1.0 - Initial project
