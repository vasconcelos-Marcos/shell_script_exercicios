#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_total_h=$(free -h | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
memoria_consumida_h=$(free -h | grep -i mem | awk '{ print $3 }')
porcentagem=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1 }')

if [ $porcentagem -gt 65 ]
then
mail -s "Consumo de memoria acima do limite" vasconcelmarcos@gmail.com<<del
O consumo de memoria esta acima do limite que foi especificado. Atualmente o consumo e de $memoria_consumida_h
del
fi
