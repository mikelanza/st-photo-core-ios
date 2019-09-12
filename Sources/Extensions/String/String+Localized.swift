//
//  String+Localized.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 17/04/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

extension String {
    public func localized(withComment comment: String = "", in bundle: Bundle) -> String {
        return NSLocalizedString(self, bundle: bundle, comment: comment)
    }
}
