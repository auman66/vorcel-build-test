#!/bin/bash

# Always build if it's a web dev or staging branch
if [[ "$VERCEL_GIT_COMMIT_REF" == "web-dev" || "$VERCEL_GIT_COMMIT_REF" == "web-staging" ]] ; then
  # Proceed with the build
    echo "✅ - Build can proceed on web branch"
  exit 1;

# Build when there is a change to the web folder, unless the branch is main
elif [[ `git diff HEAD^ HEAD .` ]] ; then
  #if on main, only proceed if build main is set to true
  if [[ "$VERCEL_GIT_COMMIT_REF" != "main" ]] ; then
    if [[ "$BUILD_MAIN" == "true" ]] ; then
      echo "✅ - Build can proceed on main"
      exit 1;
    else
      echo "🛑 - Build main not set to true"
      exit 0;
    fi
  fi
  # if not on main, build with any change to tbuild folder
  echo "✅ - Build can proceed - Change to web folder"
  exit 1;

else
  # Don't build
  echo "🛑 - Build cancelled"
  exit 0;
fi