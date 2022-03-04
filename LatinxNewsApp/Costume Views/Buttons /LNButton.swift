//
//  LNButton.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/3/22.
//

import UIKit

class LNButton: UIButton {
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, systemImageName: String) {
        self.init(frame: .zero)
        set(color: color, systemImageName: systemImageName)
    }
    
    func configure() {
        configuration = .tinted()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, systemImageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
        
    }
    
}
