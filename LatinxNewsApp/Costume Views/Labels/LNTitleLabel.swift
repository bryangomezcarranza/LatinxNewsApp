//
//  LNTitleLabel.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class LNTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = false
        minimumScaleFactor = 0.9
        numberOfLines = 0
        lineBreakStrategy = .standard
        translatesAutoresizingMaskIntoConstraints = false
    }
}
