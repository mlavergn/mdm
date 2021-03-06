###############################################
#
# Makefile
#
###############################################

# ATOS: MDM software

files:
	# find package contents
	pkgutil --pkgs | grep com.atos

stop:
	# stop daemons
	sudo launchctl unload -w /Library/LaunchDaemons/com.atos.appmeter.plist
	sudo launchctl unload -w /Library/LaunchDaemons/com.atos.elevate.plist

lock:
	# prevent auto-starts
	sudo mv /Library/ATOS /Library/ATOSX
	sudo mv /usr/bin/atos /usr/bin/atosx

unlock:
	# enable auto-starts
	sudo mv /Library/ATOSX /Library/ATOS
	sudo mv /usr/bin/atosx /usr/bin/atos

show:
	# kill forked processes
	ps A | grep -i atos
