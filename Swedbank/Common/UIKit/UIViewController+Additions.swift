//
//  UIViewController+Additions.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

// MARK: UI VIEW CONTROLLER'S UTILITY FUNCTIONS

extension UIViewController {

    /// Shows simple message via UIAlertController.
    /// - parameter msg: Text of message.
    /// - parameter title: Title of message.
    func showMessage(_ msg: String, title: String? = nil) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
