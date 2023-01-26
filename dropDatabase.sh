#!/bin/bash
echo "hello drop...!"

if [ -d Databases ]
then
        clear
	echo "********************Welcome To Our DBMS*********************"
        read -p "Enter Database Name U want to Drop: " dbName
        if [ -d Databases/$dbName ]
        then 
                rm -r Databases/$dbName
                if [ -d Database/$dbName ]
                then
                        echo "==========================="
                        echo "Error Removing This Database...!"
                        echo "==========================="
                        echo "Retype Database Name To Remove or Exit: "
                        select choice in "Enter (R) to Retype Database Name" "Enter (E) to Exit"
                        do
                                case $REPLY in
                                E) ./index.sh;;
                                e) ./index.sh;;
                                R) ./dropDatabase.sh;;
                                r) ./dropDatabase.sh;;
                                *) echo "Please Enter a Valid Option...!";;
                                esac
                        done
                else
                        echo "==========================="
                        echo "Database Removed Successfully."
                        echo "==========================="
                        select choice in "Enter (R) To Return To main Menu"
                        do 
                                case $REPLY in
                                R) ./index.sh;;
                                r) ./index.sh;;
                                *) echo "Please Enter Valid Option...!";;
                                esac
                        done
                fi
        else
                echo "==========================="
                echo "No Such Database Exists...!"
                echo "==========================="
                echo "Retype Database Name To Remove or Exit: "
		select choice in "Enter (R) to Retype Database Name" "Enter (E) to Exit"
		do
			case $REPLY in
			E) ./index.sh;;
			e) ./index.sh;;
                        R) ./dropDatabase.sh;;
                        r) ./dropDatabase.sh;;
			*) echo "Please Enter a Valid Option...!";;
			esac
		done
        fi
else
	mkdir Databases
	echo "No Databases Exist, yet...!"
fi

