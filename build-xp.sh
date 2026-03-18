#!/bin/bash

# A script to download the layers config locally and package them in the metadata artifact

targetPath=eap-xp-7.0/src/main/resources/eap-xp-glow-metadata/layers-configuration
mkdir -p $targetPath

# Generate the sources.

cd layers-config-gen;mvn clean install -Dorg.jboss.eap.xp.metadata;cd ..
cp -r layers-config-gen/target/eap-xp/metadata/layers-configuration/* $targetPath

# Build the metadata
cd eap-xp-7.0;mvn clean install;cd ..
echo "Done, check that new files have been added, use git to add them"
