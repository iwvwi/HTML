#!/bin/sh

if [ $# != 1 ]; then
	echo "Usage: $0 <JDK Version>"
	echo "JDK Version: 1.6 1.7 1.8"
	exit 1;
fi

JDK_VERSION=$1

if [ $JDK_VERSION != "1.6" -a $JDK_VERSION != "1.7" -a $JDK_VERSION != "1.8" ]; then
	echo "Invalid JDK Version $JDK_VERSION"
	exit 1;
fi

jdk_home="none"
for jvm in /usr/lib/jvm/*
do
	jvm_prefix=`echo $jvm | cut -b 1-21`
	echo $jvm_prefix
	if [ $jvm_prefix = "/usr/lib/jvm/java-$JDK_VERSION" ]; then
		jdk_home=$jvm
		break
	fi
done


if [ $jdk_home = "none" ]; then
	echo "Cannot find jdk home, version: $JDK_VERSION"
	exit 1
fi

if [ -d $jdk_home/jre ]; then
	jdk_home=$jdk_home/jre
fi


#shutdown
/yjdata/www/tomcat/bin/shutdown.sh
sleep 5

echo "export JAVA_HOME=$jdk_home" > /yjdata/www/tomcat/bin/java_path.sh

/yjdata/www/tomcat.sh start
