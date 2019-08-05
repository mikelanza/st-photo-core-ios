//
//  STCarousel.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 23/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import UIKit

public class STCarousel {
    public struct Photo {
        public var id: String
        public var image: UIImage?
    }
    
    public struct Label {
        public var latitude: Double
        public var longitude: Double
        public var radius: Double
        
        public func location() -> STLocation {
            return STLocation(latitude: self.latitude, longitude: self.longitude)
        }
    }
    
    public var entityId: Int = -1
    public var name: String = ""
    public var overlays: [STCarouselOverlay] = []
    public var photoCount: Int = 0
    public var titleLabel: Label?
    public var entityLevel: EntityLevel = .unknown
    
    public var shouldDrawTutorialLabel: Bool = false
    public var numberOfTutorialTextUpdates: Int = 1
    
    public var photos: [STPhoto] = []
    public var downloadedPhotos: [Photo] = []
    public var currentPhoto: Photo?
    
    public init() {
        
    }
}
