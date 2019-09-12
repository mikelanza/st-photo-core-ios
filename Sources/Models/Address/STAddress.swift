//
//  STAddress.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public struct STAddress {
    var location: STLocation?
    
    var street: String?
    var city: String?
    var state: String?
    var country: String?
    
    public init() {
        
    }
}
