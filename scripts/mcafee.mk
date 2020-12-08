###############################################
#
# Makefile
#
###############################################

# McAfee: anti-virus software

files:
	# find package contents
	pkgutil --pkgs | grep com.mcafee
	pkgutil --files comp.nai.cmamac

stop:
	sudo launchctl unload -w /Library/LaunchAgents/com.mcafee.menulet.plist
	sudo launchctl unload -w /Library/LaunchAgents/com.mcafee.reporter.plist

lock:
	# prevent auto-start
	sudo mv /Library/McAfee /Library/McAfeex
	sudo mv /var/McAfee /var/McAfeex
	# prevent reinstall
	sudo touch /Library/McAfee
	sudo chmod 444 /Library/McAfee

unlock:
	# allow reinstall
	sudo rm /Library/McAfee
	# allow auto-start
	sudo mv /Library/McAfeex /Library/McAfee
	sudo mv /var/McAfeex /var/McAfee

show:
	# stop forked processes
	ps A | grep -i mcafee

kill:
	killall -9 fmpd masvc macmnsvc Mue_InUse VShieldService VShieldScanManager VShieldScanner VShieldUpdate McAfee\ Reporter StatefulFirewall
