#!/usr/bin/env bash

#Runing directory always depends on which directory we run the script

echo "pwd: `pwd`"
echo "\$0: $0"
echo "basename: `basename -- "$0"`"
echo "dirname: `dirname -- "$0"`"
echo "dirname/readlink: $( dirname -- "$( readlink -f -- "$0"; )"; )"

# . current directory
# .. parent directory
# ~ current user home directory
# / root directory