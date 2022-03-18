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
        
        configuration = .plain()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(title: String) {
        
        var config = UIButton.Configuration.plain()
        var attr = AttributeContainer()
        attr.font = .systemFont(ofSize: 14, weight: .semibold)
        attr.foregroundColor = .systemGreen

        config.attributedTitle = AttributedString(title, attributes: attr)
        config.contentInsets = .init(top: 5, leading: 0, bottom: 5, trailing: 0)
        config.titleAlignment = .leading
        config.buttonSize = .large
        self.configuration = config
    }
}
