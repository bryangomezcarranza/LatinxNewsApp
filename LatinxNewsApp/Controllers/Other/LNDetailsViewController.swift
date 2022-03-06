//
//  LNDetailsViewController.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/22/22.
//

import UIKit

class LNDetailsViewController: UIViewController {
    
    let tableView = UITableView()
    
    var news: NewsStories!
    var newsID: String!
    var newsComments: [NewsStories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
        getComments()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let headerView = tableView.tableHeaderView else { return }
        let size = headerView.systemLayoutSizeFitting(CGSize(width: tableView.bounds.height, height: 0))
        
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
            tableView.layoutIfNeeded()
        }
    }
    
    func getComments() {
        NetworkManager.shared.fetchComments(ids: news.objectID) { result in
            switch result {
            case .success(let ids):
                DispatchQueue.main.async {
                    self.newsComments = ids.hits
                    
                    if self.newsComments.isEmpty {
                        let message = "This story doesn't have any comments, go comment!"
                        DispatchQueue.main.async {
                            self.showEmptyStateView(with: message, in: self.view)
                            return
                        }
                    }
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("There was an error: \(error)")
            }
        }
    }
    func configure() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "\(String(describing: news.numberOfComments ?? 0) ) Comments"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = LNTableHeader(news: news)
        
        tableView.register(LNCommentsTableViewCell.self, forCellReuseIdentifier: LNCommentsTableViewCell.reuseIdentifier)
    }
}

extension LNDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LNCommentsTableViewCell.reuseIdentifier, for: indexPath) as? LNCommentsTableViewCell else { return UITableViewCell() }
        let comments = newsComments[indexPath.row]
        cell.set(comment: comments)
        
        return cell
    }
    
}
