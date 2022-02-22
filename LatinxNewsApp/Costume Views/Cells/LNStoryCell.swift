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
    let timeOfPost = LNSymbolView(symbol: UIImage(systemName: "clock")!)
    let footerStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        configureFooterStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsStories) {
        self.news = news
        
        titleLabel.text = news.title
        authorLabel.text = "By: \(news.author)"
        upVoteLabel.set(text: String(news.points!))
        commentLabel.set(text: String(news.numberOfComments!))
        timeOfPost.set(text: Date.timeSinceDateString(news.datePosted.toDate(withFormat: news.datePosted))())
    }
    
    private func configure() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(footerStackView)
        
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            footerStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 11),
            footerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            footerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
            
        ])
    }
    
    private func configureFooterStackView() {
        // StackView is layedout to be Horizontal with spacing of 10.
        footerStackView.axis = .horizontal
        footerStackView.spacing = 10
        
        footerStackView.addArrangedSubview(upVoteLabel)
        footerStackView.addArrangedSubview(commentLabel)
        footerStackView.addArrangedSubview(timeOfPost)
    }
}
