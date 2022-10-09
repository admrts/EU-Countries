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
    
    var nameArray = [String]()
    var flagArray = [Data]()
    var idArray = [UUID]()
    var capitalArray = [String]()
    var populationArray = [String]()
    var languageArray = [String]()
    var currencyArray = [String]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCountry()
        configureViewController()
        configureTableView()
       
    }
   
    //MARK: - willAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    func configureViewController() {
        if nameArray.count == 0 {
            presentEUAlertOnMainThred(title: "Favorite Country doesn't found", message: "Please go back and countries detail page and click add favorites button.", buttonTitle: "Ok")
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
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! FavoriteCell
        cell.nameLabel.text = nameArray[indexPath.row]
        let data = flagArray[indexPath.row]
        cell.flagImage.image = UIImage(data: data)
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
        destVC.flag.image = UIImage(data: flagArray[i])
        destVC.populationLabel.text = populationArray[i]
        destVC.capitalLabel.text = capitalArray[i]
        destVC.currencyLabel.text = currencyArray[i]
        destVC.languageLabel.text = languageArray[i]
        destVC.countryNameLabel.text = nameArray[i]
        navigationController?.pushViewController(destVC, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { _, _, _ in
            let i = indexPath.row
            self.deleteCountry(deleteObject: self.idArray[i])
            self.idArray.remove(at: i)
            self.capitalArray.remove(at: i)
            self.nameArray.remove(at: i)
            self.languageArray.remove(at: i)
            self.currencyArray.remove(at: i)
            self.populationArray.remove(at: i)
            self.flagArray.remove(at: i)
            self.tableview.reloadData()
        }
        deleteAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [deleteAction
                                                    ])
    }
}

extension FavoritesVC {
    func loadCountry() {
        nameArray.removeAll()
        flagArray.removeAll()
        idArray.removeAll()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteCountry")
        request.returnsObjectsAsFaults = false
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let countries = try context.fetch(request) as! [NSManagedObject]
            for country in countries {
                let name = country.value(forKey: "name") as! String
                let flag = country.value(forKey: "flag") as! Data
                let capital = country.value(forKey: "capital") as! String
                let population = country.value(forKey: "population") as! String
                let language = country.value(forKey: "language") as! String
                let currency = country.value(forKey: "currency") as! String
                let id = country.value(forKey: "id") as! UUID
                nameArray.append(name)
                flagArray.append(flag)
                capitalArray.append(capital)
                populationArray.append(population)
                languageArray.append(language)
                currencyArray.append(currency)
                idArray.append(id)
            }
        }catch {
            print(error.localizedDescription)
        }
    }
    func deleteCountry(deleteObject: UUID){
        let idString = deleteObject.uuidString
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteCountry")
        request.predicate = NSPredicate(format: "id = %@", idString)
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject] {
                context.delete(result)
                try context.save()
                presentEUAlertOnMainThred(title: "Succes", message: "Deleted country", buttonTitle: "Ok")
            }
            
        }catch {
            print("Delete error \(error)")
        }
    }
}
