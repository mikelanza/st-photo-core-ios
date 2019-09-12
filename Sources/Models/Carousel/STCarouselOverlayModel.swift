//
//  STCarouselOverlayModel.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

public struct STCarouselOverlayModel {
    public var photoId: String = ""
    public var photoImage: UIImage?
    public var photoCount: Int = 0
    
    public var location: STLocation
    public var radius: Double = 0
    
    public var name: String = ""
    public var type: String = ""
    
    public var lineWidth: CGFloat
    public var strokeColor: UIColor
    public var fillColor: UIColor
    public var alpha: CGFloat
    
    public var tutorialText: String = ""
    
    public var shouldDrawLabel: Bool = false
    public var shouldDrawEntityButton: Bool = false
    public var shouldDrawTutorialLabel: Bool = false
    
    public init() {
        self.location = STLocation(latitude: 0, longitude: 0)
        self.lineWidth = 15.0
        self.strokeColor = UIColor(red: 73/255, green: 175/255, blue: 253/255, alpha: 1.0)
        self.fillColor = UIColor.black.withAlphaComponent(0.0)
        self.alpha = 1.0
    }
}
