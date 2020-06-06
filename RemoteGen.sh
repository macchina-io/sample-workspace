#! /bin/bash
osname=`uname`
osarch=`uname -m`
$POCO_BASE/RemotingNG/RemoteGen/bin/$osname/$osarch/RemoteGenNG -DPOCO_BASE="$POCO_BASE" $*
