#!/bin/sh

cabal info $1 | awk -k getModules.awk | sed 's/ //g'
