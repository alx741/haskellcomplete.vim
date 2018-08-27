#!/bin/sh

packages=$(cat packages | sed 's/#.*//' | awk 'NF')

while read -r package; do
    ./getPackageModules.sh $package
done <<< "$packages"
