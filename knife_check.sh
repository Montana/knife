#!/bin/bash

if ! command -v chef >/dev/null 2>&1; then
  echo "Chef is not installed. Please install Chef before running this script."
  exit 1
fi

if [ -d ~/.chef ]; then
  echo "Knife is already initialized in this system."
  exit 0
fi

echo "Initializing Knife..."
knife configure -i

if [ $? -eq 0 ]; then
  echo "Knife has been successfully initialized."
else
  echo "Knife initialization failed."
fi
