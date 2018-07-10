//
//  RegionsRequestFactoryProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 09/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Request Factory of module 'Regions'.
protocol RegionsRequestFactoryProtocol {

    /// Constructs and returns URL-request based on 'Country'.
    /// - parameter country: Country for which is need to build URL-request.
    static func make(for country: Country) -> URLRequest

}
