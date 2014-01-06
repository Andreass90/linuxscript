#!/bin/bash
function plus {
Sum=$[ $1+$2 ]
echo "$1+$2=$Sum"
}
function minus {
Diff=$[ $1-$2 ]
echo "$1-$2=$Diff"
}
function Kvot {
Kvot=$[ $1/$2 ]
echo "$1/$2=$Kvot"
}
function Add {
Add=$[ $1*$2 ]
echo "$1*$2=$Add"
}
read -p "Mata in två tal " Tal1 Tal2
if [ -z $Tal1 ]; then 
echo "Du måste mata in två tal"
elif [ -z $Tal2 ]; then
echo "Du måste mata in två tal"
exit 1
fi 
if ! [ $Tal1 -eq $Tal1 &> /dev/null ]; then
echo "Bara siffror tack"
elif ! [ $Tal2 -eq $Tal2 &> /dev/null ]; then
echo "Bara siffor tack"
else
plus $Tal1 $Tal2
minus $Tal1 $Tal2
Kvot $Tal1 $Tal2
Add $Tal1 $Tal2
fi
exit 0
