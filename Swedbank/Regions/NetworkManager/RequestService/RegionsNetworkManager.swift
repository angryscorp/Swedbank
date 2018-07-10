//
//  RegionsNetworkManager.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

/// Network Manager of module 'Regions'.
class RegionsNetworkManager: RegionsNetworkManagerProtocol {

    /// Auxiliary Type for presenting the result of loading data by country.
    typealias TaskResultJSON = TaskResult<[BankLocationJSON]>

    /// Loads data from the network and passes the result to the completion handler.
    /// - parameter country: Country for which is needed to load data.
    /// - parameter completion: Completion handler, where the result of the operation will be pass.
    func loadData(for country: Country, completion: @escaping (TaskResultJSON) -> Void) {

        let request = RegionsRequestFactory.make(for: country)
        
        URLSession.shared.performDataTask(request: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode([BankLocationJSON].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
