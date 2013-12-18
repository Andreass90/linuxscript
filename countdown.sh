#!/bin/bash
Tal1="100"
Tal2="10"
read -p "Skriv ett nummer mellan 10 och 100 " Nummer
if [ $Nummer -lt "$Tal2" ]; then
echo "Wrong number"
elif [ $Nummer -gt "$Tal1" ]; then
echo "Wrong number"
else
until [ "$Nummer" -eq 0 ] ; do
	echo "Countdown: $Nummer"
Nummer=$[Nummer -1]
done
fi
exit 0
