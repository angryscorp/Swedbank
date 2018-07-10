//
//  RegionsRouterProtocol.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// Router of module 'Regions'.
protocol RegionsRouterProtocol: DefaultRouterProtocol {

    /// Makes segue to default View controller of the module 'Locations'.
    func goToLocations(for region: BankRegion, on currentVC: UIViewController)

}
