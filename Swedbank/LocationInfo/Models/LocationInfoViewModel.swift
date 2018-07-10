//
//  LocationInfoViewModel.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Describes detail info about 'Bank location'.
struct LocationInfoViewModel {

    let type: TypeLocation?
    let name: String
    let address: String
    let region: String
    let availability: String?

}

extension LocationInfoViewModel {

    /// Auxiliary type for presenting data into a table.
    typealias InfoRowTable = (title: String, value: String)

    /// Presents main data of 'Bank Location' like array of string tuples.
    var mainInfoTableView: [InfoRowTable] {
        return [
            ("TYPE", type?.title ?? "Unknown Type Location"),
            ("NAME", name),
            ("ADDRESS", address),
            ("REGION", region)
        ]
    }

    /// Presents additional data of 'Bank Location' like array of string tuples.
    var additionalInfoTableView: [InfoRowTable] {

        var additionalInfo = [InfoRowTable]()

        if let availability = availability {
            additionalInfo.append(("AVAILABILITY", availability))
        }

        if let type = type, case let TypeLocation.Branch(info, noCash, hasCoinStation) = type {
            if let info = info {
                additionalInfo.append(("INFO", info))
            }
            if let noCash = noCash {
                additionalInfo.append(("CASH", !noCash ? "YES" : "NO"))
            }
            if let hasCoinStation = hasCoinStation {
                additionalInfo.append(("COIN STATION", hasCoinStation ? "YES" : "NO"))
            }
        }
        return additionalInfo
    }

}
