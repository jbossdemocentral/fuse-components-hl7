@ECHO OFF
setlocal

set PROJECT_HOME=%~dp0
set DEMO=JBoss Fuse Camel Component - HL7
set AUTHORS=Kenneth Peeples
set PROJECT=git@github.com/jbossdemocentral/fuse-components-hl7.git
set FUSE=jboss-fuse-6.1.0.redhat-379
set FUSE_BIN=jboss-fuse-full-6.1.0.redhat-379.zip
set DEMO_HOME=%PROJECT_HOME%target
set FUSE_HOME=%DEMO_HOME%\%FUSE%
set FUSE_PROJECT=%PROJECT_HOME%project\hl7demo
set FUSE_SERVER_CONF=%FUSE_HOME%\etc
set FUSE_SERVER_BIN=%FUSE_HOME%\bin
set SRC_DIR=%PROJECT_HOME%installs
set PRJ_DIR=%PROJECT_HOME%project\hl7demo
set SUPPORT_DIR=%PROJECT_HOME%support

REM wipe screen.
cls

echo.
echo Setting up the %DEMO%
echo brought to you by,   
echo %AUTHORS%
echo %PROJECT%
echo.

REM double check for maven
call where mvn >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
	echo Maven Not Installed. Setup Cannot Continue
	GOTO :EOF
)

REM make some checks first before proceeding.	
if exist %SRC_DIR%\%FUSE_BIN% (
        echo %DEMO% FUSE is present...
        echo.
) else (
        echo Need to download %FUSE_BIN% package from the Customer Support Portal
        echo and place it in the %SRC_DIR% directory to proceed...
        echo.
        GOTO :EOF
)

REM Move the old JBoss instance, if it exists, to the OLD position.
if exist %FUSE_HOME% (
         echo - existing JBoss FUSE detected...
         echo.
         echo - moving existing JBoss FUSE aside...
         echo.
        
        if exist "%FUSE_HOME%.OLD" (
                rmdir /s /q "%FUSE_HOME%.OLD"
        )
        
         move "%FUSE_HOME%" "%FUSE_HOME%.OLD"
 )
 
if not exist %DEMO_HOME% (
	echo  - creating the demo home directory...
	echo.
	md "%DEMO_HOME%"
) else (
	echo  - detected demo home directory, moving on...
	echo.
)

REM Unzip the JBoss instance.
echo Unpacking JBoss FUSE %VERSION%...
echo.
cscript /nologo "%SUPPORT_DIR%\unzip.vbs" "%SRC_DIR%\%FUSE_BIN%" "%DEMO_HOME%"

if not "%ERRORLEVEL%" == "0" (
	echo Error Occurred During Installation!
	echo.
	GOTO :EOF
)


echo  - enabling demo accounts logins in users.properties file...
echo.
xcopy /Y /Q "%SUPPORT_DIR%\users.properties" "%FUSE_SERVER_CONF%"
echo. 

echo   - Start compile example project...watch sample test complete
call mvn clean install -f %PRJ_DIR%/pom.xml

if %ERRORLEVEL% NEQ 0 (
	echo Maven Build Failed. Setup Cannot Continue
	GOTO :EOF
)

echo  - Start up Fuse in the background
echo  - Install the example, watch the log and move the sample file at the console
echo    features:addurl mvn:org.fusebyexample.examples/hl7-example-features/1.0.0-SNAPSHOT/xml/features
echo    features:install hl7-example-all
echo  - move the camel-test.hl7 file to /tmp/ while watching the fuse.log in the log directory

call "%FUSE_SERVER_BIN%\fuse.bat"
