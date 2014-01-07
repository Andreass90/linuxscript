#!/bin/bash
if [ $EUID -ne 0 ]; then
echo "Du måste vara root för att kunna installera program"
exit 1
fi
	dialog --backtitle "Debian dpkg installer" --title "Vill du köra skriptet?" --yesno "Vill du köra scriptet som installerar dpkgfiler?" 10 60
if [ $? -eq 0 ]; then
	dialog --menu "Välj vad du vill göra" 10 60 2 Installera "Installera paket" Installerade "Kolla vilka du har installerarade" 2> /tmp/dpkg
Val=`cat /tmp/dpkg`
else
	dialog --backtitle "Då avslutar vi" --msgbox "Då avslutar vi" 10 60
clear
exit 0
fi
#om valet är installera så ska den
	if [ $Val = Installera ]; then
	dialog --checklist "Välj flaggor" 10 60 2 -i "installera" off  -r "ta bort" off  2> /tmp/dpkg1 
	dialog --inputbox "Paketnamn" 10 60
	find / -name $Paketnamn*.deb 1> /tmp/testing 2> /dev/null
Val2=`cat /tmp/testing`
	sed 's/"//g' /tmp/dpkg1 > /tmp/dpkg2
Val3=`cat /tmp/dpkg2`
	dpkg $Val3 $Val2 &> ~/programlogg
dialog --backtitle "Det gick bra" --msgbox "Det sparades en logg på installationen i ~/." 10 60 #här vill jag ha en ja/nej men går inte utan en ifsats till?
dialog --textbox ~/programlogg 20 100 
elif [ $Val = Installerade ]; then
dpkg -l 1> /tmp/lista
dialog --textbox /tmp/lista 40 200
fi
clear
exit 0
