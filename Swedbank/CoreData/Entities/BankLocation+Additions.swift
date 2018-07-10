//
//  BankLocation+Additions.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import CoreData

extension BankLocation {

    /// Creates or finds an existing 'Bank Location' based on JSON-data about it.
    /// If JSON-data is not correct - returns nil.
    /// - parameter json: JSON-data of the searched object.
    /// - parameter countryName: name of the country, where have to search object.
    /// - parameter context: Managed object context, where have to work on it.
    static func createIfNeeded(from json: BankLocationJSON, with countryName: String, into context: NSManagedObjectContext) -> BankLocation? {

        // Required fields for BankLocation
        guard
            let latitude = json.latitude,
            let longitude = json.longitude,
            let name = json.name,
            let address = json.address,
            let idType = json.idType,
            let regionName = json.region
        else { return nil }

        // First of all, try to find an existing object, if it does not - create a new one.
        // Since we do not have any ID to uniquely identify it, we will use a combination of several fields.
        // If we find the object, we will update its other fields.
        // So, our ID = Name + Region, where Region is Region's Name + Country's Name.

        // Get the 'Bank region' based on Region's name and Country's name.
        let bankRegion = BankRegion.createIfNeeded(name: regionName, country: countryName, into: context)

        // 'Bank locations', which will be found or created.
        let location: BankLocation

        // Fetch request for search an existing 'Bank location'
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BankLocation")
        fetchRequest.predicate = NSPredicate(format: "(name == %@) AND (region == %@)", name, bankRegion)

        // If such an object exists, use it, otherwise - create a new one.
        if let results = try? context.fetch(fetchRequest), let banklocation = results.first as? BankLocation {
            location = banklocation
        } else {
            location = BankLocation(context: context)
            location.name = name
            location.region = bankRegion
        }

        // Updating the rest of the fields of the created or found object.
        location.idType = Int16(idType)
        location.address = address
        location.latitude = latitude
        location.longitude = longitude
        location.availability = json.availability

        // Control fields that depend on the Type of Location
        if idType == 0 {
            if let info = json.info {
                location.info = info
            }
            if let noCash = json.noCash {
                location.noCash = NSNumber(booleanLiteral: noCash)
            }
            if let hasCoinStation = json.hasCoinStation {
                location.hasCoinStation = NSNumber(booleanLiteral: hasCoinStation)
            }
        } else {
            location.info = nil
            location.noCash = nil
            location.hasCoinStation = nil
        }

        return location
    }

}
