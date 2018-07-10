//
//  TypeLocation.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Describes Types of 'Bank location'.
/// For the 'Branch' option, contain the associated values:
/// - info: additional information
/// - noCash: cash isn't applied
/// - hasCoinStation: location has a coin station
enum TypeLocation {

    case Branch(info: String?, noCash: Bool?, hasCoinStation: Bool?)
    case ATM
    case BNA

    /// Returns the main string title of the type.
    var title: String {
        switch self {
        case .Branch: return "Branch"
        case .ATM: return "ATM (Automated Teller Machine)"
        case .BNA: return "BNA (Bunch Note Acceptor)"
        }
    }

    /// Creates 'Type Location' based on ID.
    /// If ID is incorrect - returns nil.
    /// - parameter id: ID of Type Location.
    /// - parameter info: Additional info (only for 'Branch')
    /// - parameter noCash: Cash isn't applied (only for 'Branch')
    /// - parameter hasCoinStation: Location has a coin station (only for 'Branch')
    init?(id: Int, info: String? = nil, noCash: Bool? = nil, hasCoinStation: Bool? = nil) {
        switch id {
        case 0: self = .Branch(info: info, noCash: noCash, hasCoinStation: hasCoinStation)
        case 1: self = .ATM
        case 2: self = .BNA
        default: return nil
        }
    }

}
