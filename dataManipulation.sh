#!/bin/bash
echo "hello Data Manipulation...!"

if [ -d Databases ]
then
	clear
	echo "******************** Tables Operations *********************"
	if [[ $# -eq 1 ]]
	then
		if [ -d Databases/$1 ]
		then 
			clear
			echo "******************** Tables Options ON Database [$1] *********************"

			read -p "Enter Table Name: " tableName
			if [ -f Databases/$1/$tableName ]
			then
				clear
				echo "*********************** Data Manipulation [CRUD] *************************"
				select option in "Add Column" "Insert Data" "Select Data" "Updata Data" "Delete Data" "Back To Previous Menu"
				do
					case $REPLY in
					1) ./addingColumn.sh $1 $tableName;;
					2) ./insert.sh $1 $tableName;;
					3) ./selectData.sh $1 $tableName;;
					4) ./updateRecord.sh $1 $tableName;;
					5) ./deleteRecord.sh $1 $tableName;;
					6) ./connectDatabase.sh $1;;
					*) echo "Please Enter Valid Option...!";;
					esac
				done
			else 
				echo "==========================="
				echo "No Such Table Exists...!"
				echo "==========================="
				echo "Retype Table Name To Make Data Manipulation or Exit: "
				select choice in "Enter (R) to Retype Table Name" "Enter (E) to Exit"
				do
					case $REPLY in
					E|e) ./connectDatabase.sh $1;;
					# ) ./connectDatabase.sh $1;;
					R|r) ./dataManipulation.sh $1;;
					# r) ./dataManipulation.sh $1;;
					*) echo "Please Enter a Valid Option...!";;
					esac
				done
			fi
		else
			echo "No Such Database Exists...!"
		fi

	elif [[ $# -eq 2 ]]
	then
		if [ -d Databases/$1 ]
		then 
			clear
			echo "******************** Tables Options ON Database [$1] *********************"

			if [ -f Databases/$1/$2 ]
			then
				clear
				echo "*********************** Data Manipulation [CRUD] *************************"
				select option in "Add Column" "Insert Data" "Select Data" "Updata Data" "Delete Data" "Back To Previous Menu"
				do
					case $REPLY in
					1) ./addingColumn.sh $1 $2;;
					2) ./insert.sh $1 $2;;
					3) ./selectData.sh $1 $2;;
					4) ./updateRecord.sh $1 $2;;
					5) ./deleteRecord.sh $1 $2;;
					6) ./connectDatabase.sh $1;;
					*) echo "Please Enter Valid Option...!";;
					esac
				done
			else 
				echo "==========================="
				echo "No Such Table Exists...!"
				echo "==========================="
				echo "Retype Table Name To Make Data Manipulation or Exit: "
				select choice in "Enter (R) to Retype Table Name" "Enter (E) to Exit"
				do
					case $REPLY in
					E) ./connectDatabase.sh $1;;
					e) ./connectDatabase.sh $1;;
					R) ./dataManipulation.sh $1;;
					r) ./dataManipulation.sh $1;;
					*) echo "Please Enter a Valid Option...!";;
					esac
				done
			fi
		else
			echo "No Such Database Exists...!"
		fi
	else
		echo "Invalid Arguments...!"
	fi
fi

