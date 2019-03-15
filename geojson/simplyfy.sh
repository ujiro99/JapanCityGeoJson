#!/bin/sh

find . -name "*.json" -exec sh -c 'mapshaper {} -filter-islands min-area=5000000 min-vertices=200 remove-empty -o force {}' \;
find . -name "*.json" -exec sh -c 'mapshaper {} -simplify 15% -o force {}' \;

