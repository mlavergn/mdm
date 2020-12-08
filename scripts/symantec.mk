###############################################
#
# Makefile
#
###############################################

# Symantec: anti-virus software

files:
	# find package contents
	pkgutil --pkgs | grep com.symantec
	pkgutil --files com.symantec

lock:
	sudo mv /Library/Application\ Support/Symantec /Library/Application\ Support/Symantecx
	sudo mv /Applications/Symantec\ Solutions /Applications/Symantec\ Solutionsx

unlock:
	sudo mv /Library/Application\ Support/Symantecx /Library/Application\ Support/Symantec
	sudo mv /Applications/Symantec\ Solutionsx /Applications/Symantec\ Solutions

show:
	# kill forked processes
	ps A | grep -i symantec