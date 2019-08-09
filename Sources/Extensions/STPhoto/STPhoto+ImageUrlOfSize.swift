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
            case (let width, let height) where width <= 20 && height <= 20: url = self.image20Url; break
            case (let width, let height) where width <= 40 && height <= 40: url = self.image40Url; break
            case (let width, let height) where width <= 60 && height <= 60: url = self.image60Url; break
            case (let width, let height) where width <= 120 && height <= 120: url = self.image120Url; break
            case (let width, let height) where width <= 250 && height <= 250: url = self.image250Url; break
            case (let width, let height) where width <= 350 && height <= 350: url = self.image350Url; break
            case (let width, let height) where width <= 650 && height <= 650: url = self.image650Url; break
            case (let width, let height) where width <= 750 && height <= 750: url = self.image750Url; break
            case (let width, let height) where width <= 1200 && height <= 1200: url = self.image1200Url; break
            default: url = self.imageUrl; break
        }
        return url ?? self.imageUrl
    }
}
