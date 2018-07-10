//
//  LocationsViewControllerProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import Foundation

/// ViewController of module 'Locations'.
protocol LocationsViewControllerProtocol: class {

    var router: LocationsRouterProtocol! { get set }
    var presenter: LocationsPresenterProtocol! { get set }

}
