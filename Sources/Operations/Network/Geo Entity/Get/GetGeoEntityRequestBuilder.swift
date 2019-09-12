//
//  GetGeoEntityRequestBuilder.swift
//  STPhotoCore-iOS
//
//  Created by Crasneanu Cristian on 23/01/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public class GetGeoEntityRequestBuilder {
    private let model: GetGeoEntityOperationModel.Request
    
    public init(model: GetGeoEntityOperationModel.Request) {
        self.model = model
    }
    
    func request() -> URLRequest {
        var urlComponents = URLComponents(string: EndpointsBuilder.shared.getGeoEntityEndpoint())!
        urlComponents.queryItems = self.parameters().map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
        let url = urlComponents.url!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }

    private func parameters() -> [String: Any] {
        var parameters: [String: Any] = [:]
        parameters["apisecret"] = EndpointsBuilder.apiSecret
        parameters["entityId"] = self.model.entityId
        parameters["type"] = self.model.entity.rawValue
        parameters["page"] = self.model.page
        parameters["pageLimit"] = self.model.limit
        parameters["userId"] = self.model.userId
        parameters["collectionId"] = self.model.collectionId
        return parameters
    }
}
