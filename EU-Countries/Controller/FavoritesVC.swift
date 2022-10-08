//
//  FavoritesVC.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit

class FavoritesVC: UIViewController {
    
    let tableview: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(FavoriteCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Favorite Country"
        configureTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    func configureTableView() {
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.backgroundColor = .systemBackground
        tableview.dataSource = self
        tableview.delegate = self
    }
}
extension FavoritesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! FavoriteCell
        cell.nameLabel.text = "Country"
        return cell
    }
}
