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
    
    convenience init(title: String) {
        self.init(frame: .zero)
        set(title: title)
    }
    
    func configure() {
        
        configuration = .tinted()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(title: String) {
        var configButton = UIButton.Configuration.plain()
        
        var attr = AttributeContainer()
        attr.font = .systemFont(ofSize: 10, weight: .semibold)
        attr.foregroundColor = .systemBlue
        
    
    
        configButton.attributedTitle = AttributedString(title, attributes: attr)
        configButton.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 0)
        configButton.titleAlignment = .leading
        self.configuration = configButton
        
        
    }
    
}
