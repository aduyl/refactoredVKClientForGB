//
//  AuthorOfNewsCell.swift
//  refactoredVKclient
//
//  Created by mac on 14.09.2021.
//

import UIKit

class AuthorOfNewsCell: UIView {    
    lazy var authorAvatarImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .link
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var publicationTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "01.01.2021"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(authorAvatarImageView)
        view.addSubview(authorNameLabel)
        view.addSubview(publicationTimeLabel)
        
        authorAvatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        authorAvatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        authorAvatarImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        
        authorAvatarImageView.widthAnchor.constraint(equalTo: authorAvatarImageView.heightAnchor ).isActive = true
        authorAvatarImageView.layer.cornerRadius = view.frame.height * 0.4
        
        
        authorNameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        authorNameLabel.leadingAnchor.constraint(equalTo: authorAvatarImageView.trailingAnchor, constant: 10).isActive = true
        authorNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        authorNameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - view.frame.height).isActive = true
        
        publicationTimeLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor).isActive = true
        publicationTimeLabel.leadingAnchor.constraint(equalTo: authorAvatarImageView.trailingAnchor, constant: 10).isActive = true
        publicationTimeLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        publicationTimeLabel.widthAnchor.constraint(equalToConstant: view.frame.width - view.frame.height).isActive = true
        
    }
}
