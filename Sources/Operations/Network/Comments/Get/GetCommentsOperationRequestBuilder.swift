//
//  GetCommentsOperationRequestBuilder.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

class GetCommentsOperationRequestBuilder {
    private let model: GetCommentsOperationModel.Request
    
    init(model: GetCommentsOperationModel.Request) {
        self.model = model
    }
    
    func request() -> URLRequest {
        let urlString = EndpointsBuilder.shared.getCommentsEndpoint(photoId: self.model.photoId)
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
            "limit": String(self.model.limit),
            "page": String(self.model.page)
        ]
    }
}
