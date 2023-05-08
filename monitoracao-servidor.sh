#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
if [ $resposta_http -ne 200 ]
then
	echo 'Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo web.'| mail -s 'Problema no servidor' vasconcelmarcos@gmail.com
	systemctl restart apache2
fi
