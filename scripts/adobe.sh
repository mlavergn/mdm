#!/bin/bash

# Adobe: auto-installer

# find package contents
pkgutil --pkgs | grep com.adobe
pkgutil --files com.adobe.armdc.app.pkg

# stop daemons
sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.ARMDC.Communicator.plist
sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.ARMDC.SMJobBlessHelper.plist
sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.fpsaud.plist

sudo launchctl unload -w /Library/LaunchAgents/com.adobe.ARMDCHelper.cc24aef4a1b90ed56a725c38014c95072f92651fb65e1bf9c8e43c37a23d420d.plist

# kill forked processes
ps A | grep -i adobe
