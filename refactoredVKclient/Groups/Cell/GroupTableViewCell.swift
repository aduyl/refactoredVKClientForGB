//
//  UniversalTableViewCell.swift
//  refactoredVKclient
//
//  Created by mac on 11.07.2021.
//

import UIKit

class GroupTableViewCell: UniversalTableViewCell {
    var group: Groups?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if let gr = group {
            configure(group: gr)
        }
        configureUI()
        addGestureRecognizerToAvatarImage()
    }
    
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    func configure(group: Groups) {
        avatarImageView.image = group.avatar
        nameLabel.text = group.name
        propertyLabel.text = group.description
    }
}
