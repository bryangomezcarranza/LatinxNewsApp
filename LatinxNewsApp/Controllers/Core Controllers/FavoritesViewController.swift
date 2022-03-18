//
//  FavoritesViewController.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var tableView = UITableView()
    var newsItem: NewsStory!
    var news: [NewsStory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNews()
    }
    
    func getNews() {
        PersistanceManager.retrieveFavorites { [weak self] result  in
           guard let self = self else { return }
            switch result {
            case .success(let news):
                
                if news.isEmpty {
                    self.showEmptyStateView(with: "No Favorites! Add one on the News screen", in: self.view)
                } else {
                    self.news = news
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        // To bring tableview on top after we populate our favorites. 
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.frame = view.bounds
        tableView.rowHeight = 80

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(SaveNewsCell.self, forCellReuseIdentifier: SaveNewsCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SaveNewsCell.reuseIdentifier, for: indexPath) as! SaveNewsCell
        let news = news[indexPath.row]
        cell.set(news: news)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersistanceManager.updateWith(news: news[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error  else {
                
                self.news.remove(at:  indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                return
            }
            
            print(error.localizedDescription)
        }
    }
    
}
