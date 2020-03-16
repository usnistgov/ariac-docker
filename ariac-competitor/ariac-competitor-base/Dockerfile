FROM osrf/ros:melodic-desktop-full

USER root


# install bootstrap tools

RUN apt-get update -y
RUN apt-get install -y apt-utils

RUN apt-get update && apt-get install --no-install-recommends -y \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    wget \
    && rm -rf /var/lib/apt/lists/*
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list


RUN apt-get update && apt-get install -y \
        ros-${ROS_DISTRO}-ros-controllers \
        ros-${ROS_DISTRO}-ros-control \
        ros-${ROS_DISTRO}-moveit \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN rosdep update

# Create a new user called ariac-user and give them sudo priviledges.
ENV USERNAME ariac-user
RUN adduser --gecos "Development User" --disabled-password $USERNAME
RUN adduser $USERNAME sudo
WORKDIR /home/$USERNAME

#Download and compile ARIAC 2020
RUN mkdir -p /home/ariac-user/ariac_ws/src
RUN git clone https://github.com/usnistgov/ARIAC.git  /home/ariac-user/ariac_ws/src
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
                  cd /home/ariac-user/ariac_ws && \
                  catkin_make"

#ENTRYPOINT ["/bin/bash"]
COPY ./ariac_entrypoint.sh /
USER root
RUN chmod +x /ariac_entrypoint.sh


ENTRYPOINT ["/ariac_entrypoint.sh"]
