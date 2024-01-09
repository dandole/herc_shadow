#!/bin/bash

for file in "${@:1}"; do
	if [ -f "$file" ]; then
		Status="$(dasdls "$file" 2>/dev/null | grep 'CCKD64\|CCKD\|CKD64\|CKD')";
		if [ "$Status" != "" ]; then
			CCKD64="$(echo "$Status" | grep 'CCKD64')";
			if [ "$CCKD64" != "" ]; then
				echo "     $file" already CCKD64
			else
				backup="$file".bak
				cmd="mv $file $backup"
				eval "$cmd"
				cmd="ckd2cckd64 -q $backup $file"
				eval "$cmd"
			fi
		else
			echo "     $file" not a DASD.
		fi
	else
		echo "     $file" is a directory.
	fi
done;
