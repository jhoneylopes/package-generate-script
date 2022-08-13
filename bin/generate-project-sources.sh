#!/bin/bash

FILE=$1

if [ $# = 0 ]; then
  echo "Please add a name to your project. Example: $ bin/generate <PROJECT_NAME>"
  exit 1
fi

cd $FILE

mkdir "$FILE"ExampleApp/Sources

echo "// Copyleft Jhoney Lopes. All Wrongs Reserved.

import SwiftUI
import "$FILE"

struct ContentView: View {
    var body: some View {
        Text($FILE().text)
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
" > "$FILE"ExampleApp/Sources/ContentView.swift

echo "// Copyleft Jhoney Lopes. All Wrongs Reserved.

import SwiftUI

@main
struct "$FILE"ExampleApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
" > "$FILE"ExampleApp/Sources/"$FILE"ExampleApp.swift

echo 'Sources has been created'
