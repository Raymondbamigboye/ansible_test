#!/bin/bash



## Read username and password from user input
read -p "Enter username: " username
read -sp "Enter password: " password echo

# Create the user and set the home directory
useradd -m -d /home/"$username" "$username"


# Set the user's password
echo "$username:$password" | chpasswd

echo "User $username has been added with the specified password"



# Create ssh-key for user
su - "$username"
#ssh-keygen /home/"$username" 
echo -e "\n\n\n" | ssh-keygen -t rsa -N "" -f ansible.key








## Assigning password to user
#read -sp "Enter password: " password
#cho


#Create the user and set the home directory
#useradd -m -d
#passwd ${password}



