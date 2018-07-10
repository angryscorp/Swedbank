//
//  Country.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Describes each country with which we work and contains supporting data about it.
enum Country: String {

    // Countries
    case estonia
    case latvia
    case lithuania

    /// Returns all Countries.
    static var allValues: [Country] = [.estonia, .latvia, .lithuania]

    /// Returns the main string title of the country.
    var title: String {
        switch self {
        case .estonia: return "Estonia"
        case .latvia: return "Latvia"
        case .lithuania: return "Lithuania"
        }
    }

    /// Returns the main URL for data request of the country.
    var url: URL {
        switch self {
        case .estonia: return URL(string: "https://www.swedbank.ee/finder.json")!
        case .latvia: return URL(string: "https://ib.swedbank.lv/finder.json")!
        case .lithuania: return URL(string: "https://ib.swedbank.lt/finder.json")!
        }
    }
}
