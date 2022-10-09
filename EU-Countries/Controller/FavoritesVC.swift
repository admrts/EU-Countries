//
//  FavoritesVC.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit
import CoreData

class FavoritesVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let tableview: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(FavoriteCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    let coredataManager = CoredataManager()
    var coreDataModel: CoredataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureViewController()
        configureTableView()
    }
    
    //MARK: - willAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    func loadData() {
        coredataManager.loadData { dataModel in
            self.coreDataModel = dataModel
            self.tableview.reloadData()
        }
    }
    
    func configureViewController() {
        if ((coreDataModel?.nameArray.isEmpty) == nil) {
            self.presentEUAlertOnMainThred(title: "Favorite Country was not found", message: "Please go country list and select country than click add favorite ", buttonTitle: "Ok")
        }
        title = "Favorite Country"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.backgroundColor = .systemBackground
        tableview.dataSource = self
        tableview.delegate = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: - Tableview DataSource
extension FavoritesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataModel?.nameArray.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! FavoriteCell
        
        
        cell.nameLabel.text = coreDataModel?.nameArray[indexPath.row]
        let data = coreDataModel?.flagArray[indexPath.row]
        cell.flagImage.image = UIImage(data: data!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.tableview.frame.height/10)
    }
}

//MARK: - Tableview Delegate
extension FavoritesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = DetailVC()
        let i = indexPath.row
        destVC.flag.image = UIImage(data: coreDataModel?.flagArray[i] ?? Data())
        destVC.populationLabel.text = coreDataModel?.populationArray[i]
        destVC.capitalLabel.text = coreDataModel?.capitalArray[i]
        destVC.currencyLabel.text = coreDataModel?.currencyArray[i]
        destVC.languageLabel.text = coreDataModel?.languageArray[i]
        destVC.countryNameLabel.text = coreDataModel?.nameArray[i]
        navigationController?.pushViewController(destVC, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in
            let i = indexPath.row
            if self.coredataManager.deleteData(deleteObject: (self.coreDataModel?.idArray[i])!) {
                self.presentEUAlertOnMainThred(title: "Successful", message: "Country was deleted your favorite list", buttonTitle: "Ok")
                self.coreDataModel?.idArray.remove(at: i)
                self.coreDataModel?.capitalArray.remove(at: i)
                self.coreDataModel?.nameArray.remove(at: i)
                self.coreDataModel?.languageArray.remove(at: i)
                self.coreDataModel?.currencyArray.remove(at: i)
                self.coreDataModel?.populationArray.remove(at: i)
                self.coreDataModel?.flagArray.remove(at: i)
                self.tableview.reloadData()
            } else {
                self.presentEUAlertOnMainThred(title: "Unexpected Error", message: "Country wasn't deleted your favorite list", buttonTitle: "Ok")
            }
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
