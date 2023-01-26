#!/bin/bash
echo "hello select"

if [ -d Databases ]
then 
	if [ -d Databases/$1 ]
	then 
		if [ -f Databases/$1/$2 ]
		then 
			select choice in "All Table Data" "Specific Record" "Back To Previus Menu"
			do
				case $REPLY in
				1) echo "=========="
				   cat ./Databases/$1/$2
				   echo "===========";;
				2) head -1 ./Databases/$1/$2;;
				3) ./dataManipulation.sh $1;;
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
