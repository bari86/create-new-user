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

Now edit your `user_config.txt` and add your public key there.

```
nano user_config.txt
```

The `user_config.txt` should look something like this.

```
username=my_new_user
password=my_password123
public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."
```

Then run the script using command below. The script will automatically delete the `user-config.txt` file upon completion. This is for added security.


```
bash create_user.sh
```
