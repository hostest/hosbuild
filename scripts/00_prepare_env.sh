#!/bin/sh
SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
HOME="`( cd .. && pwd )`"

cd "$HOME"/work
