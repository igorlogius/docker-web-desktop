#!/bin/bash
source env.sh
docker run -u 0 --rm --name $TAGNAME -p$WEBPORT:8080 $TAGNAME
