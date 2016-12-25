#!/bin/bash

find ./topojson -type f | while read file
do
    arr=( `echo $file | tr -s '/' ' '`)
    pref=${arr[2]}
    dir="topojson/"$pref

    basename=$(basename $file)
    if [ $basename = '.DS_Store' -o ! ${basename##*.} = 'topojson' ]; then
      continue
    fi

    name=( `echo $basename | sed -e "s/\.topojson//"`)
    echo $pref" - "$name

    # CREATE .json
    $(npm bin)/topomerge $name=$name -k d.id < topojson/$pref/$basename > topojson/$pref/$name.json

    # DELETE .topojson
    rm -rf topojson/$pref/$basename

done