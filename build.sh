#!/bin/bash

# A script to download the layers config locally and package them in the metadata artifact

targetPath=eap-8.2/src/main/resources/eap-glow-metadata/layers-configuration
mkdir -p $targetPath

# Generate the sources for EAP 8.2 EE 10, EE 11 and EAP XP 7.0

cd layers-config-gen;mvn clean install;cd ..
cp -r layers-config-gen/target/eap-8.2/metadata/layers-configuration/* $targetPath

# Build the metadata
cd eap-8.2;mvn clean install;cd ..

## EE 11

targetPath=eap-8.2-ee-11/src/main/resources/eap-glow-metadata/layers-configuration
mkdir -p $targetPath

echo "EE 11 metadata to $targetPath"

ls layers-config-gen/target/eap-8.2-ee-11/metadata/layers-configuration

cp -r layers-config-gen/target/eap-8.2-ee-11/metadata/layers-configuration/* $targetPath

# Build the metadata
cd eap-8.2-ee-11;mvn clean install;cd ..

## XP 7.0

targetPath=eap-xp-7.0/src/main/resources/eap-glow-metadata/layers-configuration
mkdir -p $targetPath

echo "EAP XP 7.0 metadata to $targetPath"

ls layers-config-gen/target/eap-xp-7.0/metadata/layers-configuration

cp -r layers-config-gen/target/eap-xp-7.0/metadata/layers-configuration/* $targetPath

# Build the metadata
cd eap-xp-7.0;mvn clean install;cd ..
echo "Done, check that new files have been added, use git to add them"