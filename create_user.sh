#!/bin/bash

# Read the public key from the configuration file
source user_config.txt

# Function to create a new user with public key authentication
create_user() {
    useradd -m "$username"   # -m creates the home directory for the user

    # Create the .ssh directory and authorized_keys file with appropriate permissions
    mkdir -p "/home/$username/.ssh"
    echo "$public_key" >> "/home/$username/.ssh/authorized_keys"
    chmod 700 "/home/$username/.ssh"
    chmod 600 "/home/$username/.ssh/authorized_keys"

    chown -R "$username:$username" "/home/$username"  # Change ownership to the new user
}

# Main script starts here
create_user

# Remove public key from the configuration file
# rm user_config.txt

# Switch to the newly created user
su "$username"
