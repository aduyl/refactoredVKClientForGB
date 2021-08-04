//
//  FriendPhotosViewCell.swift
//  refactoredVKclient
//
//  Created by mac on 29.07.2021.
//

import UIKit

class FriendPhotosViewCell: UICollectionViewCell {
    var user: tableCellDataClass? {
        didSet{
            guard let userItem = user else {
                return
            }
            if let name = userItem.name{
                avatar.image = UIImage(named: name)
                userName.text = name
                userPhoto.image = UIImage(named: name + String(index))
                likeLabel.text = "\(likeCount) likes"
                
            }
            
        }
    }
    static let identifier = "FriendPhotosViewCell"
    private var isLiked = false
    var index: Int = 0
    var likeCount = 0
    var avatar: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = img.frame.height / 2
        return img
    }()
    var userName: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 20)
        return lab
    }()
    var userPhoto: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    var likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(systemName: "heart"), for: .normal)
        button.addTarget(self, action: #selector(didPressLikeButton), for: .touchUpInside)
        return button
    }()
    var likeLabel: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 15)
        lable.textColor = .gray
        return lable
    }()
    let avatarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    let likeContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(user: tableCellDataClass, index: Int) {
        self.index = index
        self.user = user
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        avatar.image = nil
        userName.text = nil
        userPhoto.image = nil
        likeCount = 0
        likeLabel.text = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // add avatar to container
        avatarContainer.addSubview(avatar)
        //constraint avatar
        avatar.leadingAnchor.constraint(equalTo: avatarContainer.leadingAnchor, constant: 10).isActive = true
        avatar.topAnchor.constraint(equalTo: avatarContainer.topAnchor, constant: 10).isActive = true
        avatar.heightAnchor.constraint(equalTo: avatarContainer.heightAnchor, multiplier: 0.9).isActive = true
        avatar.widthAnchor.constraint(equalTo: avatarContainer.heightAnchor, multiplier: 0.9).isActive = true
        // add username to container
        avatarContainer.addSubview(userName)
        //constraint username
        userName.topAnchor.constraint(equalTo: avatarContainer.topAnchor, constant: 10).isActive = true
        userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        userName.trailingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 10).isActive = true
        // add and constraint container
        self.contentView.addSubview(avatarContainer)
        avatarContainer.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        avatarContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        avatarContainer.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor).isActive = true
        avatarContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        // add userPhoto and constraint it
        self.contentView.addSubview(userPhoto)
        userPhoto.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        userPhoto.topAnchor.constraint(equalTo: avatarContainer.bottomAnchor, constant: 10).isActive = true
        userPhoto.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        userPhoto.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10).isActive = true
        //add like container
        likeContainer.addSubview(likeButton)
        likeButton.topAnchor.constraint(equalTo: likeContainer.topAnchor, constant: 10).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: likeContainer.trailingAnchor, constant: 10).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        likeContainer.addSubview(likeLabel)
        likeLabel.topAnchor.constraint(equalTo: likeContainer.topAnchor, constant: 10).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10).isActive = true
        likeLabel.trailingAnchor.constraint(equalTo: likeContainer.trailingAnchor, constant: 10).isActive = true
        self.contentView.addSubview(likeContainer)
        likeContainer.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        likeContainer.topAnchor.constraint(equalTo: userPhoto.bottomAnchor, constant: 10).isActive = true
        likeContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        likeContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
    @objc func didPressLikeButton(){
        if isLiked{
            self.likeButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            self.likeCount = self.likeCount + 1
            self.likeLabel.text = "\(likeCount) likes"
        } else {
            self.likeButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
            self.likeCount = self.likeCount - 1
            self.likeLabel.text = "\(likeCount) likes"
        }
        self.isLiked = !self.isLiked
    }
}
