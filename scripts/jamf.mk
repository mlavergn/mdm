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
	-sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.jamf.agent.plist
	-sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.jamf.daemon.plist
	-sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.startupItem.plist
	-sudo launchctl unload -w /Library/LaunchDaemons/com.jamfsoftware.task.1.plist
	-sudo launchctl unload -w /Library/LaunchAgents/com.jamf.management.agent.plist
	-sudo launchctl unload -w /Library/LaunchAgents/com.jamfsoftware.jamf.agent.plist

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

disable:
	sudo /usr/local/bin/jamf removeMdmProfile -verbose

enable:
	# -sudo /usr/bin/profiles -D -f
	-sudo /usr/local/jamf/bin/jamf mdm
	-sudo /usr/local/jamf/bin/jamf manage
	# -sudo /usr/local/jamf/bin/jamf recon

DOMAIN ?= example.com
enroll:
	open https://jamf-admin.${DOMAIN}:8443/enroll/

profile:
	# create reg payload
	# curl -X POST -o jamf.xml https://casper-client.${DOMAIN}:8443/client
	# base64 --decode jamf.b64 > mdm.mobileconfig
	open mdm.mobileconfig

uninstall:
	# WARNING: irreversible
	sudo pkgutil --forget com.jamfsoftware.osxenrollment
	sudo /usr/local/bin/jamf removeMdmProfile -verbose
	sudo /usr/local/bin/jamf removeFramework -verbose

MACSERNO=`ioreg -l | grep IOPlatformSerialNumber|awk '{print $4}' | cut -d \" -f 2`
serial:
	ioreg -l | grep IOPlatformSerialNumber|awk '{print $4}' | cut -d \" -f 2
	# scutil --set ComputerName ${MACSERNO}
	# scutil --set LocalHostName ${MACSERNO}
	# scutil --set HostName ${MACSERNO}
