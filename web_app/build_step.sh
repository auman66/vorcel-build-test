#!/bin/bash

# echo "VERCEL_GIT_COMMIT_REF: $VERCEL_GIT_COMMIT_REF"

# Always build if it's a web dev or staging branch
if [[ "$VERCEL_GIT_COMMIT_REF" == "web-dev" || "$VERCEL_GIT_COMMIT_REF" == "web-staging" ]] ; then
  # Proceed with the build
    echo "✅ - Build can proceed - Web Branch"
  exit 1;

# Build when there is a change to the web folder, unless the branch is main
elif [[ `git diff HEAD^ HEAD .`  && "$VERCEL_GIT_COMMIT_REF" != "main" ]]
    # Proceed with the build
    echo "✅ - Build can proceed - Change to web folder"
  exit 1;

elif [[ ]]
else
  # Don't build
  echo "🛑 - Build cancelled"
  exit 0;
fi

if [[ `git diff HEAD^ HEAD .` ]] ; then
    echo "✅ - Build can proceed 2"
    exit 1;

else
  # Don't build
  echo "🛑 - Build cancelled 2"
  exit 0;
fi