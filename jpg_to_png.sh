#!/bin/bash

converte_imagem(){
cd ~/Downloads/imagens-livros

if [ ! -d png ]
then
	mkdir png
fi

for imagem in *.jpg
do
	local nome_imagem=$(ls $imagem | awk -F. '{print $1}')
	convert $nome_imagem.jpg png/$nome_imagem.png
done
}

converte_imagem 2>erros_conversao.txt
if [ $? -eq 0 ]
then
	echo "Conversao realizada com sucesso"
else
	echo "Houve uma falha no processo"
fi
