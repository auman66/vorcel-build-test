#!/bin/bash

# echo "VERCEL_GIT_COMMIT_REF: $VERCEL_GIT_COMMIT_REF"

echo "VERCEL": $VERCEL
echo "CI": $CI
echo "VERCEL_ENV": $VERCEL_ENV
echo "VERCEL_URL": $VERCEL_URL
echo "VERCEL_REGION": $VERCEL_REGION
echo "VERCEL_GIT_PROVIDER": $VERCEL_GIT_PROVIDER
echo "VERCEL_GIT_REPO_SLUG": $VERCEL_GIT_REPO_SLUG
echo "VERCEL_GIT_REPO_OWNER": $VERCEL_GIT_REPO_OWNER
echo "VERCEL_GIT_REPO_ID": $VERCEL_GIT_REPO_ID
echo "VERCEL_GIT_COMMIT_REF": $VERCEL_GIT_COMMIT_REF
echo "VERCEL_GIT_COMMIT_SHA": $VERCEL_GIT_COMMIT_SHA
echo "VERCEL_GIT_COMMIT_MESSAGE": $VERCEL_GIT_COMMIT_MESSAGE
echo "VERCEL_GIT_COMMIT_AUTHOR_LOGIN": $VERCEL_GIT_COMMIT_AUTHOR_LOGIN
echo "VERCEL_GIT_COMMIT_AUTHOR_NAME": $VERCEL_GIT_COMMIT_AUTHOR_NAME

# Always build if it's a web dev or staging branch
if [[ "$VERCEL_GIT_COMMIT_REF" == "web-dev" || "$VERCEL_GIT_COMMIT_REF" == "web-staging" ]] ; then
  # Proceed with the build
    echo "✅ - Build can proceed - Web Branch"
  exit 1;

# Build when there is a change to the web folder, unless the branch is main
elif [[ `git diff HEAD^ HEAD .`  && "$VERCEL_GIT_COMMIT_REF" != "main" ]] ; then
    # Proceed with the build
    echo "✅ - Build can proceed - Change to web folder"
  exit 1;

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