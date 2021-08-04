//
//  UniversalTableViewCell.swift
//  refactoredVKclient
//
//  Created by mac on 11.07.2021.
//

import UIKit

class UniversalTableViewCell: UITableViewCell {
    var group: tableCellDataClass? {
        didSet{
            guard let groupItem = group else {return}
            if let name = groupItem.name{
                avatarImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let groupDescription = groupItem.itemProreties{
                propertyLabel.text = "\(groupDescription)"
            }
        }
    }
    var saveGroup: tableCellDataClass?
    let avatarImageView: UIImageView = {
     let img = UIImageView()
     img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
     img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
     img.layer.cornerRadius = 35
     img.clipsToBounds = true
     return img
     }()
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let propertyLabel:UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        saveGroup = group
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(avatarImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(propertyLabel)
        self.contentView.addSubview(containerView)
        avatarImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.avatarImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        propertyLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        propertyLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        propertyLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
    }

     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
   
}
