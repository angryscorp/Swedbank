//
//  UIRefreshControl+Additions.swift
//  Swedbank
//
//  Created by Antony Karpov on 08/07/2018.
//  Copyright © 2018 Antony Karpov. All rights reserved.
//

import UIKit

// MARK: UI REFRESH CONTROL'S UTILITY FUNCTIONS

extension UIRefreshControl {

    /// Simulates user's pull-to-update of UIRefreshControl and begins refreshing.
    /// - parameter animated: true to animate the transition at a constant velocity to the new offset, false to make the transition immediate.
    func refreshManually(_ animated: Bool = true) {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height), animated: animated)
        }
        beginRefreshing()
        sendActions(for: .valueChanged)
    }

}
