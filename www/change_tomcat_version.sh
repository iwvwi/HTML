#!/bin/sh

if [ $# != 1 ]; then
	echo "Usage: $0 <Tomcat Version>"
	echo "Tomcat Version: 6 7 8"
	exit 1;
fi

TOMCAT_VERSION=$1

if [ $TOMCAT_VERSION != "6" -a $TOMCAT_VERSION != "7" -a $TOMCAT_VERSION != "8" ]; then
	echo "Invalid Tomcat Version $TOMCAT_VERSION"
	exit 1;
fi

#shutdown
/yjdata/www/tomcat/bin/shutdown.sh
sleep 5

rm /yjdata/www/tomcat
ln -s /var/tomcat/tomcat-$TOMCAT_VERSION/ /yjdata/www/tomcat

#start
/yjdata/www/tomcat.sh start

