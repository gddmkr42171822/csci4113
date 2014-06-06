#!/usr/bin/env bash
# This sends an email to an email acount if the percentage of disk used is 80% or above.
diskused=$(df | tr -s " " | cut -d" " -f5 | head -n 2 | tail -n 1 | cut -d% -f1)
if [ $diskused -ge "80" ]
then
	echo "WARNING: Space utilization is at $diskused%" | mail -s "Space Usage WARNING" <email account here>
fi
