//
//  Content.swift
//  TechnicalDocumentationPage
//
//  Created by Jason Goodney on 7/15/20.
//

import Foundation

enum ContentType {
    case paragraph, bullet, subBullet, code
}

struct Content: Hashable {
    let type: ContentType
    let text: String
}
