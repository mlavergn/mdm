#!/bin/bash

# Citrix: auto-update software

# find package contents
pkgutil --pkgs | grep com.citrix
pkgutil --files com.citrix.ICAClient

# stop daemons
sudo launchctl unload -w /Library/LaunchAgents/com.citrix.AuthManager_Mac.plist
sudo launchctl unload -w /Library/LaunchAgents/com.citrix.ReceiverHelper.plist
sudo launchctl unload -w /Library/LaunchAgents/com.citrix.ServiceRecords.plist

sudo launchctl unload -w /Library/LaunchDaemons/com.citrix.ctxusbd.plist

# kill forked processes
ps A | grep -i citrix
