#!/usr/bin/python
import subprocess
import os.system:
    
#fo = open("/etc/cron.d/wezbot", "wb")
#fo.write("@reboot /home/pi/wezbot/code/updater.py");
#fo.close()

command = ["git", "fetch", "origin"]
subprocess.check_output(command)
command = ["git", "pull", "origin", "master"]
subprocess.check_output(command)
#pull from git

execfile("python /home/pi/wezbot/code/wezbot.py")




 

