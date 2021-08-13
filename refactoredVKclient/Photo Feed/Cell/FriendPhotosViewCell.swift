//
//  FriendPhotosViewCell.swift
//  refactoredVKclient
//
//  Created by mac on 29.07.2021.
//

import UIKit

class FriendPhotosViewCell: UICollectionViewCell {
    static let identifier = "FriendPhotosViewCell"
    private var isLiked = true
    var likeCount = 0
    var avatar: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = img.layer.frame.height / 2
        return img
    }()
    var userName: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 20)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    var userPhoto: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    var likeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(systemName: "heart"), for: .normal)
        button.tintColor = UIColor(red: 255/255, green: 102/255, blue: 133/255, alpha: 1)
        return button
    }()
    var likeLabel: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 17)
        lable.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(userName: String, avatar: String, photo: PostPhoto) {
        let imgURL = URL(string: avatar)
        self.avatar.kf.setImage(with: imgURL)
        self.userName.text = userName
        let photoURL = URL(string: photo.photo)
        self.userPhoto.kf.setImage(with: photoURL)
        userPhoto.isUserInteractionEnabled = true
        likeCount = photo.likes
        likeLabel.text = "\(likeCount) likes"
        likeButton.addTarget(self, action: #selector(didPressLikeButton), for: .touchUpInside)
        
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
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(avatarContainer)
        self.contentView.addSubview(userPhoto)
        self.contentView.addSubview(likeContainer)
        avatarContainer.frame = CGRect(x: 20,
                                       y: 10,
                                       width: self.bounds.width - 40,
                                       height: self.bounds.height * 0.12)
        userPhoto.frame = CGRect(x: 20,
                                 y: self.frame.height * 0.12 + 5,
                                 width: self.bounds.width - 40,
                                 height: self.bounds.height * 0.77)
        likeContainer.frame = CGRect(x: 20,
                                     y: bounds.height * 0.9,
                                     width: bounds.width - 40,
                                     height: bounds.height * 0.1)
        avatarContainer.addSubview(avatar)
        avatarContainer.addSubview(userName)
        avatar.frame = CGRect(x: 0,
                              y: 0,
                              width: avatarContainer.bounds.height * 0.8,
                              height: avatarContainer.bounds.height * 0.8)
        avatar.layer.cornerRadius = avatar.layer.frame.height / 2
        userName.frame = CGRect(x: avatarContainer.bounds.height,
                              y: 0,
                              width: avatarContainer.bounds.width - avatar.bounds.width,
                              height: avatarContainer.bounds.height * 0.8)
        likeContainer.addSubview(likeButton)
        likeContainer.addSubview(likeLabel)
        likeButton.frame = CGRect(x: 0,
                                  y: 0,
                                  width: likeContainer.bounds.height * 0.5,
                                  height: likeContainer.bounds.height * 0.9)
        likeLabel.frame = CGRect(x: likeContainer.bounds.height * 0.65,
                                 y: 0,
                                 width: 200,
                                 height: likeContainer.bounds.height * 0.9)
    }
    @objc func didPressLikeButton(){
        if isLiked{
            self.likeButton.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            self.likeCount = likeCount + 1
        } else {
            self.likeButton.setImage(UIImage.init(systemName: "heart"), for: .normal)
            self.likeCount = likeCount - 1
        }
        UIView.transition(with: self.likeLabel,
                          duration: 0.3,
                          options: .transitionCrossDissolve, animations:{
                            self.likeLabel.text = "\(self.likeCount) likes"
                          })
        self.isLiked = !self.isLiked
    }
}

