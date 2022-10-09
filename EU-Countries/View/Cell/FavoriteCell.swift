//
//  FavoriteCell.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 9.10.2022.
//

import UIKit

class FavoriteCell: UITableViewCell {

    
    let flagImage = EUImageView(named: "flag")
    let nameLabel = EULabel(textAlignment: .left, fontSize: 15, weight: .semibold)
    
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
        accessoryType = .disclosureIndicator
        backgroundColor = .systemBackground
        
        
        
        nameLabel.layer.borderWidth = 0
       
      
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            
            flagImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            flagImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: padding),
            flagImage.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.20),
            flagImage.heightAnchor.constraint(equalTo: flagImage.widthAnchor,multiplier: 0.60),
            
            
            nameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor,constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 17),
            
        ])
    }

}
