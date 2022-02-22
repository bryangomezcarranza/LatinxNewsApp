//
//  LNDetailsViewController.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/22/22.
//

import UIKit

class LNDetailsViewController: UIViewController {
    
    let tableView = UITableView()
    
   // var news: NewsStories!
    var newsID: String!
    var newsComments: [NewsStories] = []
    
    init(newsID: String) {
        super.init(nibName: nil, bundle: nil)
        self.newsID = newsID
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comments"
        configureTableView()
        
        
    }
    
    func getComments() {
        NetworkManager.shared.fetchComments(ids: newsID) { result in
            switch result {
            case .success(let ids):
                DispatchQueue.main.async {
                    self.newsComments = ids.hits
                    self.tableView.reloadData()
                    print(ids)
                }
            case .failure(let error):
                print("There was an error: \(error)")
            }
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LNCommentsTableViewCell.self, forCellReuseIdentifier: LNCommentsTableViewCell.reuseIdentifier)
    }
    
    func uopdateUI(with comments: [NewsStories]) {
        if self.newsComments.isEmpty {
            let message = "This story has no comments :("
            DispatchQueue.main.async {

            }
        }
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
