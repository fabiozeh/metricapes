#!/bin/env bash

mkdir buscas
../../metricapes  -l buscas/1.err -d 2020 "sustent* + agronegócio" > buscas/1.tsv
../../metricapes  -l buscas/2.err -d 2020 "sustent* + agrícola" > buscas/2.tsv
../../metricapes  -l buscas/3.err -d 2020 "sustent* + agricultura" > buscas/3.tsv

echo "Totais esperados:"
../../metricapes -d 2020 -e "sustent* + agronegócio" | awk '{t=$2} END{print "agronegócio " t}'
../../metricapes -d 2020 -e "sustent* + agrícola"    | awk '{t=$2} END{print "agrícola    " t}'
../../metricapes -d 2020 -e "sustent* + agricultura" | awk '{t=$2} END{print "agricultura " t}'

echo "Totais obtidos:"
../../contagem buscas/1.tsv | xargs echo "agronegócio "
../../contagem buscas/2.tsv | xargs echo "agrícola    "
../../contagem buscas/3.tsv | xargs echo "agricultura "

../../uniao buscas/*.tsv > susten.tsv
