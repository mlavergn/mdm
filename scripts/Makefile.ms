###############################################
#
# Makefile
#
###############################################

# Microsoft: auto-update software

show:
	# find package contents
	pkgutil --pkgs | grep com.microsoft
	pkgutil --files com.microsoft

stop:
	# stop daemons
	sudo launchctl unload -w /Library/LaunchAgents/com.microsoft.update.agent.plist

show:
	# kill forked processes
	ps A | grep -i microsoft