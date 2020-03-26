#!/usr/bin/env bash

YELLOW='\033[0;33m'
NOCOLOR='\033[0m'

# Prepare ROS
echo -e "${YELLOW}Sourcing ROS${NOCOLOR}"
. /opt/ros/${ROS_DISTRO}/setup.bash
echo -e "${YELLOW}Sourcing ARIAC${NOCOLOR}"
. /home/ariac-user/ariac_ws/devel/setup.bash


# Install the necessary dependencies for getting the team's source code
# Note: there is no need to use `sudo`.
apt-get update
apt-get install -y wget unzip


# Create a catkin workspace
#Do not modify this line
[ -d "~/my_team_ws" ] && rm -rf ~/my_team_ws
mkdir -p ~/my_team_ws/src

# Fetch the source code for our team's code
# Do not modify this line
cd /tmp
#Modify the next 3 lines to retrieve your code
#Here we are just grabbing the relevant package that contains your code
wget https://bitbucket.org/zeidk/ariac2020/get/master.zip
unzip master.zip
mv */ariac_example ~/my_team_ws/src

cd ~/my_team_ws
catkin_make
#Modify this line to remove your zip file when done
rm /tmp/master.zip
