#!/bin/bash
databaseName=$1
tableName=$2


#!/bin/bash
if [ -d Databases ]
then
	clear
	echo "******************** Tables Operations *********************"
	if [[ $# -eq 2 ]]
	then
		if [ -d Databases/$1 ]
		then 
			clear
			echo "******************** Tables Options ON Database [$1] *********************"

			if [ -f Databases/$1/$2 ]
			then
				clear
				echo "*********************** Data Maniplation [Delete Data] *************************"
				
				if [[ -f Databases/$1/.metaDataOf$2 ]]
				then
                    echo "Please enter condition [ COLUMN NAME ] and [ COLUMN VALUE ] "
                    read columnName columnValue

                    if [[ `grep -n $columnName Databases/$1/.metaDataOf$2 | wc -l` = 1 ]]
                    then
                        columnNumber=$(awk -F: '{print NR,$0}' Databases/$1/.metaDataOf$2 | grep "$columnName" | cut -d " " -f1)
                        fieldNumber=$(awk -F":"  -v columnValue=$columnValue '{ for(i = 1 ; i <= NF ; i++){ if( $i == columnValue) print i} }' Databases/$1/$2)
                        if [[ $fieldNumber = $columnNumber ]]
                        then
                            recordNumber=$(awk '{print NR,$0}' Databases/$1/$2 | grep "$columnValue" | cut -d " " -f1)
                            sed -i "$recordNumber  d" Databases/$1/$2
                            echo "========================================"
                            echo "Record Removed Successfully."
                            echo "========================================"
                            echo "Do U Want To Delete Another OR Exit?"
                            select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                            do
                                case $REPLY in
                                Y|y) ./deleteRecord.sh $1 $2;;
                                E|e) ./dataManipulation.sh $1 $2;;
                                *) echo "Please Enter a Valid Option...!";;
                                esac
                            done
                        else
                            echo "========================================"
                            echo "No Such Value Exists...!"
                            echo "========================================"
                            echo "Do U Want To Delete Another OR Exit?"
                            select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                            do
                                case $REPLY in
                                Y|y) ./deleteRecord.sh $1 $2;;
                                E|e) ./dataManipulation.sh $1 $2;;
                                *) echo "Please Enter a Valid Option...!";;
                                esac
                            done
                        fi
                    else
                        echo "========================================"
                        echo "No Such Column Exists...!"
                        echo "========================================"
                        echo "Do U Want To Delete Another OR Exit?"
                        select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                        do
                            case $REPLY in
                            Y|y) ./deleteRecord.sh $1 $2;;
                            E|e) ./dataManipulation.sh $1 $2;;
                            *) echo "Please Enter a Valid Option...!";;
                            esac
                        done
                    fi
				else
					
					echo "========================================="
					echo "There is MetaData File For This Table...!"
					echo "========================================="
					echo "Do U Want To Create One?"
					select choice in "Enter (Y) to Create One" "Enter (E) to Exit"
					do
					case $REPLY in
					E|e) ./dataManipulation.sh $1 $2;;
					Y|y) clear
						 echo "*********************** Data Definition [Adding Column] *************************"
						 touch Databases/$1/.metaDataOf$2
						 echo "=================================================="
					     echo "MetaData File For This Table Created Successfully."
						 echo "=================================================="
						 echo "Do U Want To Add Column?"
						 select item in "Enter (Y) to Add Column" "Enter (E) to Exit"
						 do
						 	case $REPLY in
							Y|y) ./addingColumn.sh $1 $2;;
							E|e) ./dataManipulation.sh $1 $2;;
							*) echo "Please Enter a Valid Option...!"
							esac
						 done
						 ;;
					*) echo "Please Enter a Valid Option...!";;
					esac
				done
				fi
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