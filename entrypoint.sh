#!/bin/sh -l

lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-allow $INPUT_ALLOWSSL; set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false; mirror --reverse --continue --verbose --dereference -x ^\.git/$ $INPUT_LOCALDIR $INPUT_REMOTEDIR --exclude-glob=static/art/**; quit"
lftp $INPUT_HOST -u $INPUT_USER,$INPUT_PASSWORD -e "set ftp:ssl-allow $INPUT_ALLOWSSL; set ftp:ssl-force $INPUT_FORCESSL; set ssl:verify-certificate false; mirror --reverse --continue --verbose --ignore-time --dereference -x ^\.git/$ $INPUT_LOCALDIR/static/art $INPUT_REMOTEDIR/static/art; quit"
