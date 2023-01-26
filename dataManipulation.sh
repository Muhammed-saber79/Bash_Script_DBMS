#!/bin/bash
echo "hello Data Manipulation...!"

if [ -d Databases ]
then
	if [ -d Databases/$1 ]
	then 
		read -p "Enter Table Name: " tableName
		if [ -f Databases/$1/$tableName ]
		then
			clear
				echo "*********************** Data Manipulation [CRUD] *************************"
				select option in "Insert Data" "Select Data" "Updata Data" "Delete Data" "Add Column"  "Back To Main Menu"
				do
					case $REPLY in
					1) ./insert.sh $1 $tableName;;
					2) ./selectData.sh $1 $tableName;;
					3) ./update.sh $1 $tableName;;
					4) ./delete.sh $1 $tableName;;
					5) ./addingColumn.sh $1 $tableName;;
					6) ./index.sh;;
					*) echo "Please Enter Valid Option...!";;
					esac
				done
		else 
				echo "No Such Table Exists...!"
		fi
	else
		echo "No Such Database Exists...!"
	fi
fi

