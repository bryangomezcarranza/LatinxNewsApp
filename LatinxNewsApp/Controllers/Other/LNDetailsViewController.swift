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
    
    var newsComments: [NewsStories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
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
    func configureViewController() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "\(String(describing: news.numberOfComments ?? 0) ) Comments"
        
        //saveToFavoritesButton
        let saveButton  = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
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
    
    @objc func saveButtonTapped() {
        // When I tapp the save button, I want to fet the information from that news. So I pass in the news. and then the news gets fetch with an ID.  Which is the end point.
        NetworkManager.shared.getNewsInfo(for: news) { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(_):
                
                let favorite = NewsStory(title: self.news.title)
                PersistanceManager.updateWith(news: favorite , actionType: .add) { error in
                    guard let  error = error else {
                        print("sucess")
                        return
                    }
                    print(error.rawValue)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
