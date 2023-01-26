#!/bin/bash
echo "hello drop table...!"

if [ -d Databases ]
then
	clear
	echo "******************** Tables Operations *********************"
	if [ -d Databases/$1 ]
	then 
		clear
		echo "******************** Tables Options ON Database [$1] *********************"
		read -p "Enter Table Name U want to Drop: " tableName
		if [ -f Databases/$1/$tableName ]
		then 
			rm Databases/$1/$tableName

			if [ -f Database/$1/$tableName ]
			then
				echo "==========================="
				echo "Error Removing This Table...!"
				echo "==========================="
				echo "Retype Table Name To Remove or Exit: "
				select choice in "Enter (R) to Retype Table Name" "Enter (E) to Exit"
				do
						case $REPLY in
						E) ./connectDatabase.sh $1;;
						e) ./connectDatabase.sh $1;;
						R) ./dropTable.sh $1;;
						r) ./dropTable.sh $1;;
						*) echo "Please Enter a Valid Option...!";;
						esac
				done
			else
				echo "==========================="
				echo "Table Removed Successfully."
				echo "==========================="
				select choice in "Enter (R) To Return To Previous Menu"
				do 
						case $REPLY in
						R) ./connectDatabase.sh $1;;
						r) ./connectDatabase.sh $1;;
						*) echo "Please Enter Valid Option...!";;
						esac
				done
			fi
		else
			echo "==========================="
			echo "No Such Table Exists...!"
			echo "==========================="

			echo "Retype Table With another Name or Exit: "
			select choice in "Enter (R) to Retype Table Name" "Enter (E) to Exit"
			do
				case $REPLY in
				E) ./connectDatabase.sh $1;;
				e) ./connectDatabase.sh $1;;
				R) ./dropTable.sh $1;;
				r) ./dropTable.sh $1;;
				*) echo "Please Enter a Valid Option...!";;
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
