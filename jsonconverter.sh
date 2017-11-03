#!/bin/bash

#This bash utility converts a string of text to json, having a value of null

#If incorrect argument numbers supplied
if [ $# -ne 2 ]
then
	echo "Error. First argument <inputfile> Second argument <outputfile>"
exit 
fi

#Empty the contents of the output file
>$2

#Copy the contents of new file and echo is to the second file
cat $1 | head -n -1 | while read line
do
	echo "{\"$line\": null, " >> $2
done

#Additional echo to close the JSON format at the end of line
cat $1 | tail -n 1 | while read line
do
	echo "\"$line\": null }" >> $2
done

echo "Successfully converted and outputed to $2.txt"
