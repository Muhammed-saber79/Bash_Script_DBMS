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
				echo "*********************** Data Maniplation [Update Data] *************************"
				
				if [[ -f Databases/$1/.metaDataOf$2 ]]
				then

                    echo "Enter Condition Update [ Column Name ] And [ Column Value ] "
                    read conditionColumnName conditionColumnValue
                    if [[ `grep -n $conditionColumnName Databases/$1/.metaDataOf$2 | wc -l` = 1 ]]
                    then
                        # conditionColumnNumber=$(awk -F: '{print NR}' Databases/$1/.metaDataOf$2 | grep "$conditionColumnName" | cut -d " " -f1)
                        # conditionValueFieldNumber=$(awk -F" "  -v columnValue=$conditionColumnValue '{ for(i = 1 ; i <= NF ; i++){ if( $i == columnValue) print i} }' ./Databases/$1/$2)
                        # echo $conditionColumnNumber + "fdg"
                        # echo $conditionValueFieldNumber 
                        

                        conditionColumnNumber=$(awk -F: '{print NR,$0}' ./Databases/$1/.metaDataOf$2 | grep "$conditionColumnName" | cut -d " " -f1)
                        conditionValueFieldNumber=$(awk -F" "  -v columnValue=$conditionColumnValue '{ for(i = 1 ; i <= NF ; i++){ if( $i == columnValue) print i} }' ./Databases/$1/$2)
                        # echo $conditionColumnNumber
                        # echo $conditionValueFieldNumber 


                        if [[ $conditionValueFieldNumber = $conditionColumnNumber ]]
                        then
                            recordNumber=$(awk '{print NR,$0}' Databases/$1/$2 | grep "$conditionColumnValue" | cut -d " " -f1)
                            echo "ENTER THE NEW VALUES FOR THE RECORD [with the same number of fields]"
                            read inputArray
                            declare -i arrayLength=0;
                            for input in ${inputArray[@]};
                            do
                                arrayLength=$(( arrayLength + 1 ));
                            done

                            # echo $arrayLength
                            numberOfColumn=$(wc -l Databases/$1/.metaDataOf$2 | awk '{print $1}')
                            # numberOfColumn=$(( numberOfColumn + 1 ))
                            # echo $numberOfColumn
                            if [[ $numberOfColumn = $arrayLength ]]
                            then
                                # echo $recordNumber
                                lineToUpdate=$(cat Databases/$1/$2 |head "-$recordNumber" | tail -1);
                                # echo $lineToUpdate


                                sed -i "s/$lineToUpdate/${inputArray[@]}/g" ./Databases/$1/$2;
                                echo "========================================"
                                echo "Record Updated Successfully."
                                echo "========================================"
                                echo "Do U Want To Update Another OR Exit?"
                                select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                                do
                                    case $REPLY in
                                    Y|y) ./updateRecord.sh $1 $2;;
                                    E|e) ./dataManipulation.sh $1 $2;;
                                    *) echo "Please Enter a Valid Option...!";;
                                    esac
                                done
                            else
                                echo "======================================================"
                                echo "NUMBER OF INPUTS MUST BE THE SAME NUMBER OF COLUMN...!"
                                echo "======================================================"
                                echo "Do U Want To Retype OR Exit?"
                                select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                                do
                                    case $REPLY in
                                    Y|y) ./updateRecord.sh $1 $2;;
                                    E|e) ./dataManipulation.sh $1 $2;;
                                    *) echo "Please Enter a Valid Option...!";;
                                    esac
                                done
                            fi
                        else
                            echo "========================================"
                            echo "No Such Value Exists...!"
                            echo "========================================"
                            echo "Do U Want To Delete Another OR Exit?"
                            select item in "Enter (Y) to Retype" "Enter (E) to Exit"
                            do
                                case $REPLY in
                                Y|y) ./updateRecord.sh $1 $2;;
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
                            Y|y) ./updateRecord.sh $1 $2;;
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