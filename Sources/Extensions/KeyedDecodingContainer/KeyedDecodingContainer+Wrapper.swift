//
//  KeyedDecodingContainer+Wrapper.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 08/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
    public func decodeWrapper<T>(key: K, defaultValue: T) throws -> T where T : Decodable {
        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
    }
}
