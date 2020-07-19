//
//  EditorView.swift
//  MarkdownPreviewer
//
//  Created by Jason Goodney on 7/18/20.
//

import SwiftUI

struct EditorView: View {
    @ObservedObject var store: MarkdownStore
    
    @State private var selectedRow = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    SelectionRow(title: "fCC Markdown Previewer Sample", isSelected: selectedRow == 0) {
                        selectedRow = 0
                        store.markdown = Examples.fCCMarkdownPreviewerSample.markdown
                    }
                    
                    SelectionRow(title: "fCC GitHub Markdown", isSelected: selectedRow == 1) {
                        selectedRow = 1
                        store.markdown = Examples.fCCGitHub.markdown
                    }
                    
                    SelectionRow(title: "Custom Markdown", isSelected: selectedRow == 2) {
                        selectedRow = 2
                        store.markdown = "# Hello, World!"
                    }
                    
                    Section {
                        TextEditor(text: $store.markdown)
                    }
                    .frame(height: 550)
                }
                
                
                    
                
            }
            .navigationBarTitle("Editor", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done", action: {
                presentationMode.wrappedValue.dismiss()
            }))
            
        }
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView(store: MarkdownStore())
            
    }
}
