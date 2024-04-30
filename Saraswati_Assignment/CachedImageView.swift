//
//  CachedImageView.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import Foundation
import SwiftUI

struct CachedImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: URL

    var body: some View {
        Group {
            if let image = imageLoader.image(for: url) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            imageLoader.load(url: url)
        }
    }
}

class ImageLoader: ObservableObject {
    @Published private(set) var image: UIImage? = nil
    private var cache = NSCache<AnyObject, UIImage>()

    func load(url: URL) {
        if let image = cache.object(forKey: url as AnyObject) {
            self.image = image
            return
        }

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)!
                self.cache.setObject(image, forKey: url as AnyObject) // Use url as AnyObject

                DispatchQueue.main.async {
                    self.image = image
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
    }

    func image(for url: URL) -> UIImage? {
        return cache.object(forKey: url as AnyObject)
    }
}

