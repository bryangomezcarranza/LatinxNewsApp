//
//  UIViewController+Ext.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/3/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = LNEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
