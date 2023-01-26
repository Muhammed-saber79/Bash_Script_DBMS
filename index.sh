#!/bin/bash
clear
echo "********************Welcome To Our DBMS*********************"
PS3="Please Type an Option Between[1:4]: "
select option in "Display Databases" "Connect Database" "Create Database" "Drop Database" 
do
	case $REPLY in
	1) ./displayDatabases.sh;;
	2) ./connectDatabase.sh;;
	3) ./createDatabase.sh;;
	4) ./dropDatabase.sh;;
	*) echo "Please Enter Valid Option...!";;
	esac
done
	
