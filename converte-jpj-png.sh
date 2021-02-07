#!/bin/bash

converter(){
    cd imagens-livros/

    mkdir -p png

    for image in *.jpg
    do
        local image_sem_extensao=$(ls $image | awk -F. '{ print $1 }')
        echo $image_sem_extensao

        convert $image_sem_extensao.jpg png/$image_sem_extensao.png
    done
}

converter 2 > erros.txt

if [ $? -eq 0 ]
then
    echo "conversão realizada com sucesso"
else
    echo "falha ao realizar conversão"
fi
