//
//  MKMapView+VisibleTiles.swift
//  STPhotoCore
//
//  Created by Crasneanu Cristian on 22/04/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import MapKit

extension MKMapView {
    public func visibleTiles() -> [TileCoordinate] {
        let zoom = self.zoomLevel()
        return self.visibleMapRect.spiralTiles(zoom: zoom)
    }
}
