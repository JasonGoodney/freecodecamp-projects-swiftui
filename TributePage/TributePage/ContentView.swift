//
//  ContentView.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import SwiftUI

struct ContentView: View {
    
    let person = Person.example
    
    @State private var showingSafariView = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text(person.fullName)
                    .font(.largeTitle)
                    .bold()
                
                Text(person.description)
                    .font(.subheadline)
                
                RemoteImage(url: person.featureImage.imageURL)
                
                Text(person.featureImage.caption)
                    .font(.caption)
                    .padding(.horizontal)
                
                Rectangle()
                    .fill(Color.secondary)
                    .frame(height: 0.5)
                    .padding(.horizontal, 80)
                
                TimelineView(person: person)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(24)
                    .padding()
                    
                
                QuoteView(quote: person.quote)
                    .padding(.vertical)
                    .padding(.horizontal, 40)
                
                
                Group {
                    Text("If you have time, you should read more about this incredible human being on his ")
                    +
                    Text("Wikipedia entry")
                        .foregroundColor(.blue)
                        .underline()
                    +
                    Text(".")
                }
                .font(.headline)
                .padding()
                .foregroundColor(.black)
                .onTapGesture {
                    self.showingSafariView = true
                }
                
            }
        }
        .sheet(isPresented: $showingSafariView) {
            SafariView(url: URL(string: person.link)!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
