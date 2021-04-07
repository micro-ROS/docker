#!/bin/bash
set -e

if [ -z "$MICROROS_LIBRARY_FOLDER" ]
then
      export MICROROS_LIBRARY_FOLDER=microros_static_library
fi

exec /project/$MICROROS_LIBRARY_FOLDER/library_generation/library_generation.sh "$@"