#!/bin/bash
echo  'Please enter [ column name ]  and [ datatype ] (String | Integer) [ Primary Key or NOT ] [ primary | " " ]'
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
                    echo "Column name must be UNIQUE"
            else
                echo "$columnName:$dataType:$keyType" >> Databases/$1/.metaDataOf$2
            fi
        else
            echo "Wrong Key !!!"
            ./addingColumn.sh
        fi
    else
        echo "Wrong DataType !!!"
        ./addingColumn.sh
    fi
else
    echo "Wrong Column Name use a-zA-Z characters Only"
    ./addingColumn.sh
fi
