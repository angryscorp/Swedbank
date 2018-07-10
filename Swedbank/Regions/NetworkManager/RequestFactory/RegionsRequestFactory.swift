//
//  RegionsRequestFactory.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Request Factory of module 'Regions'.
class RegionsRequestFactory: RegionsRequestFactoryProtocol {

    /// Constructs and returns URL-request based on 'Country'.
    /// - parameter country: Country for which is need to build URL-request.
    static func make(for country: Country) -> URLRequest {
        var request = URLRequest(url: country.url)
        request.addValue("Swedbank-Embedded=iphone-app", forHTTPHeaderField: "Cookie")
        return request
    }

}
