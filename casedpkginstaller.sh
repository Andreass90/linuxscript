#!/bin/bash

function run1 {	
	dialog --backtitle "Debian dpkg installer" --title "Vill du köra skriptet?" --yesno "Vill du köra scriptet som installerar dpkgfiler?" 10 60
}


function run2 {
	dialog --menu "Välj vad du vill göra" 10 60 2 Installera "Installera paket" Installerade "Kolla vilka du har installerarade" 2> /tmp/dpkg
	Val=`cat /tmp/dpkg` 
}

function run3 {
	dialog --backtitle "Då avslutar vi" --msgbox "Då avslutar vi" 10 60
	clear
	exit 0
}

function install {
	dialog --checklist "Välj flaggor , Det flesta flaggor kräver att du använder -i som är installera" 20 100 3 -i "installera" on -G "Installera inte programmet om det redan finns en nyare version" off -E "Installerar inte om samma version finns" on 2> /tmp/dpkg1 
	if [ $? = 1 ]; then
	run3
fi
	dialog  --inputbox "Paketnamn" 10 60 2> /tmp/testing2
	Testing2=`cat /tmp/testing2`
	find / -name $Testing2*.deb 1> /tmp/testing
	Val2=`cat /tmp/testing`
	sed 's/"//g' /tmp/dpkg1 > /tmp/dpkg2
	Val3=`cat /tmp/dpkg2`
	dpkg $Val3 $Val2 1> /tmp/programlogg 2> /tmp/logg2
}

function installed {	
	dpkg -l | awk '{ print $2 }' | tail -f -n +7|nl > /tmp/lista
	dialog --title "Installerade program"  --textbox /tmp/lista 40 200
}


function close {
	Filen=`cat /tmp/programlogg`
	if [ -s $Filen ]; then
	dialog --msgbox "Hittade inga program med det namnet eller så har du redan det installerat" 10 60
	else
	dialog --title "Installationen gick bra" --textbox /tmp/programlogg 20 100
	fi
}

function clean {
	sudo rm -f /tmp/*
	clear
}

function cancel {
	clear
	exit 0
}


	if [ $EUID -ne 0 ]; then
	dialog --msgbox "Du måste tyvärr vara root för att köra detta program" 10 60
	cancel
	else 
	run1
	fi
	if [ $? = 0 ]; then
	run2
	elif [ $? = 1 ]; then
	run3
	fi
	if [ $Val = Installera ]; then 
	install
	close
	elif [ $Val = Installerade ]; then
	installed
	else
	run3
	fi
	clean
	exit 0
