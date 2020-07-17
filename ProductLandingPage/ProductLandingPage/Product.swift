//
//  Product.swift
//  ProductLandingPage
//
//  Created by Jason Goodney on 7/15/20.
//

import Foundation

struct Product: Hashable {
    let title: String
    let imageString: String
    let price: String
    
    static let examples = [
        Product(title: "Runner", imageString: "nobull-runner", price: "$139"),
        Product(title: "Trainer", imageString: "nobull-trainer", price: "$129"),
        Product(title: "Canvas Trainer", imageString: "nobull-canvas-trainer", price: "$109")
    ]
}
