#!/bin/bash

cd ~/apache-log

if [ -z $1 ]
then
	while [ -z $requisicao ]
	do
		read -p "Parametro ausente (GET,PUT,POST,DELETE): " requisicao
		metodo=$(echo $requisicao | awk '{print toupper($1)}')
	done
else
	metodo=$(echo $1 | awk '{print toupper($1)}')
fi


case $metodo in
	GET)
	cat apache.log | grep GET
	;;
	POST)
	cat apache.log | grep POST
	;;
	PUT)
	cat apache.log | grep PUT
	;;
	DELETE)
	cat apache.log | grep DELETE
	;;
	*)
	echo "parametro invalido"
	;;
esac
