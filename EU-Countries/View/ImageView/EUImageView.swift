//
//  EUImageView.swift
//  EU-Countries
//
//  Created by Ali Demirtaş on 8.10.2022.
//

import UIKit

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
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
