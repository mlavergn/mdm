#!/bin/bash

# Microsoft: auto-update software

# find package contents
pkgutil --pkgs | grep com.microsoft
pkgutil --files com.microsoft

# stop daemons
sudo launchctl unload -w /Library/LaunchAgents/com.microsoft.update.agent.plist

# kill forked processes
ps A | grep -i microsoft