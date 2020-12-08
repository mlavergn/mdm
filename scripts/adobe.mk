###############################################
#
# Makefile
#
###############################################

# Adobe: auto-installers

files:
	pkgutil --pkgs | grep com.adobe
	pkgutil --files com.adobe.armdc.app.pkg

stop:
	sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.ARMDC.Communicator.plist
	sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.ARMDC.SMJobBlessHelper.plist
	sudo launchctl unload -w /Library/LaunchDaemons/com.adobe.fpsaud.plist
	sudo launchctl unload -w /Library/LaunchAgents/com.adobe.ARMDCHelper.cc24aef4a1b90ed56a725c38014c95072f92651fb65e1bf9c8e43c37a23d420d.plist

show:
	ps A | grep -i adobe
