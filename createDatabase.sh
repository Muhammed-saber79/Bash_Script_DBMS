#!/bin/bash
echo "hello Create...!"


if [ -d Databases ]
then
	clear
	echo "********************Welcome To Our DBMS*********************"
	read -p "Enter Database Name U want to Create: " dbName
        if [ -d Databases/$dbName ]
        then 
                echo "==========================="
                echo "This Database Already Exists...!"
                echo "==========================="
                echo "Retype Database Name To Create or Exit: "
                select choice in "Enter (R) to Retype Database Name" "Enter (E) to Exit"
                do
                        case $REPLY in
                        E) ./index.sh;;
                        e) ./index.sh;;
                        R) ./createDatabase.sh;;
                        r) ./createDatabase.sh;;
                        *) echo "Please Enter a Valid Option...!";;
                        esac
                done
        else
       		mkdir Databases/$dbName
                echo "==========================="
                echo "Database Created Successfully."
                echo "==========================="
		
		echo "Do You Want Connect To it?"
                select choice in "Y" "N"
                do 
                        case $REPLY in
                        Y) ./connectDatabase.sh;;
                        y) ./connectDatabase.sh;;
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
