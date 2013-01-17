#!/bin/bash

output_dir=/path/to/watch
cuckoo_dir=/path/to/cuckoo

# simple example of how to do some interim processing
if [[ -f $1 ]]; then
	if 7z l $1 | egrep -q "^Type = (7z|zip)"; then
		ending=`echo ${1%%.*} | awk '{print substr($0,length,1)}'`
		passwords=("infected")
		for pass in "${passwords[@]}"; do
			#7z will extract non-pw protected archives if a password is supplied
			7z e -y -o$output_dir -p$pass $1
			if [[ $? -eq 0 ]]; then
				break
			fi
			rm $1 &>/dev/null
		done
	#implement other tasks such as pffexport here
	else
		# check to see if the file has any size and if it doesn't just delete it
		if [[ -s $1 ]]; then
			cd $cuckoo_dir && python submit.py $1
		else
			rm $1 &>/dev/null
		fi
	fi
fi

