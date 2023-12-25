#!/bin/bash

echo "Ask the question\n"

if [ -z "$1" ]; then
  echo "Error: First argument is missing."
  exit 1
fi

if ! [[ "$1" =~ ^[a-zA-Z]+$ ]]; then
  echo "Error: First argument is not a valid string."
  exit 1
fi

REPO=$1

semgrep scan --config questions/ $REPO