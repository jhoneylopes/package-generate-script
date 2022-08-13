#!/bin/bash

FILE=$1

if [ $# = 0 ]; then 
  echo "Please add a name to your project. Example: $ bin/generate <PROJECT_NAME>"
  exit 1
fi

mkdir $FILE
cd $FILE

mkdir "$FILE"ExampleApp
mkdir "$FILE"ExampleApp/"$FILE"ExampleAppTests ; touch "$FILE"ExampleApp/"$FILE"ExampleAppTests/ExampleAppTestsDummy.swift
mkdir "$FILE"ExampleApp/"$FILE"ExampleAppUITests ; touch "$FILE"ExampleApp/"$FILE"ExampleAppUITests/ExampleAppUITestsDummy.swift

filelowername=$(echo $FILE | tr '[:upper:]' '[:lower:]')
iosVersion="15.0"

echo " # Copyleft Jhoney Lopes. All Wrongs Reserved.

name: "$FILE"

createIntermediateGroups: true

options:
  bundleIdPrefix: com."$filelowername".jhlopes
  deploymentTarget:
    iOS: $iosVersion

packages:
  "$FILE":
    path: "./"

targets:  
  
  "$FILE"ExampleApp:
    type: application
    platform: iOS
    deploymentTarget: "15.0"    
    sources:
      - path: "$FILE"ExampleApp
    scheme:
      testTargets:
      - "$FILE"ExampleAppTests
      - "$FILE"ExampleAppUITests
      randomExecutionOrder: true
    settings:
      base:
        INFOPLIST_FILE: "$FILE"ExampleApp/Resources/Info.plist
      configs:
        debug: debug           
        release: release
    dependencies:
      - package: "$FILE"
  
  "$FILE"ExampleAppTests:
    type: bundle.unit-test
    platform: iOS  
    sources:
      - "$FILE"ExampleApp/"$FILE"ExampleAppTests
    dependencies:
      - target: "$FILE"ExampleApp
      - package: "$FILE"

  "$FILE"ExampleAppUITests:
    type: bundle.ui-testing
    platform: iOS  
    sources:
      - path: "$FILE"ExampleApp/"$FILE"ExampleAppUITests
" > project.yml

echo 'Project has been created'