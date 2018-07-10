//
//  LocationsPresenterProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Presenter of module 'Locations'.
protocol LocationsPresenterProtocol: class {

    /// The entity of 'Bank Region' on the basis of which the list of 'Bank Location' will be get.
    var region: BankRegion! { get set }

    /// Returns list of 'Bank locations' based on the entity of 'Bank Region'.
    /// Objects are sorted alphabetically (without regard to case).
    func getBankLocations() -> [BankLocation]
    
}
