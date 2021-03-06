//
//  GetLocationEntitiesOperationRequestBuilder.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

class GetLocationEntitiesOperationRequestBuilder {
    private let model: GetLocationEntitiesOperationModel.Request
    
    init(model: GetLocationEntitiesOperationModel.Request) {
        self.model = model
    }
    
    func request() -> URLRequest {
        let urlString = EndpointsBuilder.shared.getLocationEntitiesEndpoint()
        var urlComponents = URLComponents(string: urlString)!
        urlComponents.queryItems = self.parameters().map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
        let url = urlComponents.url!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
    
    private func parameters() -> [String: Any] {
        return [
            "apisecret": EndpointsBuilder.apiSecret,
            "types": self.model.entities.map({ $0.rawValue }),
            "lat": String(self.model.location.latitude),
            "lng": String(self.model.location.longitude),
            "geom": String(self.model.shouldContainGeometry)
        ]
    }
}
