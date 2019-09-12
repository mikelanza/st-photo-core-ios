//
//  MKMapView+BoundingBox.swift
//  STPhotoCore
//
//  Created by Crasneanu Cristian on 16/05/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    public func boundingBox() -> BoundingBox {
        return self.visibleMapRect.boundingBox()
    }
}
