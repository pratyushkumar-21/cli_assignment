#! /usr/bin/bash

read -p "enter article name to search : " QUERY

URL="https://en.wikipedia.org/w/api.php?action=opensearch&search=${QUERY}&namespace=0&format=json"
DATA=$(curl -s $URL | jq ".[3]")
LENGTH=$(echo $DATA | jq "length")

for ((i=0; i<$LENGTH; i++))
do
  echo $DATA | jq ".[$i]" >> link_sh.txt
done

echo "All link added to the file"
