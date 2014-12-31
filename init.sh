#!/bin/sh 
DEMO="JBoss Fuse Camel Component - HL7"
VERSION=6.1.0
AUTHORS="Kenneth Peeples"
PROJECT="git@github.com/jbossdemocentral/fuse-components-hl7.git"
FUSE=jboss-fuse-6.1.0.redhat-379
FUSE_BIN=jboss-fuse-full-6.1.0.redhat-379.zip
DEMO_HOME=./target
FUSE_HOME=$DEMO_HOME/$FUSE
FUSE_PROJECT=./project/hl7demo
FUSE_SERVER_CONF=$FUSE_HOME/etc
FUSE_SERVER_BIN=$FUSE_HOME/bin
SRC_DIR=./installs
PRJ_DIR=./projects/hl7demo

# wipe screen.
clear 

# add executeable in installs
chmod +x installs/*.zip

echo
echo "Setting up the ${DEMO}"  
echo "brought to you by, ${AUTHORS}"
echo "JBoss Fuse - ${PROJECT}"
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [[ -r $SRC_DIR/$FUSE_BIN || -L $SRC_DIR/$FUSE_BIN ]]; then
		echo $DEMO FUSE is present...
		echo
else
		echo Need to download $FUSE_BIN package from the Customer Support Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi


# Create the target directory if it does not already exist.
if [ ! -x $DEMO_HOME ]; then
		echo "  - creating the demo home directory..."
		echo
		mkdir $DEMO_HOME
else
		echo "  - detected demo home directory, moving on..."
		echo
fi


# Move the old JBoss instance, if it exists, to the OLD position.
if [ -x $FUSE_HOME ]; then
		echo "  - existing JBoss FUSE detected..."
		echo
		echo "  - moving existing JBoss FUSE aside..."
		echo
		rm -rf $FUSE_HOME.OLD
		mv $FUSE_HOME $FUSE_HOME.OLD

		# Unzip the JBoss instance.
		echo Unpacking JBoss FUSE $VERSION
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$FUSE_BIN
else
		# Unzip the JBoss instance.
		echo Unpacking new JBoss FUSE...
		echo
		unzip -q -d $DEMO_HOME $SRC_DIR/$FUSE_BIN
fi



echo "  - enabling demo accounts logins in users.properties file..."
echo
cp support/users.properties $FUSE_SERVER_CONF


echo "  - making sure 'FUSE' for server is executable..."
echo
chmod u+x $FUSE_HOME/bin/start

cd $FUSE_HOME

echo "  - Start up Fuse in the background"
echo
bin/start

COUNT=0
until [ `grep -c "100%" data/karaf.out` -gt 0 ]; do
        echo Waiting on Server Start: $COUNT
        let COUNT=COUNT+1
        sleep 2
done 

echo "  - Create Fabric in Fuse"
echo
bin/client -r 3 -d 20 -u admin -p admin 'fabric:create -v --wait-for-provisioning'

echo "  - Check status of Fabric"
echo
bin/client -r 3 -d 20 -u admin -p admin 'fabric:status'

pwd

echo "Go to Project directory"
echo      
cd ../../$FUSE_PROJECT 

echo "Start compile and deploy failover camel example project to fuse"
echo         
mvn io.fabric8:fabric8-maven-plugin:1.2.0.Beta4:deploy

cd ../../target/$FUSE

sleep 15 

echo "Add profile to container"
echo         
sh bin/client -r 2 -d 40 'container-create-child --profile demo-hl7 --profile jboss-fuse-full root testcon'

echo "To stop the backgroud Fuse process, please go to bin and execute stop"
echo 
