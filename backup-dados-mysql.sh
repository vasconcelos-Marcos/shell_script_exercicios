#!/bin/bash

HOME_PATH=/home/srgio

cd $HOME_PATH

if [ ! -d backup ]
then
	mkdir backup
fi

mysqldump -u root $1 > $HOME_PATH/backup/$1.sql
if [ $? -eq 0 ]
then
	echo "backup bem sucedido"
else
	echo "backup mal sucedido"
fi
