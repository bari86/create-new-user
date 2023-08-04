#!/bin/bash

# Read the public key from the configuration file
source user_config.txt

# Function to create a new user with password (required for sudoer) and public key authentication
create_user() {
    
    # Check if the UID is already in use
    if id "$username" &>/dev/null; then
        echo "User with UID $UID already exists. Aborting."
        exit 1
    fi

    # Check if the GID is already in use
    if getent group "$GID" &>/dev/null; then
        echo "Group with GID $GID already exists. Aborting."
        exit 1
    fi

    # Create the user with specified UID and GID. Then set to /bin/bash
    useradd -m -u "$UID" -g "$GID" -s /bin/bash "$username"

    # Set the password for the new user
    echo "$username:$password" | chpasswd

    # Create the .ssh directory and authorized_keys file with appropriate permissions
    mkdir -p "/home/$username/.ssh"
    echo "$public_key" >> "/home/$username/.ssh/authorized_keys"
    chmod 700 "/home/$username/.ssh"
    chmod 600 "/home/$username/.ssh/authorized_keys"

    chown -R "$username:$username" "/home/$username"  # Change ownership to the new user

    # Make the user sudo
    # usermod -aG sudo "$username"
}

# Main script starts here
create_user

# Remove sensitive data from the configuration file
rm user_config.txt

# Switch to the newly created user
su - "$username"
