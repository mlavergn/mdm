# MDM

Collection of scripts to investigate the system impact of 3rd party macOS MDM, anti-virus, and software update daemons.

3rd party daemons on a client system can result in system slowdowns and increased resource usage, particularly when upgrades to the OS occur and change the assumptions underlying the 3rd party software.

Our recommendation would be to rely on macOS's built-in MDM capabilities which are guaranteed to be current with any system updates. In addition, relying on software that does not respect the macOS sandbox, such as vendor specific installers, provides a higher value attack vector for hackers.

## Use at your own risk

Some of the commands in these scripts may cause your system to become unstable. Always have a backup and preferably use a dedicated host or vm for this type of analysis. Do not run any of the scripts within this project unless you have a understanding of the changes they will make.

## Instructions

The commands in these scripts are likely to fail unless the system is booted into single-user mode:

1) Reboot
2) Press and hold ⌘ Command + S immediately after the first signs of boot-up

Single user mode prevents most daemons from launching and file locks from being established.

## Contents

There are 2 types of content in the project, tools and scripts.

- tools
-- whoownswindow.py - lists all active processes with hooks into the UI

- scripts
-- a collection of scripts for various vendor software

These scripts are not to be run as monoliths. Use individual commands withing each script for targeted changes.

For safety, commands which cause irreversible changes are commented out.

Commands which move files or directories will add a '-x' suffix. These makes re-enabling the software a straightforward rename.
