#!/bin/bash

# Save login info
who
last > ~/last_users.txt
sudo cat /root/.bash_history > ~/root_history.txt

chmod 600 ~/last_users.txt ~/root_history.txt 2>/dev/null

# Print root’s login-related dotfiles
echo "===== Checking root's login files ====="

for f in .bashrc .shrc .cshrc .tcshrc .profile .bash_profile; do
    if [ -f /root/$f ]; then
        echo "--- /root/$f ---"
        sudo cat /root/$f
        echo ""
    fi
done
