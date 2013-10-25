#!/bin/bash
#
# Run this as root to setup the hadoop user on the master and slave
# then run the master-setup.sh or slave-setup.sh depending on master or slave
#

useradd hadoop -r -m -U -s /bin/bash

