//
//  LNTableHeader.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/6/22.
//

import UIKit

class LNTableHeader: UIView {
    
    var newsStrories: NewsStories!
    
    // Stack for title and link
    let vStack = UIStackView()
    let titleLabel = LNTitleLabel(textAlignment: .left, fontSize: 16)
    let linkButton = LNButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
        configureVStack()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(news: NewsStories) {
        self.init(frame: .zero)
        
        titleLabel.text = news.title
        linkButton.set(title: news.url ?? "www.google.com")
    }
    
    private func configure() {
        addSubview(vStack)
    }
    
    private func configureVStack() {
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.spacing = 10
        
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(linkButton)
    }
    
    private func configureUI() {
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            vStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            vStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
        ])
        
    }

}
