#!/bin/bash

# -------DEPENDENCIES-------
# -figlet ; header txt


### wishlist
# [OK] get user prompt to create new notes
# [OK] allow to write notes vimlike
# [OK] create a db directory
# [OK] create a _id
# [OK] save names into db
#get autocompletion 
# [OK] get timestamp
#search into db

### VARS
path=`dirname $(realpath $0)` # setup file path
ts=`date +"%Y%m%d%H%M%s"` # timestamp
date=`date +"%x"` # get formated date
_id=$(cat $path/params/id.txt) # ID var init
choice="" # usr prompt init

### DIRECTORIES STRUCTURE
mkdir -p $path/db # if doesn't exists

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
	a)
		read -p 'name: ' name
		((_id+=1))
		echo $_id > $path/params/id.txt
		title=$_id'-'${name^^}'-'$ts
		vim $path/db/$title
		echo $_id ${name^^} >> $path/params/names.txt
		;;
	q)
		clear
		exit
		;;
	reset)
		echo "0" > $path/params/id.txt
		rm -rf $path/db
		;;
	*)
		echo -n 'Wrong choice'
		;;
esac

read -p '(Press any key to continue)'
echo $ts


clear
done
