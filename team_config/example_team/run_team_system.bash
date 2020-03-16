#!/usr/bin/env bash

YELLOW='\033[0;33m'
NOCOLOR='\033[0m'
echo -e "${YELLOW}Running team system${NOCOLOR}"
. ~/my_team_ws/install/setup.bash

# Run the example node
echo "${YELLOW}Launching ARIAC example node${NOCOLOR}"
rosrun ariac_example ariac_example_node
