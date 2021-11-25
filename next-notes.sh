#!/bin/bash

# -------DEPENDENCIES-------
# -figlet ; header txt


### wishlist
#get user prompt to create new notes
#allow to write notes vimlike
#create a db directory
#create a _id
#save names into db
#get autocompletion 
# [OK] get timestamp
#search into db

# VARS
# setup path var
path=`dirname $(realpath $0)`
# timestamp var
ts=`date +"%Y%m%d%H%M%s"`
# literal date var
date=`date +"%x"`

# user prompt init
choice=""

#clear terminal when program starts
clear

# loops to avoid unwanted exits
while [ choice != "q" ]
do

# Header
figlet next
figlet notes

read -p 'Your choice: ' choice

case ${choice,,} in
	q)
		clear
		exit
		;;
	*)
		echo -n 'Wrong choice'
		;;
esac

read -p '(Press any key to continue)'
echo $ts


clear
done
