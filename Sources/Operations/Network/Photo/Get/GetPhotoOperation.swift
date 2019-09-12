//
//  GetPhotoOperation.swift
//  STPhotoCore-iOS
//
//  Created by Dimitri Strauneanu on 20/05/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

public class GetPhotoOperation: AsynchronousOperation {
    private let model: GetPhotoOperationModel.Request
    private var operationCompletionHandler: (Result<GetPhotoOperationModel.Response, OperationError>) -> Void
    
    private var task: URLSessionDataTask?
    
    public init(model: GetPhotoOperationModel.Request, completionHandler: @escaping (Result<GetPhotoOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override public func main() {
        let request = GetPhotoOperationRequestBuilder(model: self.model).request()
        
        self.task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.verifyData(data: data)
        }
        self.task?.resume()
    }
    
    override public func cancel() {
        self.task?.cancel()
        super.cancel()
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
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
            let response = try decoder.decode(GetPhotoOperationModel.Response.self, from: data)
            self.successBlock(response: response)
        } catch {
            self.cannotParseResponseErrorBlock()
        }
    }
    
    private func shouldCancelOperation() -> Bool {
        if self.isCancelled {
            self.operationCompletionHandler(Result.failure(OperationError.operationCancelled))
            self.completeOperation()
            return true
        }
        return false
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetPhotoOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
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
