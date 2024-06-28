#!/bin/bash


## List of servers To Create User.
servers=(
  172.20.16.10
  172.20.16.20
  172.20.16.30
)


## Creating User and Password For User
for  server in "${servers[@]}";
do
echo "Creating user on servers...."
read -p "Enter username: " username
read -sp "Enter password: " password
home_dir="/home/$username"
useradd -m -d "$home_dir" "$username"
echo "$username:$password" | chpasswd
done


## Generating SSH Key For User
cd "$home_dir"
sudo -u "$username" ssh-keygen -t rsa -f "$home_dir/.ssh/ansible_key" -P ""
echo "User $username with home directory $home_dir is added"


##List of Remote Servers to copy SSH Public key on.
remote_user=(
   172.20.16.20
   172.20.16.30
)


## Copying the Public key of User to Remote Servers.
ssh_key_path="home_dir"/.ssh/ansible_key.pub
for rserver in "${remote_servers[@]}";
do
echo "copying SSH key to $rserver...."
sudo -u "$username" ssh-copy-id -i "ssh_key_path" $username@$rserver"
done

