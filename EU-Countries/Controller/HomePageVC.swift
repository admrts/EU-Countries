//
//  HomePageVC.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit

class HomePageVC: UIViewController {

    let flagImage = EUImageView(named: "flag")
    let seeButton = EUButton(color: .systemBlue, title: "See Countries", systemName: "arrow.right.square")
    let favoriteButton = EUButton(color: .systemPink, title: "Favorite Countries", systemName: "heart.circle")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
        actions()
    }
    
    func actions() {
        seeButton.addTarget(self, action: #selector(tappedSeeButton), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(tappedFavoriteButton), for: .touchUpInside)
    }
    @objc func tappedSeeButton() {
        navigationController?.pushViewController(CountriesListVC(), animated: true)
    }
    @objc func tappedFavoriteButton() {
        navigationController?.pushViewController(FavoritesVC(), animated: true)
    }
    
    func configureUI() {
        view.addSubview(flagImage)
        view.addSubview(seeButton)
        view.addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
            
            flagImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100),
            flagImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            flagImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImage.heightAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.35),
            
            seeButton.topAnchor.constraint(equalTo: flagImage.bottomAnchor,constant: 200),
            seeButton.leadingAnchor.constraint(equalTo: flagImage.leadingAnchor),
            seeButton.trailingAnchor.constraint(equalTo: flagImage.trailingAnchor),
            seeButton.heightAnchor.constraint(equalTo: seeButton.widthAnchor, multiplier: 0.25),
            
            favoriteButton.topAnchor.constraint(equalTo: seeButton.bottomAnchor,constant: 30),
            favoriteButton.leadingAnchor.constraint(equalTo: seeButton.leadingAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: seeButton.trailingAnchor),
            favoriteButton.heightAnchor.constraint(equalTo: seeButton.heightAnchor),
        ])
    }

}
