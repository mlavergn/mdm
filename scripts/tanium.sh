#!/bin/bash

# Tanium: MDM software

# find package contents
pkgutil --pkgs | grep com.tanium
pkgutil --files com.tanium.taniumclient.TaniumClient.pkg

# kill forked processes
ps A | grep -i tanium
sudo killall TaniumClient
sudo killall TaniumEndpointIndex
sudo killall TaniumDetectEngine

# prevent unintended starts
sudo mv /Libary/Tanium /Libary/Tanium-x
sudo mv /Library/LaunchDaemons/com.tanium.taniumclient.plist /Library/LaunchDaemons/com.tanium.taniumclient.plist-x

# prevent unintended reinstalls
sudo touch /Library/Tanium
sudo chmod 444 /Library/Tanium

# purge - WARNING: irreversible
# sudo pkgutil --forget com.tanium.taniumclient.TaniumClient.pkg
