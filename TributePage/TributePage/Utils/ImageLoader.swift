//
//  ImageLoader.swift
//  TributePage
//
//  Created by Jason Goodney on 7/14/20.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    let objectWillChange = PassthroughSubject<UIImage?, Never>()

    func load(url: URL) {
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map({ $0.data })
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .map({ UIImage(data: $0) })
            .replaceError(with: nil)
            .sink(receiveValue: { image in
                self.objectWillChange.send(image)
            })
    }

    func cancel() {
        cancellable?.cancel()
    }
}
