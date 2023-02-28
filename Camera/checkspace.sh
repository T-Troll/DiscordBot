#!/bin/sh
# checking video space, remove old if needed
while
	used=`du -a -m -c $1 | tail -n 1 | awk -F '\t' '{print $1}'`;
	[[ $used -gt 90000 ]]
do
	oldfile=`ls -1 -A -t $1/*.h265 | tail -n 1`
	echo Removing old $oldfile
	rm $oldfile
done
#echo Space OK
