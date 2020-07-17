//
//  QuoteCard.swift
//  RandomQuoteMachine
//
//  Created by Jason Goodney on 7/17/20.
//

import SwiftUI

struct QuoteCard: View {
    @Binding var quote: Quote
    @Binding var primaryColor: Color
    var actionHandler: (() -> Void)
    
    @State private var showText = true
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("“")
                    .font(.largeTitle)
                    .bold()
                +
                Text(quote.quote)
                    .font(.title2)
            }
            
            HStack {
                Spacer()
                Text("- \(quote.author)")
            }
            
            HStack {
                Spacer()
                
                Button(action: actionHandler, label: {
                    Text("New Quote")
                        .foregroundColor(.white)
                        .bold()
                        
                })
                .padding(15)
                .background(primaryColor)
                .cornerRadius(5)
            }
            
        }
        .foregroundColor(primaryColor)
        .padding(30)
        .background(Color.white)
        .cornerRadius(5)
    }
}

struct QuoteCard_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCard(quote: .constant(Quote.example), primaryColor: .constant(Color.yellow), actionHandler: {})
    }
}
