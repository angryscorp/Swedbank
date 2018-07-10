//
//  BankLocationJSON.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Describes the JSON-data of Bank Location.
struct BankLocationJSON: Codable {

    // Main fields
    let latitude: Double?
    let longitude: Double?
    let name: String?
    let address: String?
    let idType: Int?
    let region: String?
    let availability: String? // optional

    // Applicable only for branches
    let info: String?
    let noCash: Bool?
    let hasCoinStation: Bool?

    // Custom Coding Keys
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case name = "n"
        case address = "a"
        case idType = "t"
        case region = "r"
        case availability = "av"
        case info = "i"
        case noCash = "ncash"
        case hasCoinStation = "cs"
    }

}
