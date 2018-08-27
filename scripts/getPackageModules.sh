#!/bin/sh

cabal info $1 | awk -f getModules.awk | sed 's/ //g'
