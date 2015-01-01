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
PRJ_DIR=./project/hl7demo

# wipe screen.
clear 

# add executeable in installs
chmod +x installs/*.zip

echo
echo "Setting up the ${DEMO}"
echo "brought to you by,"   
echo "${AUTHORS}"  
echo "${PROJECT}"
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

echo "Go to Project directory"
echo      
cd $PRJ_DIR 

echo "Start compile example project...watch sample test complete"
echo  
pwd
mvn clean install

cd ../../$FUSE_SERVER_BIN
pwd
echo "  - Start up Fuse in the background"
echo "  - Install the example, watch the log and move the sample file at the console"
echo "    features:addurl mvn:org.fusebyexample.examples/hl7-example-features/1.0.0-SNAPSHOT/xml/features"
echo "    features:install hl7-example-all"
echo "  - move the camel-test.hl7 file to /tmp/ while watching the fuse.log in the log directory"
./fuse
