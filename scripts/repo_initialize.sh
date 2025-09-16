#!/bin/bash
set -e

BRANCH=$1
echo "Initializing repo on branch: $BRANCH"

git fetch origin "$BRANCH"
git checkout "$BRANCH"
