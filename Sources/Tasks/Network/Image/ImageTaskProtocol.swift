//
//  ImageTaskProtocol.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

public protocol ImageTaskProtocol {
    func fetchImage(url: String?, completionHandler: @escaping (Result<UIImage?, OperationError>) -> Void)
}
