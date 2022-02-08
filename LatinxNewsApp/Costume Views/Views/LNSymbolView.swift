//
//  LNSymbolView.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import Foundation
import UIKit

class LNSymbolView: UIView {
    let symbolImageView = UIImageView()
    let pointsCountLabel = LNBodyLabel(textAlignment: .left, fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    convenience init(symbol: UIImage) {
        self.init(frame: .zero)
        self.symbolImageView.image = symbol
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(text: String) {
        pointsCountLabel.text = text
    }
    
    private func configureUI() {
        addSubview(symbolImageView)
        addSubview(pointsCountLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.heightAnchor.constraint(equalToConstant: 14),
            symbolImageView.widthAnchor.constraint(equalToConstant: 14),
            
            pointsCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pointsCountLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 1),
            pointsCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pointsCountLabel.heightAnchor.constraint(equalToConstant: 14)
            
        ])
    }
    
}
