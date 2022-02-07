//
//  LNHomeViewController.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class LNHomeViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureViewController()
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension LNHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Whats up"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
