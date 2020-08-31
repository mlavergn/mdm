#!/bin/bash

# McAfee: anti-virus software

# find package contents
pkgutil --pkgs | grep com.mcafee
pkgutil --files comp.nai.cmamac

# stop daemons
sudo launchctl unload -w /Library/LaunchAgents/com.mcafee.menulet.plist
sudo launchctl unload -w /Library/LaunchAgents/com.mcafee.reporter.plist

# prevent unintended starts
sudo mv /Libary/McAfee /Libary/McAfee-x
sudo mv /var/McAfee /var/McAfee-x

# prevent unintended reinstalls
sudo touch /Library/McAfee
sudo chmod 444 /Library/McAfee

# kill forked processes
ps A | grep -i mcafee