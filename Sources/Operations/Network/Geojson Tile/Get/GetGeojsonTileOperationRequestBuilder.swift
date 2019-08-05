//
//  GetGeojsonTileOperationRequestBuilder.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 11/07/2018.
//  Copyright © 2018 mikelanza. All rights reserved.
//

import Foundation

public class GetGeojsonTileOperationRequestBuilder {
    private let model: GetGeojsonTileOperationModel.Request
    
    public init(model: GetGeojsonTileOperationModel.Request) {
        self.model = model
    }
    
    public func request() -> URLRequest {
        let url = URL(string: self.model.url)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
