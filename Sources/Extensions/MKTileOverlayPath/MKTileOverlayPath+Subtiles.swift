//
//  MKTileOverlayPath+Subtiles.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 29/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import MapKit

extension MKTileOverlayPath {
    public func parentPath() -> MKTileOverlayPath {
        var parentPath = MKTileOverlayPath()
        parentPath.x = Int(floor(Double(self.x / 2)))
        parentPath.y = Int(floor(Double(self.y / 2)))
        parentPath.z = Int(self.z - 1)
        return parentPath
    }
    
    public func childrenPaths() -> [MKTileOverlayPath] {
        var firstPath = MKTileOverlayPath()
        firstPath.x = Int(floor(Double(self.x * 2)))
        firstPath.y = Int(floor(Double(self.y * 2)))
        firstPath.z = Int(self.z + 1)
        
        var secondPath = MKTileOverlayPath()
        secondPath.x = Int(floor(Double(self.x * 2) + 1))
        secondPath.y = Int(floor(Double(self.y * 2)))
        secondPath.z = Int(self.z + 1)
        
        var thirdPath = MKTileOverlayPath()
        thirdPath.x = Int(floor(Double(self.x * 2)))
        thirdPath.y = Int(floor(Double(self.y * 2) + 1))
        thirdPath.z = Int(self.z + 1)
        
        var fourthPath = MKTileOverlayPath()
        fourthPath.x = Int(floor(Double(self.x * 2) + 1))
        fourthPath.y = Int(floor(Double(self.y * 2) + 1))
        fourthPath.z = Int(self.z + 1)
        
        return [firstPath, secondPath, thirdPath, fourthPath]
    }
}
