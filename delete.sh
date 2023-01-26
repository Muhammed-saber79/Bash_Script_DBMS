#!/bin/bash
echo "Please enter condition [Column] and [Value] "
read columnName columnValue

if [[ `grep -n $columnName ./Databases/$1/.metaDataOf$2 | wc -l` = 1 ]]
then
    let fieldNumber
#     awk -F',' '/17687/ {
#     for (f = 0; f < NF; ++f) {
#         if ($f == "17687") {
#             print $f " found in field number " f " of " NF " on line " NR "."
#         }
#     }
# }
#    awk  -v columnValue=$columnValue '{for (i=0;i<NF;i++)
#    {
#	echo  $i
#     if($columnValue == $i)
#     then
#        fieldNumber=$i
#     fi
#
#    }}' ./Databases/$1/$2
#	echo  `grep -n $columnName ./Databases/$1/.metaDataOf$2 | cut -f 1 -d: ` 
#	echo $fieldNumber
#   if [[ fieldNumber = `grep -n $columnName ./Databases/$1/.metaDataOf$2 | cut -f 1 -d: ` ]]
 ###   then
#    echo "HHHHHHHHHHH"
        let rowNumber=`grep -n "$columnValue" ./Databases/$1/$2 | wc -l`
        sed '${rowNumber}d' ./Databases/$1/$2 
        sed '${columnNumber}d' ./Databases/$1/.metaDataOf$2
 #   else
#        echo "NO column with this value EXISTS!!!"
 #   fi
else
    echo "No Column With this name EXISTS!!!"
fi
