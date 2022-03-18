//
//  SaveNewsCell.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/17/22.
//

import UIKit

class SaveNewsCell: UITableViewCell {
    
    static let reuseIdentifier = "LNFavoritesCell"
    
    let titleLabel = LNTitleLabel(textAlignment: .left, fontSize: 17)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsStory) {
        
        titleLabel.text = news.title
        
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingHead
    }
    
    private func configure() {
        contentView.addSubview(titleLabel)
        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
