###############################################################################
# Set Hadoop-specific environment variables here.
# NOTE: HADOOP_HOME is deprecated, use HADOOP_PREFIX instead.
###############################################################################

export JAVA_HOME=/opt/java

# The maximum amount of heap to use, in MB. Default is 1000.
export HADOOP_HEAPSIZE=256

# Extra Java runtime options.  Empty by default.
export HADOOP_OPTS=-server

# Where log files are stored.  $HADOOP_HOME/logs by default.
export HADOOP_LOG_DIR=${HADOOP_PREFIX}/logs

# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_NAMENODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_NAMENODE_OPTS"
export HADOOP_SECONDARYNAMENODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_SECONDARYNAMENODE_OPTS"
export HADOOP_DATANODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_DATANODE_OPTS"
export HADOOP_BALANCER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_BALANCER_OPTS"
export HADOOP_JOBTRACKER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_JOBTRACKER_OPTS"

# The directory where pid files are stored. /tmp by default.
# NOTE: this should be set to a directory that can only be written to by 
#       the users that are going to run the hadoop daemons.  Otherwise there is
#       the potential for a symlink attack.
export HADOOP_PID_DIR=/var/hadoop/pids

