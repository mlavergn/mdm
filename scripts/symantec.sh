#!/bin/bash

# Symantec: anti-virus software

# find package contents
pkgutil --pkgs | grep com.symantec
pkgutil --files com.symantec

# stop daemons
sudo mv /Library/Application\ Support/Symantec /Library/Application\ Support/Symantec-x
sudo mv /Applications/Symantec\ Solutions /Applications/Symantec\ Solutions-x

# kill forked processes
ps A | grep -i symantec