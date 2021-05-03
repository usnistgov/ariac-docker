#!/bin/bash
set -e

ROS_DISTRO=${1-melodic}

case ${ROS_DISTRO} in
  melodic)
    echo Using ROS distro "melodic" on ubuntu distro "bionic"
    ;;
  *)
    echo "ROS distribution unsupported: ${ROS_DISTRO}"
    exit 1
esac
echo "Pulling the ARIAC competition images from dockerhub"

docker pull zeidk/ariac5-server-${ROS_DISTRO}:latest
docker pull zeidk/ariac5-competitor-base-${ROS_DISTRO}:latest
