#!/bin/sh

find . -name "*.json" -exec sh -c 'mapshaper {} -filter-islands min-area=3400000 min-vertices=200 remove-empty -simplify 15% -o force {}' \;

