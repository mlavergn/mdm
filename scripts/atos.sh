#!/bin/bash

# ATOS: MDM software

# find package contents
pkgutil --pkgs | grep com.atos

# stop daemons
sudo launchctl unload -w /Library/LaunchDaemons/com.atos.appmeter.plist
sudo launchctl unload -w /Library/LaunchDaemons/com.atos.elevate.plist

# prevent unintended starts
sudo mv /Libary/ATOS /Library/ATOS-x
sudo mv /usr/bin/atos /usr/bin/atos-x

# kill forked processes
ps A | grep -i atos
