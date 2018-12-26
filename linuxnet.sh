#!/bin/bash

# --------- DEFAULT FUNCTIONS -----------
getInput() {
	echo -ne "\e[4msysmod38\e[0m > "        # gör blinkande
	read var
}

mainMenu() {
	while true; do
		echo -e "[1] GUI-version\n[2] text-version"
		getInput
		if [ $var -eq 1 -o $var -eq 2 ]; then
			break
		fi
	done
	case $var in
		1)
			guiVersion;;
		2)
			textVersion;;
	esac
}



#######################################################
###############			    ###################
############### GUI BASED FUNCTIONS ###################
###############			    ###################
#######################################################

guiVersion() {
	OPT=$( whiptail --title "GUI Main Menu" --menu "Options" 15 60 4 "group" "group management" "user" "user management" "folder" "folder management" "SSH-server" "ssh server management" "exit" "exit to main menu" 3>&1 1>&2 2>&3) 
	case $OPT in
		group)
			guiGroupMenu;;
		user)
			guiUserMenu;;
		folder)
			guiFolderMenu;;
		SSH-server)
			guiServerMenu;;
		exit)
			mainMenu;;
	esac

}

# --------- GUI GROUP FUNCTIONS -------------
guiGroupMenu() {
	OPT=$( whiptail --title "GUI Group Menu" --menu "Options" 15 60 4 "create group" "creates a new group" "list" "list all groups" "list users" "list users in groups" "add user" "add user to a group" "remove user" "remove user from a group" "exit" "exit to main GUI menu" 3>&1 1>&2 2>&3)

	case $OPT in
		"create group")
			;;
		"list")
			;;
		"list users")
			;;
		"add user")
			;;
		"remove user")
			;;
		"exit")
			guiVersion;;
	esac
}

# --------- GUI USER FUNCTIONS --------------
guiUserMenu() {
	OPT=$( whiptail --title "GUI User Menu" --menu "Options" 15 60 4 "create user" "creates a new user" "change password" "change a users password" "list users" "list all users" "modify user" "Lets you change attributes for a specific user" "exit" "exit to main GUI menu" 3>&1 1>&2 2>&3)
	case $OPT in
		"create user")
			;;
		"change password")
			;;
		"list users")
			;;
		"modify user")
			;;
		exit)
			guiVersion;;
	esac
}

# --------- GUI FOLDER FUNCTIONS ------------
guiFolderMenu() {
	OPT=$( whiptail --title "GUI Folder Menu" --menu "Options" 15 60 4 "create folder" "creates a new folder" "list contents" "list contents of a folder" "change attributes" "sub menu to manage folder priviligies etc" "exit" "exit to main GUI menu" 3>&1 1>&2 2>&3)
	case $OPT in
		"create folder")
			;;
		"list contents")
			;;
		"change attributes")
			;;
		exit)
			guiVersion;;
	esac
}

modFolder() {
	OPT=$( whiptail --title "GUI Folder Management sub Menu" --menu "Options" 15 60 4 "change owner" "change both owner and group owner for a folder" "change priviligies" "changes the priviligies for a folder" "setguid" "set or remove setguid on a folder" "sticky bit" "add or remove sticky bit on a folder" "last modified" "shows when folder as last modified" 3>&1 1>&2 2>&3)
	case $OPT in
		group)
			guiGroupMenu;;
		user)
			guiUserMenu;;
		folder)
			guiFolderMenu;;
		SSH-server)
			guiServerMenu;;
		exit)
			guiVersion;;
	esac
}

# --------- GUI SERVER FUNCTIONS ------------
guiServerMenu() {
	OPT=$( whiptail --title "GUI Group Menu" --menu "Options" 15 60 4 "create" "creates a new group" "list" "list all groups" "list users" "list users in groups" "add user" "add user to a group" "remove user" "remove user from a group" "exut" "exit" "to main menu" 3>&1 1>&2 2>&3)
	case $OPT in
		group)
			guiGroupMenu;;
		user)
			guiUserMenu;;
		folder)
			guiFolderMenu;;
		SSH-server)
			guiServerMenu;;
		exit)
			guiVersion;;
	esac
}

########################################################
###############			     ###################
############### TEXT BASED FUNCTIONS ###################
###############			     ###################
########################################################

textVersion() {
	echo "TEXT"
}

# --------- TEXT GROUP FUNCTIONS -------------

groupMenu() {

	echo "Group menu"
}

groupHelp() {

	echo "Group help"
}
# --------- TEXT USER FUNCTIONS --------------

# --------- TEXT FOLDER FUNCTIONS ------------

# --------- TEXT SERVER FUNCTIONS ------------

mainMenu
