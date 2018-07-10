//
//  LocationsPresenter.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Presenter of module 'Locations'.
class LocationsPresenter: LocationsPresenterProtocol {

    /// The entity of 'Bank Region' on the basis of which the list of 'Bank Location' will be get.
    var region: BankRegion!

    /// Returns list of 'Bank locations' based on the entity of 'Bank Region'.
    /// Objects are sorted alphabetically (without regard to case).
    func getBankLocations() -> [BankLocation] {
        guard let locations = region.locations?.allObjects as? [BankLocation] else { return [] }
        return locations.sorted { ($0.name ?? "").uppercased() < ($1.name ?? "").uppercased() }
    }

}
