//
//  LNHomeViewController.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class LNHomeViewController: UIViewController {

    var tableView: UITableView!
    
    var news: [NewsStories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureViewController()
        getNews()
    }
    
    func getNews() {
        NetworkManager.shared.news {  [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let filterMostRecent = response.hits.sorted(by: {$0.datePosted > $1.datePosted})
                    self.news = filterMostRecent
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LNStoryCell.self, forCellReuseIdentifier: LNStoryCell.reuseIdentifier)
    }

}

extension LNHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LNStoryCell.reuseIdentifier, for: indexPath) as? LNStoryCell else { return UITableViewCell() }
        let news = news[indexPath.row]
        cell.set(news: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsComment = news[indexPath.row]
        let destVC = LNDetailsViewController(newsID: newsComment.objectID)
        navigationController?.pushViewController(destVC, animated: true)
    }
}
