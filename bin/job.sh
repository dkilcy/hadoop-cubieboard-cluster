#!/bin/bash

###############################################################################
## job.sh
##
## Run a Hadoop job
##
## @author dkilcy
##############################################################################

NAMENODE=hdfs://localhost:9000
JOB_TRACKER=localhost:9001

NO_RMR=1

while getopts 'Ps' OPTION
	do
	case $OPTION in
	P)	NAMENODE=hdfs://cubieboard-1:9000
		JOB_TRACKER=cubieboard-1:9001
			;;
	s)	NO_RMR=""
			;;
	?)	printf "Usage: %s: [-P] [-s] <jar> <main> <input> <output> \n" $(basename $0) >&2
			exit 2
			;;
	esac
done
shift $(($OPTIND - 1))

if [ "$NO_RMR" ] ; then
	##echo \
	hadoop fs -rmr $4 -Dfs.defaultFS=$NAMENODE
fi

##echo \
hadoop jar $1 $2 $3 $4 -Dfs.defaultFS=$NAMENODE -Dmapred.job.tracker=$JOB_TRACKER

### 
### TODO: Notify syslog-ng when a job has been submitted
### TODO: Changelog from git
### TODO: -v --version
###

