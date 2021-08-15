//
//  UniversalTableViewCell.swift
//  refactoredVKclient
//
//  Created by mac on 11.07.2021.
//

import UIKit

final class GroupTableViewCell: UITableViewCell {
    lazy var avatarImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 45
        img.clipsToBounds = true
     return img
     }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var propertyLabel:UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(group: Group) {
        let imgURL = URL(string: group.avatar)
        avatarImageView.kf.setImage(with: imgURL)
        nameLabel.text = group.name
        propertyLabel.text = group.groupDescription
    }
    
    private func configureUI() {
        self.contentView.addSubview(avatarImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(propertyLabel)
        self.contentView.addSubview(containerView)
        avatarImageView.frame = CGRect(x: 0, y: 5, width: 90, height: 90)
        containerView.frame = CGRect(x: 100, y: 0, width: self.contentView.frame.width - 100, height: self.contentView.frame.height)
        nameLabel.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width - 100, height: self.contentView.frame.height / 2)
        propertyLabel.frame = CGRect(x: 0, y: self.contentView.frame.height / 2, width: self.contentView.frame.width - 100, height: self.contentView.frame.height / 2)
        addGestureRecognizerToAvatarImage()
    }
    
    private func addGestureRecognizerToAvatarImage() {
        let recognaizer = UITapGestureRecognizer(target: self, action: #selector(imageHasBeenTapped))
        self.avatarImageView.isUserInteractionEnabled = true
        self.avatarImageView.addGestureRecognizer(recognaizer)
    }
    
    @objc private func imageHasBeenTapped() {
        let sizeWidth = self.avatarImageView.frame.width
        let sizeHeigth = self.avatarImageView.frame.height
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        self.avatarImageView.frame = CGRect(x: 1, y: 1, width: sizeWidth * 0.9, height: sizeHeigth * 0.9)
                       })
        UIView.animate(withDuration: 0.4,
                       delay: 0.3,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.4,
                       options: [],
                       animations: {
                        self.avatarImageView.frame = CGRect(x: 0, y: 5, width: sizeWidth, height: sizeHeigth)
                       })
    }
}
