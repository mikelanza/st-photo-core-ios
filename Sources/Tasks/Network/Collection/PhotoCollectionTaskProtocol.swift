//
//  PhotoCollectionTaskProtocol.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public protocol PhotoCollectionTaskProtocol {
    func fetchPhotoCollection(collectionId: String, completionHandler: @escaping (Result<STCollection, OperationError>) -> Void)
}
