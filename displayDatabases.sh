#!/bin/bash

if [ -d Databases ]
then
	if [ "$(ls -A Databases)" ]
	then 
		clear
		echo "********************Welcome To Our DBMS*********************"
		ls Databases
		echo "========================================="
		echo "Enter R To Return Back To The Main Menu: "
		select choice in "R"
		do
			case $REPLY in
			R) ./index.sh;;
			r) ./index.sh;;
			*) echo "Please Enter a Valid Option...!";;
			esac
		done
	else
		clear
		echo "********************Welcome To Our DBMS*********************"
		echo "No Databases Exist yet...!"
		echo "==========================="
		echo "Do U Want To Create One?"
		select choice in "Y" "N"
		do 
			case $REPLY in
			Y) ./createDatabase.sh;;
			y) ./createDatabase.sh;;
			N) ./index.sh;;
			n) ./index.sh;;
			*) echo "Please Enter Valid Option...!";;
			esac
		done
	fi
else
	mkdir Databases
	echo "No Databases Exist, yet...!"
fi
