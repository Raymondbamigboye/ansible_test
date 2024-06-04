#!/bin/bash

## Switching to root

## Creating new user
read -p "ENTER USERNAME: " username
echo  $username
useradd -m -d /home/"$username" $username

#sudo adduser ${NEW_USER}

## Assigning password to user
read -sp "Please enter password: " password
passwd ${password}



