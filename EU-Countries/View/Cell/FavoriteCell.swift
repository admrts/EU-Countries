//
//  FavoriteCell.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 9.10.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoritesCell"
    
    let nameLabel = EULabel(textAlignment: .left, fontSize: 15, weight: .semibold)
    let flagImage = EUImageView(named: "flag")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        addSubview(flagImage)
        addSubview(nameLabel)
        selectionStyle = .none
        backgroundColor = .systemBackground
        nameLabel.layer.borderWidth = 0
        nameLabel.textColor = .label
        
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            flagImage.topAnchor.constraint(equalTo: topAnchor,constant: padding),
            flagImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            flagImage.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -padding),
            flagImage.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.15),
            flagImage.heightAnchor.constraint(equalTo: flagImage.widthAnchor,multiplier: 0.70),
            
            nameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor,constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            
        ])
    }
}
