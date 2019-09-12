//
//  GetLocationAddressOperationModel.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

struct GetLocationAddressOperationModel {
    struct Request {
        let location: STLocation
    }
    
    struct Response {
        let address: STAddress
    }
}
