//
//  CountriesCell.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit

class CountriesCell: UITableViewCell {

    static let reuseID = "FavoritesCell"
    
    let nameLabel = EULabel(textAlignment: .left, fontSize: 15, weight: .semibold)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure() {
        addSubview(nameLabel)
        selectionStyle = .none
        backgroundColor = .systemBackground
        nameLabel.layer.borderWidth = 0
        nameLabel.textColor = .label
        
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -padding)
            
        ])
    }

}
