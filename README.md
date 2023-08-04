# Create New User Script

This script is to automate the adding new user to the system.

Copy this repo.

```
git clone https://github.com/bari86/create-new-user.git
```

Enter the folder.

```
cd create-new-user
```

Chmod the file for security.

```
chmod 600 user_config.txt
```

Now edit your `user_config.txt` and change your username, password and public key there.

```
nano user_config.txt
```

The `user_config.txt` should look something like this. There are two authentication method here. The default is public key, but password is there too as you will need password if the new user is in sudo group. If you do not want the user to be sudo, you can also delete the `password` line on the `user_config.txt` so that you can only login via the public key. You can also select your own user id and group id using the UID and GID.

```
username=my_new_user
password=my_password123
public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."
UID=1500
GID=1500
```

Then run the script using command below. The script will automatically delete the `user_config.txt` file upon completion. This is for added security. There is an option to make the new user sudo. You need to uncomment it on the `create_user.sh`. 


```
bash create_user.sh
```
