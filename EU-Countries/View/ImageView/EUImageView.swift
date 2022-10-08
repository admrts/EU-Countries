//
//  EUImageView.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit
import AlamofireImage
import Alamofire

class EUImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(named imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
        configure()
    }
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).response { response in
            if let _ = response.error { return }
            guard let rs = response.response, rs.statusCode == 200 else { return }
            guard let data = response.data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
