//
//  Person.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import Foundation

struct Person {
    let title: String
    let firstName: String
    let lastName: String
    let description: String
    let featureImage: FeatureImage
    let timeline: [Event]
    let quote: Quote
    let link: String
    
    var fullName: String { "\(title) \(firstName) \(lastName)" }
    
    var shortName: String { "\(title) \(lastName)" }
    
    static let example = Person(title: "Dr.", firstName: "Norman", lastName: "Borlaug", description: "The man who saved a billion lives", featureImage: FeatureImage(imageURL: URL(string: "https://acsess.onlinelibrary.wiley.com/cms/asset/b9220e74-6d2b-429b-bcec-42c07300e385/csancsa20145931-fig-0003-m.jpg")!, caption: "Dr. Norman Borlaug, third from the left, trains biologists in Mexico on how to increase wheat yields - part of his life-long war on hunger."), timeline: borlaugTimeline, quote: borlaugQuote, link: "https://en.wikipedia.org/wiki/Norman_Borlaug")
}

