//
//  ContentView.swift
//  ProductLandingPage
//
//  Created by Jason Goodney on 7/15/20.
//

import SwiftUI
import SFSafeSymbols
import AVKit

struct ContentView: View {
    
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(PromoItem.examples, id: \.self) { promoItem in
                                    PromoItemView(promoItem: promoItem)
                                        .frame(width: geo.size.width - 24)
                                }
                            }
                        }
                        
                        
                        SectionHeader(text: "OUR PICKS FOR YOU")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Product.examples, id: \.self) { product in
                                    ProductView(product: product)
                                        .frame(width: geo.size.width - 40)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        VStack(spacing: 5) {
                            VStack(alignment: .leading) {
                                Text("WE’RE WORKING HARD. DAY AFTER DAY.\nSIGN UP TO STAY UP TO DATE.")
                                    .foregroundColor(.white)
                                    .bold()
                                
                                HStack {
                                    TextField("Email*", text: $email)
                                        .keyboardType(.emailAddress)
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                    
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: SFSymbol.arrowRight.rawValue)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                            
                                    })
                                    .padding(.vertical)
                                    .padding(.horizontal, 20)
                                    .background(Color.black)
                                    .padding(5)
                                }
                                .background(Color.white)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 40)
                            .background(Color.black)
                            
                            VStack(spacing: 12) {
                                HStack {
                                    Text("Privacy")
                                        .foregroundColor(.white)
                                    
                                    Text("Terms")
                                        .foregroundColor(.white)
                                    
                                    Text("Contact")
                                        .foregroundColor(.white)
                                }
                                
                                Text("Copyright 2020. All rights reserved.")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 40)
                            .frame(width: geo.size.width)
                            .background(Color.black)
                        }
                        
                    }
                    .navigationTitle("NOBULL")
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SectionHeader: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .bold()
                .font(.title)
            Spacer()
        }
        .padding(.leading)
        .padding(.top, 20)
    }
}
