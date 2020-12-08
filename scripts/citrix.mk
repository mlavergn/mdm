###############################################
#
# Makefile
#
###############################################

# Citrix: auto-update software

files:
	# find package contents
	pkgutil --pkgs | grep com.citrix
	pkgutil --files com.citrix.ICAClient

stop:
	sudo launchctl unload -w /Library/LaunchAgents/com.citrix.AuthManager_Mac.plist
	sudo launchctl unload -w /Library/LaunchAgents/com.citrix.ReceiverHelper.plist
	sudo launchctl unload -w /Library/LaunchAgents/com.citrix.ServiceRecords.plist
	sudo launchctl unload -w /Library/LaunchDaemons/com.citrix.ctxusbd.plist

ps:
	# kill forked processes
	ps A | grep -i citrix
