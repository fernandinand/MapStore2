#!/bin/sh
# -----------------------------------------------------------------------------
# Start Script for MapStore2
#
# $Id$
# -----------------------------------------------------------------------------

# Make sure catalina scripts are executable
chmod +x bin/*.sh

echo "Welcome to MapStore2 demo package!"

# if not told otherwise pump up the permgen
if [ -z "$JAVA_OPTS" ]; then
  export JAVA_OPTS="-XX:MaxPermSize=128m"
fi 

PRGDIR=`pwd`
EXECUTABLE=startup.sh
CATALINA_HOME="$PRGDIR"

if [ ! -x "$CATALINA_HOME"/bin/"$EXECUTABLE" ]; then
  echo "Cannot find $PRGDIR/$EXECUTABLE"
  echo "The file is absent or does not have execute permission"
  echo "This file is needed to run this program"
  exit 1
fi

sh "$CATALINA_HOME"/bin/"$EXECUTABLE" start "$@"
echo "Waiting for Tomcat start and MapStore2 deploy..."
sleep 4
echo "Point you browser to: http://localhost:8800/mapstore"
sleep 1
echo "Enjoy MapStore2!"
