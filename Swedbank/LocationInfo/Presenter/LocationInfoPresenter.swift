//
//  LocationInfoPresenter.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Presenter of module 'Location Info'.
class LocationInfoPresenter: LocationInfoPresenterProtocol {

    /// The entity of 'Bank Location' on the basis of which the ViewModel will be constructed.
    var location: BankLocation!

    /// Constructs ViewModel for View controller based on the entity of 'Bank Location'.
    func makeDetailInfo() -> LocationInfoViewModel {

        let typeLocation = TypeLocation(
            id: Int(location.idType),
            info: location.info,
            noCash: location.noCash?.boolValue,
            hasCoinStation: location.hasCoinStation?.boolValue
        )

        let viewModel = LocationInfoViewModel(
            type: typeLocation,
            name: location.name ?? "",
            address: location.address ?? "",
            region: location.region?.name ?? "",
            availability: location.availability
        )

        return viewModel
    }

}
