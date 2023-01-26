#!/bin/bash
echo "hello connect...!"

if [ -d Databases ]
then
	clear
	echo "******************** Welcome To Our DBMS *********************"
	if [[ $# -eq 0 ]]
	then
		read -p "Enter Database Name U want to Connect: " dbName
		if [ -d Databases/$dbName ]
		then 
			export $dbName
			clear
			echo "******************** Tables Options ON Database [$dbName] *********************"
			PS3="Please Type an Option Between[1:5]: "
			select option in "Display Tables" "Create Table" "Drop Table" "Data Manipulation" "Back To Main Menu"
			do
				case $REPLY in
				1) ./displayTables.sh $dbName;;
				2) ./createTable.sh $dbName;;
				3) ./dropTable.sh $dbName;;
				4) ./dataManipulation.sh $dbName;;
				5) ./index.sh;;
				*) echo "Please Enter Valid Option...!";;
				esac
			done
		else 
			echo "==========================="
			echo "No Such Database Exists...!"
			echo "==========================="
			echo "Retype Database Name To Connect or Exit: "
			select choice in "Enter (R) to Retype Database Name" "Enter (E) to Exit"
			do
				case $REPLY in
				E) ./index.sh;;
				e) ./index.sh;;
				R) ./connectDatabase.sh;;
				r) ./connectDatabase.sh;;
				*) echo "Please Enter a Valid Option...!";;
				esac
			done
		fi
	else
		if [ -d Databases/$1 ]
		then 
			#export $dbName
			clear
			echo $1
			echo "******************** Tables Options ON Database [$1] *********************"
			PS3="Please Type an Option Between[1:5]: "
			select option in "Display Tables" "Create Table" "Drop Table" "Data Manipulation" "Back To Main Menu"
			do
				case $REPLY in
				1) ./displayTables.sh $1;;
				2) ./createTable.sh $1;;
				3) ./dropTable.sh $1;;
				4) ./dataManipulation.sh $1;;
				5) ./index.sh;;
				*) echo "Please Enter Valid Option...!";;
				esac
			done
		else 
			echo "==========================="
			echo "No Such Database Exists...!"
			echo "==========================="
			echo "Retype Database Name To Connect or Exit: "
			select choice in "Enter (R) to Retype Database Name" "Enter (E) to Exit"
			do
				case $REPLY in
				E) ./index.sh;;
				e) ./index.sh;;
				R) ./connectDatabase.sh;;
				r) ./connectDatabase.sh;;
				*) echo "Please Enter a Valid Option...!";;
				esac
			done
		fi
	fi
else
	mkdir Databases
	echo "No Databases Exist, yet...!"
fi
