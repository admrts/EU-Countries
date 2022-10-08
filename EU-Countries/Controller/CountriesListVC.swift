//
//  CountriesListVC.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit

class CountriesListVC: UIViewController {
    
    let tableview: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(CountriesCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    var names        = [String]()
    var flags        = [String]()
    var capitals     = [String]()
    var populations  = [Int]()
    var currency     = [String]()
    var language     = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureTableView()
        getCountries()
    }
    
    private func configureViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Countries"
        view.backgroundColor = .systemBackground
    }
    
    func getCountries() {
        NetworkManager.shared.getCountries {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let countries):
                for i in 0...countries.count - 1 {
                    self.names.append(countries[i].name)
                    self.flags.append(countries[i].flags.png)
                    self.capitals.append(countries[i].capital)
                    self.populations.append(countries[i].population)
                    
                    for a in 0..<1 {
                        self.currency.append(countries[i].currencies[a].name)
                        self.language.append(countries[i].languages[a].name)
                    }
                    
                }
                self.tableview.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    func configureTableView() {
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.backgroundColor = .systemBackground
        tableview.dataSource = self
        tableview.delegate = self
    }
}

extension CountriesListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names == [] ? 0 : names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! CountriesCell
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = DetailVC()
        destVC.flagUrl = flags[indexPath.row]
        destVC.countryNameLabel.text = names[indexPath.row]
        destVC.capitalLabel.text    = "Capital: \(capitals[indexPath.row])"
        destVC.populationLabel.text = "Population: \(String(populations[indexPath.row]))"
        destVC.languageLabel.text   = "Language: \(language[indexPath.row])"
        destVC.currencyLabel.text = "Currency: \(currency[indexPath.row])"
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    
}
