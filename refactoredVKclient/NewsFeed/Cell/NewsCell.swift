//
//  NewsCell.swift
//  refactoredVKclient
//
//  Created by mac on 16.09.2021.
//

import UIKit

class NewsCell: UICollectionViewCell {
    static let identifier = "NewsCell"
    var authorView: AuthorOfNewsCell?
    var text: TextOfNewsInCell?
    var photos: PhotosOfNewsCell?
    var likes: LikesAndCommentsCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        self.authorView = AuthorOfNewsCell(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 50))
        self.text = TextOfNewsInCell(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 80))
        self.photos = PhotosOfNewsCell(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - 180))
        self.likes = LikesAndCommentsCell(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 50))
        configure()
        configureText()
        configureLikes()
        configurePhotos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        guard let authorView = authorView else { return }
        contentView.addSubview(authorView)
        authorView.translatesAutoresizingMaskIntoConstraints = false
        authorView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        authorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        authorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        authorView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        authorView.configure(frame: authorView.frame)
        
    }
    
    func configureText() {
        guard let text = text, let authorView = authorView else { return }
        contentView.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.topAnchor.constraint(equalTo: authorView.bottomAnchor).isActive = true
        text.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        text.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        text.heightAnchor.constraint(equalToConstant: 80).isActive = true
        text.configure(frame: text.bounds)
    }
    
    func configurePhotos() {
        if let text = text, let photos = photos, let likes = likes {
            contentView.addSubview(photos)
            photos.translatesAutoresizingMaskIntoConstraints = false
            photos.topAnchor.constraint(equalTo: text.bottomAnchor).isActive = true
            photos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            photos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
            photos.bottomAnchor.constraint(equalTo: likes.topAnchor).isActive = true
            photos.configure(frame: photos.bounds)
        }
    }
    
    func configureLikes() {
        guard let likes = likes else {return}
        contentView.addSubview(likes)
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        likes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        likes.heightAnchor.constraint(equalToConstant: 50).isActive = true
        likes.configure(frame: likes.bounds)
    }
    
}
