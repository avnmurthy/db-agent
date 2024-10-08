#!/bin/bash

set -e

LAMBDA_DIR="../lambdas"
BUILD_DIR="../build"
DIST_DIR="$BUILD_DIR/dist"

# Cleanup the previous builds
rm -rf $DIST_DIR
mkdir -p $DIST_DIR

# Loop over each Lambda function and zip its content
for lambda in file-processor-lambda validation-lambda; do
    echo "Building $lambda..."
    cd "$LAMBDA_DIR/$lambda"
    tar -cvf "../$DIST_DIR/$lambda.zip" .
    echo "$lambda.zip has been created."
    cd -
done

echo "Build complete. The zip files are located in $DIST_DIR."
