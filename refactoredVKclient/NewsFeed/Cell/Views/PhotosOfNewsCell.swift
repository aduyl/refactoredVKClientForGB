//
//  PhotosOfNewsCell.swift
//  refactoredVKclient
//
//  Created by mac on 16.09.2021.
//

import UIKit

class PhotosOfNewsCell: UIView {
    
    lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cat")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(frame: CGRect) {
        view.frame = frame
        view.addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
    
    }
    
    
    
}
