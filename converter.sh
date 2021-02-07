#!/bin/bash

converter(){
    
    mkdir -p png
    mkdir -p jpg_converted

    cd jpg

    for image in *.jpg
    do
        local image_sem_extensao=$(ls $image | awk -F. '{ print $1 }')
        convert $image_sem_extensao.jpg ../png/$image_sem_extensao.png
        mv $image_sem_extensao.jpg ../jpg_converted/
    done
}

converter 2 > erros.txt

if [ $? -eq 0 ]
then
    echo "conversão realizada com sucesso"
else
    echo "falha ao realizar conversão"
fi
