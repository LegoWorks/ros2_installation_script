#!/bin/bash

### Installing ROS2 humble

#Installing  utilities
sudo apt update && sudo apt install -y terminator

sudo apt install -y python3-pip
pip3 install setuptools==58.2.0 

#Preparing installation
locale  # check for UTF-8

sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt install -y software-properties-common
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#Installing ros2 humble and colcon
sudo apt update && sudo apt -y  upgrade

sudo apt install -y ros-humble-desktop
sudo apt install -y python3-colcon-common-extensions 

#sourcing
source /opt/ros/humble/setup.bash 
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash 

# Adding source commands to bash
echo 'source /opt/ros/humble/setup.bash ' >> ~/.bashrc
echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash ' >> ~/.bashrc
echo 'source ~/ros2_ws/install/local_setup.bash ' >> ~/.bashrc

#Creating ros workspace
mkdir -p ros2_ws/src 
source ~/ros2_ws/install/local_setup.bash 

#### Install docker:

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -y -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod -y a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
