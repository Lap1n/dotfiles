#!/bin/bash

source /opt/ros/melodic/setup.bash
echo "ROS_IP: $(hostname -i)" 
#echo "ROS_IP: $(hostname -i)" > $ROS_WORKSPACE/src/niryo_moveit/config/params.yaml
cd $ROS_WORKSPACE
catkin_make
