//
//  GetPhotoOperationRequestBuilder.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public class GetPhotoOperationRequestBuilder {
    private let model: GetPhotoOperationModel.Request
    
    public init(model: GetPhotoOperationModel.Request) {
        self.model = model
    }
    
    public func request() -> URLRequest {
        let urlString = EndpointsBuilder.shared.getPhotoEndpoint(photoId: self.model.photoId)
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = self.parameters().map({ URLQueryItem(name: $0.key, value: $0.value) })
        let url = urlComponents.url!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    private func parameters() -> [String: String] {
        return [
            "apisecret": EndpointsBuilder.apiSecret,
            "includeOwner": String(self.model.includeUser)
        ]
    }
}
