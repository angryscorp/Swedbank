//
//  RegionsNetworkManagerProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Network Manager of module 'Regions'.
protocol RegionsNetworkManagerProtocol: class {

    /// Loads data from the network and passes the result to the completion handler.
    /// - parameter country: Country for which is needed to load data.
    /// - parameter completion: Completion handler, where the result of the operation will be pass.
    func loadData(for country: Country, completion: @escaping (TaskResult<[BankLocationJSON]>) -> Void)

}
