#!/bin/bash
echo "Hello Display..."

if [ -d Databases ]
then
	clear
	echo "******************** Tables Operations *********************"
	if [ -d Databases/$1 ]
	then 
		clear
		echo $1
		echo "******************** Tables Options ON Database [$1] *********************"
		if [ "$(ls -A Databases/$1)" ]
		then 
			ls Databases/$1
			echo "==========================="
			echo "Do U Want To Make Data Manipulation On a Table?"
			echo "==========================="
			
			select choice in "Y" "N"
			do 
				case $REPLY in
				Y) ./dataManipulation.sh $1;;
				y) ./dataManipulation.sh $1;;
				N) ./connectDatabase.sh $1;;
				n) ./connectDatabase.sh $1;;
				*) echo "Please Enter Valid Option...!";;
				esac
			done
		else
			echo "==========================="
			echo "No Tables Exist yet...!"
			echo "==========================="
			
			echo "Do U Want To Create One?"
			select choice in "Y" "N"
			do 
				case $REPLY in
				Y) ./createTable.sh $1;;
				y) ./createTable.sh $1;;
				N) ./connectDatabase.sh $1;;
				n) ./connectDatabase.sh $1;;
				*) echo "Please Enter Valid Option...!";;
				esac
			done
		fi
	else
		echo "==========================="
		echo "No Such Database Exists...!"
		echo "==========================="
		echo "Retype Database Name To Display Tables or Exit: "
		select choice in "Enter (R) to Retype Database Name" "Enter (E) to Exit"
		do
			case $REPLY in
			E) ./connectDatabase.sh;;
			e) ./connectDatabase.sh;;
			R) ./displayTables.sh $1;;
			r) ./displayTables.sh $1;;
			*) echo "Please Enter a Valid Option...!";;
			esac
		done
	fi
else
	mkdir Databases
	echo "No Databases Exist, yet...!"
fi
