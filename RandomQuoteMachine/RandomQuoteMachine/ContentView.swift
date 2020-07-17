//
//  ContentView.swift
//  RandomQuoteMachine
//
//  Created by Jason Goodney on 7/16/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = QuoteStore()
    
    @State private var isLoading = false
    @State private var newQuote = Quote.example
    @State private var backgroundColor = Color.blue
    
    private let colors: [Color] = [.blue, .red, .yellow, .orange, .pink, .purple, .green]
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Random\nQuote\nMachine")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 60)
                    .shadow(radius: 10)

                Spacer()
            }
            .padding(.bottom, 100)

            VStack {
                if !isLoading {
                    QuoteCard(quote: $newQuote, primaryColor: $backgroundColor, actionHandler: {
                        withAnimation {
                            setNewQuote()
                            setNewColor()
                        }
                    })

                } else {
                    Text("Loading...")
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.vertical)
        .onAppear {
            loadQuotes()
            setNewQuote()
        }

    }
    
    func loadQuotes() {
        self.isLoading = true
        JSONHelper<[Quote]>.loadJson(filename: "quotes") { (result) in
            self.isLoading = false
            switch result {
            case .success(let quotes):
                self.store.quotes = quotes
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
    
    func setNewQuote() {
        let previous = newQuote
        
        repeat {
            newQuote = store.quotes.randomElement() ?? Quote.example
        } while newQuote == previous
    }
    
    func setNewColor() {
        let previous = backgroundColor
        
        repeat {
            backgroundColor = colors.randomElement()!
        } while backgroundColor == previous
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
