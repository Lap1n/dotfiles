FROM osrf/ros:melodic-desktop-full
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}

ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y apt-utils build-essential psmisc vim-gtk
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -q -y python-catkin-tools
RUN apt-get update && apt-get install -q -y ros-melodic-hector-gazebo-plugins
RUN sudo apt-get update && sudo apt-get install -y vim iputils-ping net-tools python-pip ros-melodic-robot-state-publisher ros-melodic-moveit ros-melodic-rosbridge-suite ros-melodic-joy ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-tf2-web-republisher dos2unix
RUN sudo apt-get install -y openjdk-8-jdk # for clion

# Install git lfs. Necessary in order to properly clone bobble_description
RUN echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports-main.list
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install -q -y git-lfs
RUN git lfs install

RUN sudo -H pip install rospkg jsonpickle


#ENV USERNAME RosUser
#RUN useradd -m $USERNAME && \
#        echo "$USERNAME:$USERNAME" | chpasswd && \
#        usermod --shell /bin/bash $USERNAME && \
#        usermod -aG sudo $USERNAME && \
#        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
#        chmod 0440 /etc/sudoers.d/$USERNAME && \
#        # Replace 1000 with your user/group id
#        usermod  --uid 1000 $USERNAME && \
#        groupmod --gid 1000 $USERNAME
#USER $USERNAME
RUN mkdir /catkin_ws && mkdir /catkin_ws/src
ENV ROS_WORKSPACE=/catkin_ws

COPY ./set-up-workspace.bash /setup.sh
COPY ./tutorial.bash /

RUN /bin/bash -c "find $ROS_WORKSPACE -type f -print0 | xargs -0 dos2unix"

RUN dos2unix /tutorial.bash && dos2unix /setup.sh && chmod +x /setup.sh && /setup.sh && rm /setup.sh
RUN chmod +x /tutorial.bash 

RUN sudo apt-get install -y ros-melodic-husky-desktop
RUN sudo apt-get install -y ros-melodic-husky-simulator

WORKDIR $ROS_WORKSPACE

# EXPOSE 11345
# ENTRYPOINT ["/bobble_sim_entrypoint.sh"]
CMD ["/tutorial.bash"]
