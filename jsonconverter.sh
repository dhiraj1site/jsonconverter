#!/bin/bash

#This bash utility converts a string of text to json, having a value of null

if [ $# -ne 2 ]
then
	echo "Error. First argument <inputfile> Second argument <outputfile>"
exit 
fi

>$2

cat $1 | head -n -1 | while read line
do
	echo "{\"$line\": null, " >> $2
done

cat $1 | tail -n 1 | while read line
do
	echo "\"$line\": null }" >> $2
done

echo "Successfully converted and outputed to $2.txt"
