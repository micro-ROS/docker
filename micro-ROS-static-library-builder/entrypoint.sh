#!/bin/bash
set -e

if [ -z "$MICROROS_LIBRARY_FOLDER" ]
then
      export MICROROS_LIBRARY_FOLDER=microros_static_library
fi

GENERATION_SCRIPT=/project/$MICROROS_LIBRARY_FOLDER/library_generation/library_generation.sh

# Convert bash script docker to unix for Windows users
dos2unix $GENERATION_SCRIPT

exec $GENERATION_SCRIPT "$@"