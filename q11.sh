for file in $(find . -type f -name "L*.c")
do
	input=$(echo $file | cut -b 3-)
	prog_name=$(echo $input | cut -d'.' -f1)
	gcc -o $prog_name $input > /dev/null 2>&1
	if [ -f $prog_name ]
	then
		result=$(./$prog_name)
		if [ $result -eq 20 ]
		then
			ans=10
		else
			ans=7
		fi
	else
 		ans=5
	fi

	printf "%s %s\n" $input $ans
done
