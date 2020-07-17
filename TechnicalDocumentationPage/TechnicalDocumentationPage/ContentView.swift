//
//  ContentView.swift
//  TechnicalDocumentationPage
//
//  Created by Jason Goodney on 7/15/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSafariView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Topic.examples, id: \.self) { topic in
                    NavigationLink(
                        destination: TopicView(topic: topic),
                        label: {
                            Text(topic.title)
                        })
                }
                
                Section(header: Text("Reference")) {
                    Group {
                        Text("All the documentation in this page is taken from ")
                        +
                        Text("MDN")
                            .foregroundColor(.blue)
                            .underline()
                    }
                    .onTapGesture {
                        self.showingSafariView = true
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("JS Documentation")
            .sheet(isPresented: $showingSafariView) {
                SafariView(url: URL(string: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide")!)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
