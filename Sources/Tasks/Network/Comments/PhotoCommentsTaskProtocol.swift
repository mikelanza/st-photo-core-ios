//
//  PhotoCommentsTaskProtocol.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public protocol PhotoCommentsTaskProtocol {
    func fetchPhotoComments(model: PhotoCommentsTaskModel.Fetch, completionHandler: @escaping (Result<[STComment], OperationError>) -> Void)
}
