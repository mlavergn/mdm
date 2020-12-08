###############################################
#
# Makefile
#
###############################################

# JAMF: MDM software

file:
	# find package contents
	pkgutil --pkgs | grep com.jamfsoftware.osxenrollment
	pkgutil --files com.jamfsoftware.osxenrollment

stop:
	sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.jamf.agent.plist
	# sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.jamf.daemon.plist
	# sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.startupItem.plist
	# sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.task.1.plist
	# sudo launchctl unload -w /Library/LaunchAgents/com.jamf.management.agent.plist
	# sudo launchctl unload -w /Library/LaunchAgents/com.jamfsoftware.jamf.agent.plist

status:
	ps A | grep -i jamf
	@file /usr/local/jamf
	@file /usr/local/jamfx
	@file /Library/Application\ Support/JAMF
	@file /Library/Application\ Support/JAMFX

kill:
	sudo killall JamfDaemon jamfAgent

lock: stop kill
	# lock self-starts
	sudo mv /usr/local/jamf /usr/local/jamfx
	sudo mv /Library/Application\ Support/JAMF /Library/Application\ Support/JAMFX
	# prevent reinstall
	sudo touch /usr/local/jamf
	sudo chmod 444 /usr/local/jamf
	sudo touch /Library/Application\ Support/JAMF
	sudo chmod 444 /Library/Application\ Support/JAMF

unlock:
	# allow reinstall
	-sudo rm /usr/local/jamf
	-sudo rm /Library/Application\ Support/JAMF
	# unlock self-starts
	sudo mv /usr/local/jamfx /usr/local/jamf
	sudo mv /Library/Application\ Support/JAMFX /Library/Application\ Support/JAMF

uninstall:
	# WARNING: irreversible
	sudo pkgutil --forget com.jamfsoftware.osxenrollment
	sudo /usr/local/bin/jamf removeMdmProfile -verbose
	sudo /usr/local/bin/jamf removeFramework -verbose
