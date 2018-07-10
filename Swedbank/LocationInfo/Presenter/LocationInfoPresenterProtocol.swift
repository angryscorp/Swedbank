//
//  LocationInfoPresenterProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// Presenter of module 'Location Info'.
protocol LocationInfoPresenterProtocol: class {

    /// The entity of 'Bank Location' on the basis of which the ViewModel will be constructed.
    var location: BankLocation! { get set }

    /// Constructs ViewModel for View controller based on the entity of 'Bank Location'.
    func makeDetailInfo() -> LocationInfoViewModel

}
