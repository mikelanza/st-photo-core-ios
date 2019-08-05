//
//  STPhoto+ImageUrlOfSize.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import UIKit

extension STPhoto {
    public func imageUrl(size: CGSize) -> String? {
        var url: String? = nil
        switch (size.width, size.height) {
            case (let width, let height) where width <= 650 && height <= 650: url = self.image650Url; break
            case (let width, let height) where width <= 750 && height <= 750: url = self.image750Url; break
            case (let width, let height) where width <= 1200 && height <= 1200: url = self.image1200Url; break
            default: url = self.imageUrl; break
        }
        return url
    }
}
