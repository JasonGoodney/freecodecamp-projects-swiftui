//
//  Quote.swift
//  RandomQuoteMachine
//
//  Created by Jason Goodney on 7/16/20.
//

import Foundation

class QuoteStore: ObservableObject, Decodable {
    @Published var quotes: [Quote] = []
    
    enum CodingKeys: String, CodingKey {
        case quotes
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        quotes = try container.decode([Quote].self, forKey: .quotes)
    }
}

struct Quote: Hashable, Decodable {
    let quote: String
    let author: String
    
    static let example = Quote(quote: "The battles that count aren’t the ones for gold medals. The struggles within yourself–the invisible battles inside all of us–that’s where it’s at.", author: "Jesse Owens")
}
