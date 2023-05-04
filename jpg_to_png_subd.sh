#!/bin/bash

converte_image(){
	local caminho_imagem=$1
	local nome_imagem=$(ls $caminho_imagem | awk -F. '{print $1}')
	
	convert $nome_imagem.jpg $nome_imagem.png
}

varrer_diretorio(){
	cd $1
	for arquivo in *
	do
		local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)
		if [ -d $caminho_arquivo ]
		then
			varrer_diretorio $caminho_arquivo
		else
			converte_image $caminho_arquivo
		fi
	done
}

varrer_diretorio $1
if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso"
else
	echo "Houve um problema na conversão"
fi
