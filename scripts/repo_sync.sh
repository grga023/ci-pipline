#!/bin/bash
set -e

SYNC_MODE=$1
echo "Syncing repo in mode: $SYNC_MODE"

if [ "$SYNC_MODE" = "full" ]; then
    git pull --rebase
else
    git fetch
fi
