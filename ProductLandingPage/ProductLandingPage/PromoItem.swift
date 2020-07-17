//
//  PromoItem.swift
//  ProductLandingPage
//
//  Created by Jason Goodney on 7/15/20.
//

import Foundation

struct PromoItem: Hashable {
    let title: String
    let subtitle: String?
    let buttonText: String
    let imageString: String
    
    static let examples: [PromoItem] = [
        PromoItem(title: "Mesh Runner", subtitle: "Available 7/16 12:00pm et", buttonText: "See Details", imageString: "nobull-mesh-runner-promo"),
        PromoItem(title: "Canvas Trainer", subtitle: "Now Available", buttonText: "Shop Now", imageString: "nobull-now-available"),
        PromoItem(title: "Back In\nStock", subtitle: nil, buttonText: "Shop Now", imageString: "nobull-back-instock")
    ]
}
