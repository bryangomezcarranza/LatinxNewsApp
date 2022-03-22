//
//  SaveNewsCell.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 3/17/22.
//

import UIKit

protocol linkArrowTappedDelegate: AnyObject {
    func arrowWasTapped(for link: NewsStory)
}

class SaveNewsCell: UITableViewCell {
    
    weak var delegate: linkArrowTappedDelegate!
    
    static let reuseIdentifier = "LNFavoritesCell"
    
    var news: NewsStory!
    
    let titleLabel = LNTitleLabel(textAlignment: .left, fontSize: 17)
    let linkToStory = LNButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsStory) {
        self.news = news
        
        titleLabel.text = news.title
        linkToStory.set(title: "→")
        linkToStory.titleLabel?.font = .systemFont(ofSize: 20, weight: .light)
        
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byTruncatingHead
    }
    
    private func configureButton() {
        linkToStory.addTarget(self, action: #selector(linkArrowTapped), for: .touchUpInside)
    }
    @objc func linkArrowTapped() {
        delegate.arrowWasTapped(for: news)
    }
    
    
    
    private func configure() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(linkToStory)
        //accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding*2),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            linkToStory.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            linkToStory.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            linkToStory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            
            
        ])
    }
    
}
