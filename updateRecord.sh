#!/bin/bash
databaseName=$1
tableName=$2
echo "Enter Condition [ Column Name ] And [ Column Value ] "
read conditionColumnName conditionColumnValue
if [[ `grep -n $conditionColumnName ./Databases/$databaseName/.metaDataOf$tableName | wc -l` = 1 ]]
then
    conditionColumnNumber=$(awk -F: '{print NR,$0}' ./Databases/$databaseName/.metaDataOf$tableName | grep "$conditionColumnName" | cut -d " " -f1)
    conditionValueFieldNumber=$(awk -F" "  -v columnValue=$conditionColumnValue '{ for(i = 1 ; i <= NF ; i++){ if( $i == columnValue) print i} }' ./Databases/$databaseName/$tableName)
    if [[ $conditionColumnNumber = $conditionValueFieldNumber ]]
    then
        recordNumber=$(awk '{print NR,$0}' ./Databases/$databaseName/$tableName | grep "$conditionColumnValue" | cut -d " " -f1)
        echo "ENTER THE NEW VALUES FOR THE RECORD"
        read inputArray
        declare -i arrayLength=0;
        for input in ${inputArray[@]};
        do
            arrayLength=$(( arrayLength + 1 ));
        done
        numberOfColumn=$(wc -l ./Databases/$databaseName/.metaDataOf$tableName | awk '{print $1}')
        numberOfColumn=$(( numberOfColumn + 1 ))
        if [[ $numberOfColumn = $arrayLength ]]
        then
            echo $recordNumber
            lineToUpdate=$(cat ./Databases/$databaseName/$tableName |head "-$recordNumber" | tail -1);
            echo $lineToUpdate
            sed -i "s/$lineToUpdate/${inputArray[@]}/g" ./Databases/$databaseName/$tableName;
        else
            echo "NUMBER OF INPUTS MUST BE THE SAME NUMBER OF COLUMN"
        fi
    else
        echo "NO COLUMN WITH MATCHING VALUE!!!"
    fi
else
    echo "NO COLUMN WITH THIS NAME EXISTS!!!"
fi