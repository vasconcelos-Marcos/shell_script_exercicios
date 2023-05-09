#!/bin/bash
BACKUP_PATH=/home/srgio/backup_mutillidae_amazon
cd $BACKUP_PATH
data=$(date +%F)
if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
	mysqldump -u root mutillidae $tabela > $BACKUP_PATH/$data/$tabela.sql
done

aws s3 sync $BACKUP_PATH s3://curso-shell-script
