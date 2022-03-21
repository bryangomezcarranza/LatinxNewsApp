//
//  LNCommentsTableViewCell.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/22/22.
//

import UIKit

class LNCommentsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "LNStoryCell"
    
    var news: NewsStories!
    
    let commentTextLabel = LNTextView(fontSize: 12)
    let authorLabel = LNBodyLabel(textAlignment: .left, fontSize: 10)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(comment: NewsStories) {
        self.news = comment
        
        commentTextLabel.text = news.commentText
        commentTextLabel.textColor = .secondaryLabel
        
        
        
        authorLabel.text = "By \(news.author!)"
        authorLabel.textColor = .black

    }
    
    func configure() {
        contentView.addSubview(commentTextLabel)
        contentView.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            commentTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            commentTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            commentTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            //commentTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            authorLabel.topAnchor.constraint(equalTo: commentTextLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }

}
