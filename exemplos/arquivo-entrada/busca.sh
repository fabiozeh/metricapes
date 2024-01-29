#!/bin/env bash
# Procura por trabalhos da USP relacionados ao termo "Processamento de Linguagem Natural" em todos os campi e institutos, identificados no arquivo de entrada usp.json

../../metricapes -x -i usp.json "Processamento de Linguagem Natural" > nlp.tsv

F=$(../../contagem -v nlp.tsv | awk -F: 'NR==2 {x=$2} NR==3{ld=$2} END{print (x - ld)}')
if [ $F -gt 0 ]
then
    echo Os dados extras de $F trabalhos não puderam ser carregados. Tentando completar...
    ../../completa nlp.tsv > nlp-comp.tsv
    rm nlp.tsv
    mv nlp-comp.tsv nlp.tsv
else
    echo Dados carregados com sucesso.
fi
