//
//  EUButton.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import Foundation

import UIKit

class EUButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, title: String, systemName: String) {
        self.init(frame: .zero)
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.image = UIImage(systemName: systemName)
        configuration?.title = title
    }
     func configure() {
        configuration = .tinted()
         
        translatesAutoresizingMaskIntoConstraints = false
        configuration?.cornerStyle = .large
        configuration?.imagePlacement = .leading
       
    }
}
