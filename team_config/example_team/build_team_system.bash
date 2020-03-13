#!/usr/bin/env bash

# Prepare ROS
. /opt/ros/${ROS_DISTRO}/setup.bash

# Install the necessary dependencies for getting the team's source code
# Note: there is no need to use `sudo`.
apt-get update
apt-get install -y wget unzip

mkdir -p /tmp/ariac_ws/src
cd /tmp/ariac_ws/src && catkin_init_workspace
git clone https://github.com/usnistgov/ARIAC.git
cd /tmp/ariac_ws/ && catkin_make
source /tmp/ariac_ws/devel/setup.bash

# Create a catkin workspace
mkdir -p ~/my_team_ws/src

# Fetch the source code for our team's code
cd /tmp
wget https://bitbucket.org/zeidk/ariac2020/get/master.zip
unzip master.zip
mv */ariac_example ~/my_team_ws/src

cd ~/my_team_ws
catkin_make install
