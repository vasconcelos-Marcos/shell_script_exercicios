#!/bin/bash

RESTORE_PATH=/home/srgio/restore_mutillidae_amazon
aws s3 sync s3://curso-shell-script/$(date +%F) $RESTORE_PATH

cd $RESTORE_PATH
if [ -f $1.sql ]
then
	mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "o restore foi realizado com sucesso"
	fi
else
	echo "o arquivo procurado nao existe no diretorio"
fi
