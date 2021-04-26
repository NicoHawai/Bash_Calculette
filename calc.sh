#!/bin/bash

re="^[0-9]+$"

echo " "
echo "================================"
echo " Welcome to calc V1.0 (integer) "
echo "================================"
echo " "

# === FIRST Number ===
while [ "$OUT" != "ok" ]; do

	read -p "Put your first number : " first
	if [[ "$first" =~ $re ]]
	then
		OUT="ok"
	else
		echo "/!\ Not a number, try again "
	fi
done
OUT=nok

# === OPERATOR ===
while [ "$OUT" != "ok" ]; do
	read -p "Do you want to + - x / : " op

	if [[ "$op" == "+" || "$op" == "-" || "$op" == "x" || "$op" == "/" ]]
	then
		OUT="ok"
	else
		echo "/!\ try again : + - x or /"
	fi
done
OUT=nok

# === Second Number ===
while [ "$OUT" != "ok" ]; do

	read -p "Put your second number : " second
	if [[ "$second" =~ $re ]]
	then
		OUT="ok"
	else
		echo "/!\ Not a number, try again "
	fi
done
OUT=nok

echo " "
if [ "$op" == "+" ]
then 
	let "result=$first + $second"; echo "result = $result"
elif [ "$op" == "-" ]
then
	let "result=$first - $second"; echo "result = $result"
elif [ "$op" == "x" ]
then
	let "result=$first * $second"; echo "result = $result"
elif [ "$op" == "/" ]
then
	let "result=$first / $second"; echo "result = $result"
fi

echo "================================"
