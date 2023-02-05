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
				echo "*********************** Data Definition [Adding Column] *************************"
				
				if [[ -f Databases/$1/.metaDataOf$2 ]]
				then
					echo  'Please enter [ column name ]=>(numbers not valid)  and [ datatype ]=>(String | Integer) [ Primary Key or NOT ]=>( Primary | " ")'
                    read columnName dataType keyType

                    if [[ $columnName =~ ^[a-zA-Z]+$ ]]
                    then
                        if [[ $dataType =~ "String" ]] || [[ $dataType =~ "Integer" ]]
                        then 
                            if [[ $keyType = "Primary" ]] || [[ $keyType = ""  ]]
                            then
                            echo  
                                if [[ `grep "$columnName" "./Databases/$1/.metaDataOf$2" | wc -l` = 1 ]]
                                then
                                    echo "=================================================="
                                    echo "This Column Already Exists...!"
                                    echo "=================================================="
                                    echo "Do U Want To Retype OR Exit?"
                                    select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                                    do
                                        case $REPLY in
                                        Y|y) ./addingColumn.sh $1 $2;;
                                        E|e) ./dataManipulation.sh $1 $2;;
                                        *) echo "Please Enter a Valid Option...!";;
                                        esac
                                    done
                                else
                                    echo "$columnName:$dataType:$keyType" >> Databases/$1/.metaDataOf$2
                                    echo "=================================================="
                                    echo "Data Written To MetaData File Successflly."
                                    echo "=================================================="
                                    select item in "Enter (E) to Exit"
                                    do
                                        case $REPLY in
                                        E|e) ./dataManipulation.sh $1 $2;;
                                        *) echo "Please Enter a Valid Option...!";;
                                        esac
                                    done
                                fi
                            else
                                echo "=================================================="
                                echo "Invalid KeyType, Must be (Primary) OR (Nothing)...!"
                                echo "=================================================="
                                echo "Do U Want To Retype OR Exit?"
                                select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                                do
                                    case $REPLY in
                                    Y|y) ./addingColumn.sh $1 $2;;
                                    E|e) ./dataManipulation.sh $1 $2;;
                                    *) echo "Please Enter a Valid Option...!";;
                                    esac
                                done
                            fi
                        else
                            echo "=================================================="
                            echo "Invalid DataType, Must be (String) OR (Integer)...!"
                            echo "=================================================="
                            echo "Do U Want To Retype OR Exit?"
                            select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                            do
                                case $REPLY in
                                Y|y) ./addingColumn.sh $1 $2;;
                                E|e) ./dataManipulation.sh $1 $2;;
                                *) echo "Please Enter a Valid Option...!";;
                                esac
                            done
                        fi
                    else
                        echo "=================================================="
                        echo "Invalid ColmnName, Must Consists of Characters Only [a-zA-Z]...!"
                        echo "=================================================="
                        echo "Do U Want To Retype OR Exit?"
                        select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                        do
                            case $REPLY in
                            Y|y) ./addingColumn.sh $1 $2;;
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
							*) echo "Please Enter a Valid Option...!";;
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





# echo "******************** Tables Operations *********************"
	# if [[ -f Databases/$1/$2 ]]
	# then
		
	# else
	# 	echo "NO Table With this name EXISTS"
	# fi





















#!/bin/bash

