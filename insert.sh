#!/bin/bash

if [[ -f Databases/$1/$2 ]]
then
    if [[ `wc -l ./Databases/$1/.metaDataOf$2` > 0 ]]
    then
	echo "Enter Table Data: [col1 col2 col3 ... etc]"
        read recordValues
	
	if [[ "$recordValues[0]" =~ ^[a-z]+$ ]]
	then 
		echo "First Value must be Integer One...!";
		
	else 
        	let inputLength
        	for val in ${recordValues[@]}
        	do
            		inputLength=$((inputLength+1))
        	done
		echo "***********************"
        	if [[ $inputLength = `wc -l ./Databases/$1/.metaDataOf$2 | cut -f 1 -d" "` ]]
        	then
            		echo "$recordValues" >> ./Databases/$1/$2
        	else
            		echo "Wrong Number Of Columns"
        	fi
	fi
    else
        echo "Add Some Columns First ..."
    fi
else
    echo "NO Table With this name EXISTS"
fi

