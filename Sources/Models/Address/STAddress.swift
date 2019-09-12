//
//  STAddress.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public struct STAddress {
    public var location: STLocation?
    
    public var street: String?
    public var city: String?
    public var state: String?
    public var country: String?
    
    public init() {
        
    }
}
