//
//  RemoteImage.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import SwiftUI

struct RemoteImage: View {
    let url: URL
    let imageLoader = ImageLoader()
    @State var image: UIImage? = nil

    var body: some View {
        Group {
            makeContent()
        }
        .onReceive(imageLoader.objectWillChange, perform: { image in
            self.image = image
        })
        .onAppear(perform: {
            self.imageLoader.load(url: self.url)
        })
        .onDisappear(perform: {
            self.imageLoader.cancel()
        })
    }

    private func makeContent() -> some View {
        if let image = image {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
        } else {
            return AnyView(Text("😢"))
        }
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: URL(string: "https://acsess.onlinelibrary.wiley.com/cms/asset/b9220e74-6d2b-429b-bcec-42c07300e385/csancsa20145931-fig-0003-m.jpg")!)
    }
}
