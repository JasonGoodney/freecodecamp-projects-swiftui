//
//  ProductView.swift
//  ProductLandingPage
//
//  Created by Jason Goodney on 7/15/20.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageString)
                .resizable()
                .scaledToFit()
            
            
            Text(product.title.uppercased())
            Text(product.price)
        
        }
    }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.examples[0])
    }
}
