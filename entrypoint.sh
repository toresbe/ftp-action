#!/bin/sh -l

lftp -v $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-allow $INPUT_ALLOWSSL; set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false; mirror --reverse --continue --dereference -x ^\.git/$ $INPUT_LOCALDIR $INPUT_REMOTEDIR; quit"
