//
//  ApplicationRouter.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

/// The main application's router that assigns the root view controller and installs it into the main window.
class ApplicationRouter {

    /// The function describes the start view controller and sets it to the passed window.
    /// The root controller is wrapped in the navigation controller.
    static func installRootViewController(into window: UIWindow) {
        let startViewController = RegionsAssembly.default()
        window.rootViewController = UINavigationController(rootViewController: startViewController)
    }

}
