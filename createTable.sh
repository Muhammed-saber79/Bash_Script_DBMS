#!/bin/bash
echo "hello create table...!"

if [ -d Databases ]
then 
	clear
	echo "******************** Tables Operations *********************"
	if [ -d Databases/$1 ]
	then 
		clear
		echo "******************** Tables Options ON Database [$1] *********************"
		read -p "Enter Name of The Table U Want To Create: " tableName
		if [[ -f Databases/$1/$tableName ]]
		then 
			echo "============================="
			echo "This Table Already Exists...!"
			echo "============================="

			echo "Retype Table With New Name or Exit: "
			select choice in "Enter (R) to Retype Table Name" "Enter (E) to Exit"
			do
				case $REPLY in
				E) ./connectDatabase.sh $1;;
				e) ./connectDatabase.sh $1;;
				R) ./createTable.sh $1;;
				r) ./createTable.sh $1;;
				*) echo "Please Enter a Valid Option...!";;
				esac
			done
		else
			touch Databases/$1/$tableName
			
			echo "==========================="
			echo "Table Created Successfully."
			echo "==========================="
			
			echo "Do U Want To Make Data Manipulation On This Table?"
			echo "==========================="
			
			select choice in "Y" "N"
			do 
				case $REPLY in
				Y) ./dataManipulation.sh $1 $tableName;;
				y) ./dataManipulation.sh $1 $tableName;;
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
	mkdir Databases
	echo "No Databases Exist, yet...!"
fi





