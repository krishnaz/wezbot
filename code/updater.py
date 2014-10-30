#!/usr/bin/python
import subprocess
    
#fo = open("/etc/cron.d/wezbot", "wb")
#fo.write("@reboot /home/pi/wezbot/updater.py");
#fo.close()

command = ["git", "fetch", "origin"]
subprocess.check_output(command)
command = ["git", "pull", "origin", "master"]
subprocess.check_output(command)
#pull from git


`wezbot.py`
# run main



 

