//
//  URLSession+Additions.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

// MARK: URL SESSION'S UTILITY FUNCTIONS

extension URLSession {

    /// Creates and async perform self.dataTask() with the URL-request.
    /// The result of the task will be pass to the handler(TaskResult<Data>).
    /// - parameter request: URLRequest object that provides the URL, cache policy, request type and so on.
    /// - parameter handler: The completion handler to call when the load request is complete.
    func performDataTask(request: URLRequest, handler: @escaping (TaskResult<Data>) -> Void) {

        URLSession.shared.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let error = error {
                handler(.failure(error))
            } else {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200, let data = data {
                        handler(.success(data))
                    } else {
                        let error = NSError(domain: "NetworkErrorDomain", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey : "Server is not available."])
                        handler(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "NetworkErrorDomain", code: -999, userInfo: [NSLocalizedDescriptionKey : "Network request error."])
                    handler(.failure(error))
                }
            }
        }).resume()

    }

}
