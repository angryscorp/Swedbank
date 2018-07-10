//
//  LocationsRouterProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// Router of module 'Locations'.
protocol LocationsRouterProtocol: DefaultRouterProtocol {

    /// Makes segue to default View controller of the module 'Location Info'.
    func goToDetailInfo(for: BankLocation, on currentVC: UIViewController)

}
