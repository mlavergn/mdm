###############################################
#
# Makefile
#
###############################################

# Tanium: Endpoint client security

files:
	pkgutil --pkgs | grep com.tanium
	pkgutil --files com.tanium.taniumclient.TaniumClient.pkg

stop:
	sudo launchctl unload -w /Library/LaunchDaemons/com.tanium.taniumclient.plist

status:
	ps A | grep -i tanium
	@file /Library/Tanium
	@file /Library/Taniumx
	@file /Library/LaunchDaemons/com.tanium.taniumclient.plist
	@file /Library/LaunchDaemons/com.tanium.taniumclient.plistx

kill:
	-sudo killall TaniumClient
	-sudo killall TaniumCX
	-sudo killall TaniumDetectEngine
	-sudo killall TaniumEndpointIndex

lock: stop kill
	# lock self-starts
	sudo mv /Library/Tanium /Library/Taniumx
	sudo mv /Library/LaunchDaemons/com.tanium.taniumclient.plist /Library/LaunchDaemons/com.tanium.taniumclient.plistx
	# prevent unintended reinstalls
	sudo touch /Library/Tanium
	sudo chmod 444 /Library/Tanium

unlock:
	# allow reinstall
	-sudo rm /Library/Tanium
	# unlock self-starts
	sudo mv /Library/Taniumx /Library/Tanium
	sudo mv /Library/LaunchDaemons/com.tanium.taniumclient.plistx /Library/LaunchDaemons/com.tanium.taniumclient.plist

uninstall:
	# WARNING: irreversible
	sudo pkgutil --forget com.tanium.taniumclient.TaniumClient.pkg
