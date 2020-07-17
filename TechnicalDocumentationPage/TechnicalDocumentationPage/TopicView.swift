//
//  TopicView.swift
//  TechnicalDocumentationPage
//
//  Created by Jason Goodney on 7/15/20.
//

import SwiftUI

struct TopicView: View {
    let topic: Topic
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(topic.contents, id: \.self) { content in
                    switch content.type {
                    case .paragraph:
                        Text(content.text)
                    case .bullet:
                        HStack(alignment: .top) {
                            Text("•  ")
                                .bold()
                            
                            Text(content.text)
                        }
                        .padding(.leading)
                    case .subBullet:
                        HStack(alignment: .top) {
                            Text("-  ")
                                .bold()
                            
                            Text(content.text)
                        }
                        .padding(.leading, 40)
                    case .code:
                        CodeView(text: content.text)

                        
                    }
                }
            }
            .padding()
            .navigationBarTitle(Text(topic.title), displayMode: .inline)
        }
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(topic: Topic.examples[9])
    }
}

struct CodeView: View {
    let text: String
    var body: some View {
        
        
        HStack {
            Text(text)
                .font(.headline)
                .padding()
                
            Spacer()
        }
        .background(Color.gray.opacity(0.3))
        .cornerRadius(5)
        
    }
}
