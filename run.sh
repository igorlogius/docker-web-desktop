#!/bin/bash

source env.sh

docker run -u 0 --rm --name $TAGNAME -p$HTTPPORT:6080 -p$VNCPORT:5900 $TAGNAME
