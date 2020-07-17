//
//  PromoItemView.swift
//  ProductLandingPage
//
//  Created by Jason Goodney on 7/15/20.
//

import SwiftUI

struct PromoItemView: View {
    let promoItem: PromoItem
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(promoItem.imageString)
                .resizable()
                .scaleEffect(x: 2, y: 2)
                .scaledToFit()
                .offset(x: 120, y: -120.0)
                .clipped()
                
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading) {
                    if promoItem.subtitle != nil {
                        Text(promoItem.subtitle!.uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    
                    Text(promoItem.title.uppercased())
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .black))
                        .bold()
                }
                
                Text(promoItem.buttonText.uppercased())
                    .padding()
                    .background(Color.white)
                    .font(.headline)
            }
            .padding([.top, .leading])
            .shadow(radius: 10)
            
        }
    }
}

struct PromoItemView_Previews: PreviewProvider {
    static var previews: some View {
        PromoItemView(promoItem: PromoItem.examples[0])
    }
}
