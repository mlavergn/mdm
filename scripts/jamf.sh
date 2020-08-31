#!/bin/bash

# JAMF: MDM software

# find package contents
pkgutil --pkgs | grep com.jamfsoftware.osxenrollment
pkgutil --files com.jamfsoftware.osxenrollment

# stop daemons
sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.jamf.daemon.plist
sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.startupItem.plist
sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.task.1.plist

sudo launchctl unload -w /Library/LaunchAgents/com.jamf.management.agent.plist
sudo launchctl unload -w /Library/LaunchAgents/com.jamfsoftware.jamf.agent.plist

# kill forked processes
ps A | grep -i jamf
sudo killall JamfDaemon jamfAgent

# prevent unintended starts
sudo mv /usr/local/jamf /usr/local/jamf-x
sudo mv /Library/Application\ Support/JAMF /Library/Application\ Support/JAMF-x

# purge - WARNING: irreversible
# sudo pkgutil --forget com.jamfsoftware.osxenrollment
# sudo /usr/local/bin/jamf removeMdmProfile -verbose
# sudo /usr/local/bin/jamf removeFramework -verbose
