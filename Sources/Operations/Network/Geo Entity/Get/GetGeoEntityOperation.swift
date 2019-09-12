//
//  GetGeoEntityOperation.swift
//  STPhotoCore-iOS
//
//  Created by Crasneanu Cristian on 23/01/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

public class GetGeoEntityOperation: AsynchronousOperation {
    private let model: GetGeoEntityOperationModel.Request
    private var operationCompletionHandler: (Result<GetGeoEntityOperationModel.Response, OperationError>) -> Void
    
    private var task: URLSessionDataTask?
    
    public init(model: GetGeoEntityOperationModel.Request, completionHandler: @escaping (Result<GetGeoEntityOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override public func main() {
        let request = GetGeoEntityRequestBuilder(model: self.model).request()
        self.task = URLSession.shared.dataTask(with: request, completionHandler: { (data, _, _) in
            self.verifyData(data: data)
        })
        self.task?.resume()
    }
    
    override public func cancel() {
        self.task?.cancel()
        super.cancel()
    }
    
    // MARK: - Data result
    
    private func verifyData(data: Data?) {
        if let data = data {
            self.decodeData(data: data)
        } else {
            self.noDataAvailableErrorBlock()
        }
    }
    
    private func decodeData(data: Data) {
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(GetGeoEntityOperationModel.DecodedResponse.self, from: data)
            let response = try self.transformResponse(decodedResponse: decodedResponse)
            self.successfulResultBlock(value: response)
        } catch {
            self.cannotParseResponseErrorBlock()
        }
    }
    
    private func transformResponse(decodedResponse: GetGeoEntityOperationModel.DecodedResponse) throws -> GetGeoEntityOperationModel.Response {
        let geoEntities: [GeoEntity] = try decodedResponse.result.map({ try $0.toGeoEntity()})
        guard let geoEntity = geoEntities.first else {
            throw OperationError.noDataAvailable
        }
        return GetGeoEntityOperationModel.Response(geoEntity: geoEntity)
    }
    
    // MARK: - Successful result
    
    private func successfulResultBlock(value: GetGeoEntityOperationModel.Response) {
        self.operationCompletionHandler(Result.success(value))
        self.completeOperation()
    }
    
    // MARK: - Operation errors
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
    
    private func cannotParseResponseErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.cannotParseResponse))
        self.completeOperation()
    }
}
