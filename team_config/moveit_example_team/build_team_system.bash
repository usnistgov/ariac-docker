#!/usr/bin/env bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NOCOLOR='\033[0m'

# Prepare ROS
echo -e "${YELLOW}---Sourcing ROS${NOCOLOR}"
. /opt/ros/melodic/setup.bash
echo -e "${YELLOW}---Sourcing ARIAC${NOCOLOR}"
. /home/ariac-user/ariac_ws/devel/setup.bash


# Install the necessary dependencies for getting the team's source code
# Note: there is no need to use `sudo`.
echo -e "${YELLOW}---Installing necessary dependencies${NOCOLOR}"
apt-get update
apt-get install -y wget unzip


# Create a catkin workspace
echo -e "${YELLOW}---Creating workspace${NOCOLOR}"
mkdir -p ~/my_team_ws/src

if [ -d "/root/my_team_ws" ]; then
  echo -e "${GREEN}OK${NOCOLOR}"
fi


# [ -d "~/my_team_ws" ] && rm -rf ~/my_team_ws
# mkdir -p ~/my_team_ws/src



cd /tmp
#Modify the next 3 lines to retrieve YOUR code
#Here we are just grabbing the relevant package that contains
#an example of a NIST competitor package
echo -e "${YELLOW}---Downloading competition package${NOCOLOR}"
wget https://bitbucket.org/zeidk/ariac2020/get/master.zip
unzip master.zip
mv */ariac_example ~/my_team_ws/src

echo -e "${YELLOW}---Compiling competition package${NOCOLOR}"
cd ~/my_team_ws
catkin_make
#Modify this line to remove your zip file when done
rm /tmp/master.zip
