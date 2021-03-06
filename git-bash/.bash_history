#!/usr/bin/env bash
umask 027
function showUsage() { 	echo "Usage: $0 <mode> <name> <max-memory> \"<vmarg-list>\" <app-classname> <app-args>... "; 	echo "   <mode>: fg   run as foreground process in current shell"; 	echo "           bg   run as background process in new shell"; 	echo "           debug   run as foreground process in current shell in debug mode (suspend=n)"; 	echo "           debug-suspend   run as foreground process in current shell in debug mode (suspend=y)"; 	echo "           NOTE: for all debug modes environment variable DEBUG_ADDRESS may be set to "; 	echo "                 override default debug address of 127.0.0.1:18001"; 	echo "   <name>: application name used for naming console window"; 	echo "   <max-memory>: maximum memory heap size in MB (e.g., 768M or 2G).  Use empty \"\" if default";     echo "               should be used.  This will generally be upto 1/4 of the physical memory available";     echo "               to the OS."; 	echo "   <vmarg-list>: pass-thru args (e.g.,  \"-Xmx512M -Dmyvar=1 -DanotherVar=2\") - use"; 	echo "               empty \"\" if vmargs not needed"; 	echo "   <app-classname>: application classname (e.g., ghidra.GhidraRun )"; 	echo "   <app-args>...: arguments to be passed to the application"; 	echo " "; 	echo "   Example:"; 	echo "      $0 debug Ghidra 768M \"\" ghidra.GhidraRun";  	exit 1; }
VMARG_LIST=
ARGS=()
INDEX=0
WHITESPACE="[[:space:]]"
for AA in "$@"; do 	INDEX=$(expr $INDEX + 1); 	case "$INDEX" in 		1) 			MODE=$AA; 			;; 		2) 			APPNAME=$AA; 			;; 		3) 			MAXMEM=$AA; 			;; 		4) 			if [ "$AA" != "" ]; then 				VMARG_LIST=$AA; 			fi; 			;; 		5) 			CLASSNAME=$AA; 			;; 		*) 			if [[ $AA =~ $WHITESPACE ]]; then 				AA="\"$AA\""; 		    fi; 			ARGS[${#ARGS[@]}]=$AA; 			;; 	esac; done
# Verify that required number of args were provided
if [[ ${INDEX} -lt 5 ]]; then 	echo "Incorrect launch usage - missing argument(s)"; 	showUsage; 	exit 1; fi
#!/bin/bash
# Make sure you change the ADV_HOST variable in docker-compose.yml
# if you are using docker Toolbox
# 1) Source connectors
# Start our kafka cluster
docker-compose up kafka-cluster
# Wait 2 minutes for the kafka cluster to be started
###############
# A) FileStreamSourceConnector in standalone mode
# Look at the source/demo-1/worker.properties file and edit bootstrap
# Look at the source/demo-1/file-stream-demo.properties file
# Look at the demo-file.txt file
# We start a hosted tools, mapped on our code
# Linux / Mac
docker run --rm -it -v "$(pwd)":/tutorial --net=host landoop/fast-data-dev:cp3.3.0 bash
# Windows Command Line:
docker run --rm -it -v %cd%:/tutorial --net=host landoop/fast-data-dev:cp3.3.0 bash
# Windows Powershell:
docker run --rm -it -v ${PWD}:/tutorial --net=host landoop/fast-data-dev:cp3.3.0 bash
# we launch the kafka connector in standalone mode:
cd /tutorial/source/demo-1
# create the topic we write to with 3 partitions
kafka-topics --create --topic demo-1-standalone --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181
# Usage is connect-standalone worker.properties connector1.properties [connector2.properties connector3.properties]
connect-standalone worker.properties file-stream-demo-standalone.properties
# write some data to the demo-file.txt !
# shut down the terminal when you're done.
###############
###############
# B) FileStreamSourceConnector in distributed mode:
# create the topic we're going to write to
docker run --rm -it --net=host landoop/fast-data-dev:cp3.3.0 bash
kafka-topics --create --topic demo-2-distributed --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181
# you can now close the new shell
# head over to 127.0.0.1:3030 -> Connect UI
# Create a new connector -> File Source
# Paste the configuration at source/demo-2/file-stream-demo-distributed.properties
# Now that the configuration is launched, we need to create the file demo-file.txt
docker ps
docker exec -it <containerId> bash
touch demo-file.txt
echo "hi" >> demo-file.txt
echo "hello" >> demo-file.txt
echo "from the other side" >> demo-file.txt
# Read the topic data
docker run --rm -it --net=host landoop/fast-data-dev:cp3.3.0 bash
kafka-console-consumer --topic demo-2-distributed --from-beginning --bootstrap-server 127.0.0.1:9092
# observe we now have json as an output, even though the input was text!
###############
###############
# C) TwitterSourceConnector in distributed mode:
# create the topic we're going to write to
docker run --rm -it --net=host landoop/fast-data-dev:cp3.3.0 bash
kafka-topics --create --topic demo-3-twitter --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181
# Start a console consumer on that topic
kafka-console-consumer --topic demo-3-twitter --bootstrap-server 127.0.0.1:9092
# Follow the instructions at: https://github.com/Eneco/kafka-connect-twitter#creating-a-twitter-application
# To obtain the required keys, visit https://apps.twitter.com/ and Create a New App. Fill in an application name & description & web site and accept the developer aggreement. Click on Create my access token and populate a file twitter-source.properties with consumer key & secret and the access token & token secret using the example file to begin with.
# Setup instructions for the connector are at: https://github.com/Eneco/kafka-connect-twitter#setup
# fill in the required information at demo-3/source-twitter-distributed.properties
# Launch the connector and start seeing the data flowing in!
ls -l
git
git branch 
ll
ll
exit
ll
bash
ll
grep a
ll | grep a*
cat tokens | while IFS= read -r line; do   clear;   echo -n "$line" | qrencode -t UTF8;   read -p $"Press any key to continue" key < /dev/tty; done
ll
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
cat ~/.bashrc 
vi ~/.bashrc 
pwd
pwd
ll
ll
ll
ll
ll
ll
clear
ll
clear
ll
clear
ls -lrth
cd MinGW/
ll
cd bin
ll
ls -lrth
ll
cd /d/
ll
ll
cd Desktop/
ll
git clone https://github.com/davidtrovisco/MedicalCLinic.git
cd D:\GIT\MYKI
cd /d/GIT/MYKI/
ll
git status
git add .
git commit -m 'Update'
git push
ls -l
printf 'abd'
printf 'abd\nfdsf'
ll
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
mkdir -p ~/.config && touch ~/.config/starship.toml
ls
cd GIT/MYKI/
ll
history
echo hi
history
history
history
history -1
tail -1 history
history | tail -1
history | tail -2
history | tail -2
history | tail -2
bat ~/.bash_history 
history 
starship update
starship
starship completions
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
exit
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
ls
ll
ll
ll
ll
ll
ll
ls
ls
clear
clear
ll
ll
ll
ll
ll
echo test
ls
ll
ll
ls
clear
cat ~/.bash_history 
ls
git status
git pull
git status 
git add .
git status
git commit -m 'Update'
git push
py run_everyday.py 
py run_everyday.py 
git status
git commit -m 'Little Update'
git add .
git commit -m 'Little Update'
git push
help
history
exit
history
help
sdfdfsdf
history
exit
ls -lrth
exit
apt-get install python2-pip
git log
ls
ls
mv fg-01.bin.aspx fg-01.bin
mv fg-02.bin.aspx fg-02.bin
mv fg-03.bin.aspx fg-03.bin
mv fg-04.bin.aspx fg-04.bin
mv fg-05.bin.aspx fg-05.bin
mv fg-06.bin.aspx fg-06.bin
ll
mv fg-optional-bonus-soundtrack.bin.aspx fg-optional-bonus-soundtrack.bin
mv Verify\ BIN\ files\ before\ installation.bat.aspx  Verify\ BIN\ files\ before\ installation.bat
ll
mv setup.exe.aspx setup.exe
