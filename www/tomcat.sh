#!/bin/sh
if [ $# != 1 ]; then
	echo "Usage: $0 start|stop"
	exit 1
fi

if [ $1 = "start" ]; then
	sudo -u www /yjdata/www/tomcat/bin/startup.sh
elif [ $1 = "stop" ]; then
	/yjdata/www/tomcat/bin/shutdown.sh
fi

sleep 5
