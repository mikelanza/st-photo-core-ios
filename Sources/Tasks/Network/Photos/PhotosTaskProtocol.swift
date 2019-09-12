//
//  PhotoCommentsTaskProtocol.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public protocol PhotosTaskProtocol {
    func fetchPhotos(model: PhotosTaskModel.Fetch, completionHandler: @escaping (Result<[STPhoto], OperationError>) -> Void)
}
