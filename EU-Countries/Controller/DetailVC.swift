//
//  DetailVC.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit

class DetailVC: UIViewController {

    let countryNameLabel = EULabel(textAlignment: .center, fontSize: 30, weight: .heavy)
    let capitalLabel = EULabel(textAlignment: .center, fontSize: 23, weight: .semibold)
    let populationLabel = EULabel(textAlignment: .center, fontSize: 23, weight: .semibold)
    let languageLabel = EULabel(textAlignment: .center, fontSize: 23, weight: .semibold)
    let currencyLabel = EULabel(textAlignment: .center, fontSize: 23, weight: .semibold)
    
    let flag = EUImageView(named: "flag")
    var flagUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        flag.downloadImage(urlString: flagUrl)
        configureUI()
    }
    
    
    
    func configureUI() {
        view.addSubview(flag)
        view.addSubview(countryNameLabel)
        view.addSubview(capitalLabel)
        view.addSubview(populationLabel)
        view.addSubview(languageLabel)
        view.addSubview(currencyLabel)
        
        
        
        NSLayoutConstraint.activate([
            flag.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 12),
            flag.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            flag.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flag.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.4),
            
            countryNameLabel.topAnchor.constraint(equalTo: flag.bottomAnchor,constant: 10),
            countryNameLabel.leadingAnchor.constraint(equalTo: flag.leadingAnchor),
            countryNameLabel.trailingAnchor.constraint(equalTo: flag.trailingAnchor),
            countryNameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            capitalLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor,constant: 30),
            capitalLabel.leadingAnchor.constraint(equalTo: countryNameLabel.leadingAnchor),
            capitalLabel.trailingAnchor.constraint(equalTo: countryNameLabel.trailingAnchor),
            capitalLabel.heightAnchor.constraint(equalToConstant: 25),
            
            populationLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor,constant: 12),
            populationLabel.leadingAnchor.constraint(equalTo: capitalLabel.leadingAnchor),
            populationLabel.trailingAnchor.constraint(equalTo: capitalLabel.trailingAnchor),
            populationLabel.heightAnchor.constraint(equalToConstant: 25),
            
            languageLabel.topAnchor.constraint(equalTo: populationLabel.bottomAnchor,constant: 12),
            languageLabel.leadingAnchor.constraint(equalTo: populationLabel.leadingAnchor),
            languageLabel.trailingAnchor.constraint(equalTo: populationLabel.trailingAnchor),
            languageLabel.heightAnchor.constraint(equalToConstant: 25),
            
            currencyLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor,constant: 12),
            currencyLabel.leadingAnchor.constraint(equalTo: languageLabel.leadingAnchor),
            currencyLabel.trailingAnchor.constraint(equalTo: languageLabel.trailingAnchor),
            currencyLabel.heightAnchor.constraint(equalToConstant: 25),
            
        ])
    }
}
