#!/usr/bin/env bash

YELLOW='\033[0;33m'
NOCOLOR='\033[0m'
echo -e "${YELLOW}Running team system${NOCOLOR}"
. ~/my_team_ws/devel/setup.bash

# Run the example node
echo "${YELLOW}Launching moveit_example${NOCOLOR}"
rosrun ariac_example moveit_example.py
