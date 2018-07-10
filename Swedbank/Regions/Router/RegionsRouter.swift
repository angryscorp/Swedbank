//
//  RegionsRouter.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// Router of module 'Regions'.
class RegionsRouter: RegionsRouterProtocol {

    /// Makes segue to default View controller of the module 'Locations'.
    func goToLocations(for region: BankRegion, on currentVC: UIViewController) {
        let vc = LocationsAssembly.default(for: region)
        goTo(vc, on: currentVC)
    }

}
