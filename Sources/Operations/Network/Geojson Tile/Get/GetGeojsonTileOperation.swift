//
//  GetGeojsonTileOperation.swift
//  STPhotoCore
//
//  Created by Dimitri Strauneanu on 11/07/2018.
//  Copyright © 2018 mikelanza. All rights reserved.
//

import Foundation

public class GetGeojsonTileOperation: AsynchronousOperation {
    private let model: GetGeojsonTileOperationModel.Request
    private var operationCompletionHandler: (Result<GetGeojsonTileOperationModel.Response, OperationError>) -> Void
    
    private var task: URLSessionDataTask?
    
    public init(model: GetGeojsonTileOperationModel.Request, completionHandler: @escaping (Result<GetGeojsonTileOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override public func main() {
        let request = GetGeojsonTileOperationRequestBuilder(model: self.model).request()
        
        self.task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.verifyData(data: data)
        }
        self.task?.resume()
    }
    
    override public func cancel() {
        self.task?.cancel()
        super.cancel()
    }
    
    private func shouldCancelOperation() -> Bool {
        if self.isCancelled {
            self.operationCompletionHandler(Result.failure(OperationError.operationCancelled))
            self.completeOperation()
            return true
        }
        return false
    }
    
    public func getTileCoordinate() -> TileCoordinate {
        return self.model.tileCoordinate
    }
    
    private func verifyData(data: Data?) {
        if let data = data {
            self.decodeData(data: data)
        } else {
            self.noDataAvailableErrorBlock()
        }
    }
    
    private func decodeData(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                self.parseJson(json: json)
            }
        } catch {
            self.cannotParseResponseErrorBlock()
        }
    }
    
    private func parseJson(json: [String: Any]) {
        if self.shouldCancelOperation() {
            return
        }
        if let geoJSONObject = GeoJSON.init().parse(geoJSON: json) {
            if self.shouldCancelOperation() {
                return
            }
            self.successBlock(geoJSONObject: geoJSONObject)
        } else {
            self.cannotParseResponseErrorBlock()
        }
    }
    
    // MARK: - Success
    
    private func successBlock(geoJSONObject: GeoJSONObject) {
        let value = GetGeojsonTileOperationModel.Response(geoJSONObject: geoJSONObject)
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
    
    // MARK: - Server errors
    
    private func responseErrorBlock(error: Error) {
        self.operationCompletionHandler(Result.failure(OperationError.error(message: error.localizedDescription)))
        self.completeOperation()
    }
}
