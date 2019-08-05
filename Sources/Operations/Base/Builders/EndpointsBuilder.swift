//
//  EndpointsBuilder.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public final class EndpointsBuilder {
    public static let shared = EndpointsBuilder()
    
    private init() { }
    
    public static let apiSecret: String = "k9f2Hje7DM03Jyhf73hJ"
    
    public func getPhotoEndpoint(photoId: String) -> String {
        return String(format: Environment.getPhotoURL, photoId)
    }
    
    public func getCommentsEndpoint(photoId: String) -> String {
        return String(format: Environment.getCommentsURL, photoId)
    }
    
    public func getCollectionEndpoint() -> String {
        return Environment.getCollectionURL
    }
    
    public func getGeoEntityEndpoint() -> String {
        return Environment.bboxmongoURL
    }
}
