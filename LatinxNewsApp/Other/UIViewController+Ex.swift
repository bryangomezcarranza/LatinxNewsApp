//
//  UIViewController+Ex.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/6/22.
//

import Foundation
import SafariServices

extension UIViewController {
    
    func presentSafariVC(with url: URL) {
        // create safari vc
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemBlue
        present(safariVC, animated: true)
    }
}
