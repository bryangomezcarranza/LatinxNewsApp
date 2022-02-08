//
//  LNStoryCellTableViewCell.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class LNStoryCell: UITableViewCell {
    
    static let reuseIdentifier = "LNStoryCell"
    
    var news: NewsStories!
    
    let titleLabel = LNTitleLabel(textAlignment: .left, fontSize: 16)
    let authorLabel = LNBodyLabel(textAlignment: .left, fontSize: 12)
    let upVoteLabel = LNSymbolView(symbol: UIImage(systemName: "arrow.up")!)
    let commentLabel = LNSymbolView(symbol: UIImage(systemName: "text.bubble")!)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsStories) {
        self.news = news
        
        titleLabel.text = news.title
        authorLabel.text = news.author
        upVoteLabel.set(text: String(news.points))
        commentLabel.set(text: String(news.numberOfComments))
        
        
    }
    
    private func configure() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
            
        ])
    }
}
