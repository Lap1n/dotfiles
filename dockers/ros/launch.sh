
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

containerId="ros"
xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId`
#USER="RosUser"
#--user=$USER \
docker run -it \
    --name="ros" \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume=$XSOCK:$XSOCK:rw \
    --volume="$XAUTH:$XAUTH:rw" \
    -p 5005:5005 \
    --volume="melodic_catkin_ws:/catkin_ws" \
    --volume="/home/lapin/.local/bin/clion:/usr/local/bin/clion" \
    --volume="/home/lapin/.ideavimrc:/root/.ideavimrc" \
    --volume="/home/lapin/.local/share/JetBrains:/home/lapin/.local/share/JetBrains" \
    --volume="/home/lapin/.config/JetBrains:/root/.config/JetBrains" \
    --volume="/home/lapin/.cache/JetBrains:/root/.cache/JetBrains" \
    --runtime=nvidia \
    ros:latest \
    /bin/bash
    # roslaunch bobble_controllers run_sim.launch
