#!/usr/bin/python
import subprocess

#print "Setting Cron"
#fo = open("/etc/cron.d/wezbot", "wb")
#fo.write("@reboot python /home/pi/wezbot/code/updater.py > /home/pi/wezbot/code/updater.log");
#fo.close()


print "Updating"
command = ["git", "fetch", "origin"]
subprocess.check_output(command)
command = ["git", "pull", "origin", "master"]
subprocess.check_output(command)
#pull from git

print "Starting wezbot"
subprocess.call(["python", "/home/pi/wezbot/code/wezbot.py"])

