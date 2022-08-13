#!/bin/bash

FILE=$1

if [ $# = 0 ]; then 
  echo "Please add a name to your project. Example: $ bin/generate <PROJECT_NAME>"
  exit 1
fi

# Generate project.yml
bin/generate-project.sh "$FILE"
## Generate example app resources
bin/generate-project-resources.sh "$FILE"
## Generate example app sources
bin/generate-project-sources.sh "$FILE"

# Generate .package
cd "$FILE"
swift package init --type library
swift build

# Generate xcode project
xcodegen

# Art by Joan G. Stark
cat << "EOF"
          .:' Done!
      __ :'__
   .'`__`-'__``.
  :__________.-'
  :_________:
   :_________\`-;
jgs \`.__.-.__.'
EOF