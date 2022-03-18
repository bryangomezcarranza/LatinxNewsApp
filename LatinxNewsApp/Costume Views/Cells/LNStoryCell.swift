//
//  LNStoryCellTableViewCell.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

protocol linkTappedDelegate: AnyObject {
    func linkWasTapped(for linkNews: NewsStories)
}

class LNStoryCell: UITableViewCell {
    
    static let reuseIdentifier = "LNStoryCell"
    
    weak var delegate: linkTappedDelegate!
    
    var news: NewsStories!
    
    let linkButton = LNButton()
    let titleLabel = LNTitleLabel(textAlignment: .left, fontSize: 16)
    let authorLabel = LNBodyLabel(textAlignment: .left, fontSize: 12)
    let upVoteLabel = LNSymbolView(symbol: UIImage(systemName: "arrow.up")!)
    let commentLabel = LNSymbolView(symbol: UIImage(systemName: "text.bubble")!)
    let timeOfPost = LNSymbolView(symbol: UIImage(systemName: "clock")!)
    
    
    let footerStackView = UIStackView()
    let headerStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        configureFooterStackView()
        configureHeaderStackView()
        configureLinkButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsStories) {
        self.news = news
        
        linkButton.set(title: "Link")
        titleLabel.text = news.title
        authorLabel.text = "By: \(String(describing: news.author!))"
        upVoteLabel.set(text: String(news.points!))
        commentLabel.set(text: String(news.numberOfComments!))
        timeOfPost.set(text: Date.timeSinceDateString(news.datePosted.toDate(withFormat: news.datePosted))())
    }
    
    private func configureLinkButton() {
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
    }
    
    @objc func linkButtonTapped() {
        delegate.linkWasTapped(for: news)
    }
    
    private func configure() {
        contentView.addSubview(headerStackView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(footerStackView)
        
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            
            titleLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            footerStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 11),
            footerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            footerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
            
        ])
    }
    
    private func configureHeaderStackView() {
        headerStackView.axis = .horizontal
        headerStackView.spacing = 5
        
        
        headerStackView.addArrangedSubview(linkButton)
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
