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
if [[ "$Tal1" != [0-99] ]] && [[ "$Tal2" != [0-99] ]]; then
echo "Du behöver två nummer"
else
plus $Tal1 $Tal2
minus $Tal1 $Tal2
Kvot $Tal1 $Tal2
Add $Tal1 $Tal2
fi
exit 0
