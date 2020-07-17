//
//  QuoteView.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import SwiftUI

struct QuoteView: View {
    let quote: Quote
    
    var body: some View {
        Text("\"\(quote.text)\"\n\n-- \(quote.author)")
            .italic()
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: borlaugQuote)
    }
}
