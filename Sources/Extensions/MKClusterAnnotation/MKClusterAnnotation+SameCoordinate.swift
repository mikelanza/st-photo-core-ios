//
//  MKClusterAnnotation+SameCoordinate.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 21/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import MapKit

extension MKClusterAnnotation {
    public func doMemberAnnotationsHaveSameCoordinate() -> Bool {
        let coordinate = self.memberAnnotations.first?.coordinate
        return self.memberAnnotations.allSatisfy({ $0.coordinate == coordinate })
    }
}
